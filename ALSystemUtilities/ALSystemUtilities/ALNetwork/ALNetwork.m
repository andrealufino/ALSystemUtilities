//
//  ALNetwork.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALNetwork.h"

#define TEST_NUMBER 3
//#define URL @"https://www.google.com/images/icons/product/chrome-48.png" //This file size is 2kb, so if the test is performed 8 times the total size will be 16kb, acceptable
#define URL @"http://f.cl.ly/items/2j1N3k1u2h0D3R2o3k1h/Schermata_2013-09-04_alle_10.31.46.png" // This file size is 65kb
//#define URL @"http://f.cl.ly/items/2M1F2W3G2s0s203R2U3T/2013-09-12%2017.58.06.jpg" // This file size is 2.4mb

@interface ALNetwork ()

@property CGFloat dataLenght, downloadSpeed;
@property NSTimeInterval timeIntervalAtStart, timeIntervalAtEnd, timeForDownload;
@property NSURLConnection *urlConnection;
@property BOOL requestStarted, requestFinished;
@property NSInteger testCount;
@property CGFloat sumOfDownloadSpeedForAverage;

@end

@implementation ALNetwork

#pragma mark - Singleton methods

+ (ALNetwork *)sharedInstance {
	static ALNetwork *_shared;
	if(!_shared) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^ {
			_shared = [[super allocWithZone:nil] init];
		});
	}
	return _shared;
}

+ (id)allocWithZone:(NSZone *)zone  { return [self sharedInstance]; }
- (id)copyWithZone:(NSZone *)zone   { return self;          }
#if (!__has_feature(objc_arc))
- (id)retain                        { return self;          }
- (unsigned)retainCount             { return UINT_MAX;      }
- (void)release                     {                       }
- (id)autorelease                   { return self;          }
#endif

#pragma mark - Class methods

// This code is an answer to
// this question :
// http://stackoverflow.com/questions/7072989/iphone-ipad-how-to-get-my-ip-address-programmatically
// by David H
+ (NSString *)currentIPAddress {
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    NSString *wifiAddress = nil;
    NSString *cellAddress = nil;
    
    // retrieve the current interfaces - returns 0 on success
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
            if(sa_type == AF_INET || sa_type == AF_INET6) {
                NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
                NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]; // pdp_ip0
                //NSLog(@"NAME: \"%@\" addr: %@", name, addr); // see for yourself
                
                if([name isEqualToString:@"en0"])
                    // Interface is the wifi connection on the iPhone
                    wifiAddress = addr;
                else
                    if([name isEqualToString:@"pdp_ip0"])
                        // Interface is the cell connection on the iPhone
                        cellAddress = addr;
                    
            }
            temp_addr = temp_addr->ifa_next;
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    NSString *addr = wifiAddress ? wifiAddress : cellAddress;
    return addr ? addr : @"0.0.0.0";
}

+ (BOOL)connectedViaWiFi {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (status == ReachableViaWiFi)
        return YES;
    else
        return NO;
}

+ (BOOL)connectedVia3G {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (status == ReachableViaWWAN)
        return YES;
    else
        return NO;
}

