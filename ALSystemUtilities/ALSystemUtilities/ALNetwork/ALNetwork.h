//
//  ALNetwork.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "Reachability.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/ioctl.h>

@protocol ALNetworkDelegate <NSObject>

/*!
 Called when the connection speed test has finished
 @param  downloadSpeedInKbPerSeconds NSString value which represents the speed connection
 */
- (void)downloadSpeedTestFinished:(NSString *)downloadSpeedInKbPerSeconds;

@end

/*!
 * This class provide methods to get current IP address and check WiFi or 3G connection
 */
@interface ALNetwork : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

/*!
 * The delegate of the object
 */
@property id <ALNetworkDelegate> delegate;

+ (ALNetwork *)sharedInstance;

/*!
 Get the current IP address
 @return NSString value which represents the current IP address
 */
+ (NSString *)currentIPAddress;

/*!
 Check if the device is connected to WiFi
 @return YES if the device is connected to WiFi network, NO if it isn't
 */
+ (BOOL)connectedViaWiFi;

/*!
 Check if the device is connected to 3G
 @return YES if the device is connected to 3G network, NO if it isn't
 */
+ (BOOL)connectedVia3G;

/*!
 Get the MAC Address of the iPhone
 @return NSString represents the MAC address
 */
+ (NSString *)macAddress;

/*!
 Start the test for the speed of the connection
 */
- (void)downloadSpeedInKbPerSec;

/*!
 * The external IP Address
 @return NSString represents the external IP address
 */
+ (NSString *)externalIPAddress;

/*!
 * The cell IP address
 @return NSString represents the cell IP address
 */
+ (NSString *)cellIPAddress;

/*!
 * The WiFi netmask address
 @return NSString represents the WiFi netmask address
 */
+ (NSString *)WiFiNetmaskAddress;

/*!
 * The WiFi broadcast address
 @return NSString represents the WiFi broadcast address
 */
+ (NSString *)WiFiBroadcastAddress;

@end
