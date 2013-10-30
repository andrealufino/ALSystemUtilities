//
//  ALLocalization.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * This class provides some informations about the localization of the device
 */
@interface ALLocalization : NSObject

/*!
 The language of the system
 @return NSString representing the language
 */
+ (NSString *)language;

/*!
 The current time zone
 @return NSString representing the time zone
 */
+ (NSString *)timeZone;

/*!
 The currency symbol of the system
 @return NSString representing the current currency symbol
 */
+ (NSString *)currencySymbol;

/*!
 The currency code of the system
 @return NSString representing the currency code
 */
+ (NSString *)currencyCode;

/*!
 The country
 @return NSString representing the country of the system
 */
+ (NSString *)country;

/*!
 The measurement system
 @return NSString representing the measurement system
 */
+ (NSString *)measurementSystem;

@end