+ (NSString *)macAddress {
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    // Setup the management Information Base (mib)
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    // With all configured interfaces requested, get handle index
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
        errorFlag = @"if_nametoindex failure";
    else {
        // Get the size of the data available (store in len)
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
            errorFlag = @"sysctl mgmtInfoBase failure";
        else {
            // Alloc memory based on above call
            if ((msgBuffer = malloc(length)) == NULL)
                errorFlag = @"buffer allocation failure";
            else {
                // Get system information, store in buffer
                if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    
    // Befor going any further...
    if (errorFlag != NULL) {
        NSLog(@"Error: %@", errorFlag);
        return errorFlag;
    }
    
    // Map msgbuffer to interface message structure
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    
    // Map to link-level socket structure
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    
    // Copy link layer address data in socket structure to an array
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    
    // Read from char array into a string object, into traditional Mac address format
    NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
    //NSLog(@"Mac Address: %@", macAddressString);
    
    // Release the buffer memory
    free(msgBuffer);
    
    return macAddressString;
}

// Credits to Shmoopi LLC, SystemServiceDemo
// Get the External IP Address
+ (NSString *)externalIPAddress {
    // Check if we have an internet connection then try to get the External IP Address
    if (![self connectedViaWiFi] && ![self connectedVia3G]) {
        // Not connected to anything, return nil
        return nil;
    }
    
    // Get the external IP Address based on dynsns.org
    NSError *error = nil;
    NSString *theIpHtml = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.dyndns.org/cgi-bin/check_ip.cgi"]
                                                   encoding:NSUTF8StringEncoding
                                                      error:&error];
    if (!error) {
        NSUInteger  an_Integer;
        NSArray *ipItemsArray;
        NSString *externalIP;
        NSScanner *theScanner;
        NSString *text = nil;
        
        theScanner = [NSScanner scannerWithString:theIpHtml];
        
        while ([theScanner isAtEnd] == NO) {
            
            // find start of tag
            [theScanner scanUpToString:@"<" intoString:NULL] ;
            
            // find end of tag
            [theScanner scanUpToString:@">" intoString:&text] ;
            
            // replace the found tag with a space
            //(you can filter multi-spaces out later if you wish)
            theIpHtml = [theIpHtml stringByReplacingOccurrencesOfString:
                         [ NSString stringWithFormat:@"%@>", text]
                                                             withString:@" "] ;
            ipItemsArray = [theIpHtml  componentsSeparatedByString:@" "];
            an_Integer = [ipItemsArray indexOfObject:@"Address:"];
            externalIP =[ipItemsArray objectAtIndex:++an_Integer];
        }
        // Check that you get something back
        if (externalIP == nil || externalIP.length <= 0) {
            // Error, no address found
            return nil;
        }
        // Return External IP
        return externalIP;
    } else {
        // Error, no address found
        return nil;
    }
}

// Credits to Shmoopi LLC, SystemServiceDemo
// Get the cell IP address
+ (NSString *)cellIPAddress {
    // Set a string for the address
    NSString *IPAddress;
    // Set up structs to hold the interfaces and the temporary address
    struct ifaddrs *Interfaces;
    struct ifaddrs *Temp;
    struct sockaddr_in *s4;
    char buf[64];
    
    // If it's 0, then it's good
    if (!getifaddrs(&Interfaces))
    {
        // Loop through the list of interfaces
        Temp = Interfaces;
        
        // Run through it while it's still available
        while(Temp != NULL)
        {
            // If the temp interface is a valid interface
            if(Temp->ifa_addr->sa_family == AF_INET)
            {
                // Check if the interface is Cell
                if([[NSString stringWithUTF8String:Temp->ifa_name] isEqualToString:@"pdp_ip0"])
                {
                    s4 = (struct sockaddr_in *)Temp->ifa_addr;
                    
                    if (inet_ntop(Temp->ifa_addr->sa_family, (void *)&(s4->sin_addr), buf, sizeof(buf)) == NULL) {
                        // Failed to find it
                        IPAddress = nil;
                    } else {
                        // Got the Cell IP Address
                        IPAddress = [NSString stringWithUTF8String:buf];
                    }
                }
            }
            
            // Set the temp value to the next interface
            Temp = Temp->ifa_next;
        }
    }
    
    // Free the memory of the interfaces
    freeifaddrs(Interfaces);
    
    // Check to make sure it's not empty
    if (IPAddress == nil || IPAddress.length <= 0) {
        // Empty, return not found
        return nil;
    }
    
    // Return the IP Address of the WiFi
    return IPAddress;
}

+ (NSString *)WiFiNetmaskAddress {
    // Set up the variable
    struct ifreq afr;
    // Copy the string
    strncpy(afr.ifr_name, [@"en0" UTF8String], IFNAMSIZ-1);
    // Open a socket
    int afd = socket(AF_INET, SOCK_DGRAM, 0);
    
    // Check the socket
    if (afd == -1) {
        // Error, socket failed to open
        return nil;
    }
    
    // Check the netmask output
    if (ioctl(afd, SIOCGIFNETMASK, &afr) == -1) {
        // Error, netmask wasn't found
        // Close the socket
        close(afd);
        // Return error
        return nil;
    }
    
    // Close the socket
    close(afd);
    
    // Create a char for the netmask
    char *netstring = inet_ntoa(((struct sockaddr_in *)&afr.ifr_addr)->sin_addr);
    
    // Create a string for the netmask
    NSString *Netmask = [NSString stringWithUTF8String:netstring];
    
    // Check to make sure it's not nil
    if (Netmask == nil || Netmask.length <= 0) {
        // Error, netmask not found
        return nil;
    }
    
    // Return successful
    return Netmask;
}

+ (NSString *)WiFiBroadcastAddress {
    // Set up strings for the IP and Netmask
    NSString *IPAddress = [self currentIPAddress];
    NSString *NMAddress = [self WiFiNetmaskAddress];
    
    // Check to make sure they aren't nil
    if (IPAddress == nil || IPAddress.length <= 0) {
        // Error, IP Address can't be nil
        return nil;
    }
    if (NMAddress == nil || NMAddress.length <= 0) {
        // Error, NM Address can't be nil
        return nil;
    }
    
    // Check the formatting of the IP and NM Addresses
    NSArray *IPCheck = [IPAddress componentsSeparatedByString:@"."];
    NSArray *NMCheck = [NMAddress componentsSeparatedByString:@"."];
    
    // Make sure the IP and NM Addresses are correct
    if (IPCheck.count != 4 || NMCheck.count != 4) {
        // Incorrect IP Addresses
        return nil;
    }
    
    // Set up the variables
    NSUInteger IP = 0;
    NSUInteger NM = 0;
    NSUInteger CS = 24;
    
    // Make the address based on the other addresses
    for (NSUInteger i = 0; i < 4; i++, CS -= 8) {
        IP |= [[IPCheck objectAtIndex:i] intValue] << CS;
        NM |= [[NMCheck objectAtIndex:i] intValue] << CS;
    }
    
    // Set it equal to the formatted raw addresses
    NSUInteger BA = ~NM | IP;
    
    // Make a string for the address
    NSString *BroadcastAddress = [NSString stringWithFormat:@"%d.%d.%d.%d", (BA & 0xFF000000) >> 24,
                                  (BA & 0x00FF0000) >> 16, (BA & 0x0000FF00) >> 8, BA & 0x000000FF];
    
    // Check to make sure the string is valid
    if (BroadcastAddress == nil || BroadcastAddress.length <= 0) {
        // Error, no address
        return nil;
    }
    
    // Return Successful
    return BroadcastAddress;
}

// FIXME: The download speed methods don't work correctly.
// Da rivedere questi metodi sulla velocità di download.
// Non funzionano correttamente, sopratutto su iOS 7.
#pragma mark - Instance methods

- (void)downloadSpeedInKbPerSec {
    if (!self.requestStarted)
        [self startConnectionSpeedTest];
}

- (void)startConnectionSpeedTest {
    self.requestStarted = YES;
    self.requestFinished = NO;
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:URL]];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [urlConnection start];
    self.timeIntervalAtStart = [NSDate timeIntervalSinceReferenceDate];
}

