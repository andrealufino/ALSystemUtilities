//
//  ALCarrier.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * This class provides method to get info about the carrier
 */
@interface ALCarrier : NSObject

/*!
 The carrier name
 @return NSString represents the carrier name
 */
+ (NSString *)carrierName;

/*!
 The ISO country code of the carrier
 @return NSString represents the ISO country code of the carrier
 */
+ (NSString *)carrierISOCountryCode;

/*!
 The carrier mobile country code
 @return NSString represents the mobile country code of the carrier
 */
+ (NSString *)carrierMobileCountryCode;

/*!
 The carrier mobile network code
 @return NSString represents the mobile network code
 */
+ (NSString *)carrierMobileNetworkCode;

/*!
 Check if the carrier allows VOIP
 @return YES if the carrier allows VOIP, NO if it isn't
 */
+ (BOOL)carrierAllowsVOIP;

@end
