//
//  ALNetwork.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * This class provide methods to get current IP address and check WiFi or 3G connection
 */
@interface ALNetwork : NSObject

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

/*!
 The BSSID of the network
 @return NSString represents the BSSID value
 */
+ (NSString *)BSSID;

/*!
 The SSID of the network
 @return NSString represents the SSID value
 */
+ (NSString *)SSID;

@end