#pragma mark - NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.dataLenght += [data length];
    self.requestFinished = NO;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.timeIntervalAtEnd = [NSDate timeIntervalSinceReferenceDate];
    self.timeForDownload = self.timeIntervalAtEnd - self.timeIntervalAtStart;
    NSLog(@":: %f ::",self.dataLenght);
    self.downloadSpeed = (self.dataLenght / self.timeForDownload) / 1024; //in Kb/s
    self.sumOfDownloadSpeedForAverage += self.downloadSpeed;
    self.requestFinished = YES;
    self.requestStarted = NO;
    if (self.testCount == TEST_NUMBER) {
        CGFloat avgDownloadSpeed = self.sumOfDownloadSpeedForAverage / TEST_NUMBER;
        [self.delegate downloadSpeedTestFinished:[NSString stringWithFormat:@"%.2f Kb/s",avgDownloadSpeed]];
    } else {
        NSLog(@"[ALNetwork] DOWNLOAD SPEED = %f",self.downloadSpeed);
        self.dataLenght = 0.0f;
        self.timeForDownload = 0.0f;
        self.timeIntervalAtStart = 0.0;
        self.timeIntervalAtEnd = 0.0;
        [self downloadSpeedInKbPerSec];
        self.testCount++;
    }
}

@end
