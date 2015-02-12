//
//  ALHardware.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * This class check some hardware (and software) informations
 */
@interface ALHardware : NSObject

/*!
 Check the device model
 @return NSString with the device model
 */
+ (NSString *)deviceModel;

/*!
 Check the device name
 @return NSString with the device name
 */
+ (NSString *)deviceName;

/*!
 Check the system name
 @return NSString with the system name
 */
+ (NSString *)systemName;

/*!
 Check the system version
 @return NSString with the system version
 */
+ (NSString *)systemVersion;

/*!
 Check the screen width in pixel
 @return NSInteger value of the width of the screen
 */
+ (NSInteger)screenWidth;

/*!
 Check the screen height in pixel
 @return NSInteger value of the height of the screen
 */
+ (NSInteger)screenHeight;

/*!
 Check the screen brightness
 @return CGFloat value of the brightness of the screen
 */
+ (CGFloat)brightness;

/*!
 Get the device type
 @return NSString represents the platform type (ex. : iPhone 5)
 */
+ (NSString *)platformType;

/*!
 Get the boot time in hours, minutes and seconds
 @return NSString represents the boot time in hours, minutes and seconds
 */
+ (NSDate *)bootTime;

/*!
 Check for the proximity sensor
 @return YES if the proximity sensor exist, NO if it isn't
 */
+ (BOOL)proximitySensor;

/*!
 Check if the multitasking is enabled
 @return YES if the multitasking is enabled, NO if it isn't
 */
+ (BOOL)multitaskingEnabled;

// 1.2

/*!
 The sim type
 @return NSString with the sim type
 */
+ (NSString *)sim;

/*!
 The device's dimensions
 @return NSString with the dimensions
 */
+ (NSString *)dimensions;

/*!
 The weight of the device
 @return NSString with the weight of the device
 */
+ (NSString *)weight;

/*!
 The display type of the device
 @return NSString with the display type
 */
+ (NSString *)displayType;

/*!
 The display density
 @return NSString with the display density
 */
+ (NSString *)displayDensity;

/*!
 The WLAN type
 @return NSString with the WLAN type
 */
+ (NSString *)WLAN;

/*!
 The bluetooth version
 @return NSString with the bluetooth version
 */
+ (NSString *)bluetooth;

/*!
 Details about primary camera of the device
 @return NSString with details about primary camera
 */
+ (NSString *)cameraPrimary;

/*!
 Details about secondary camera of the device
 @return NSString with details about secondary camera
 */
+ (NSString *)cameraSecondary;

/*!
 The cpu of the device
 @return NSString with the cpu of the device
 */
+ (NSString *)cpu;

/*!
 The gpu of the device
 @return NSString with the gpu of the device
 */
+ (NSString *)gpu;

/*!
 Check for Siri
 @return YES if Siri is present, NO if it isn't
 */
+ (BOOL)siri;

/*!
 Check for the Touch ID
 @return YES if Touch ID is present, NO if it isn't
 */
+ (BOOL)touchID;

@end
