//
//  ALAccessory.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 22/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import <AudioToolbox/AudioToolbox.h>

/*!
 * This class detect if there are accessories plugged into the device
 */
@interface ALAccessory : NSObject

/*!
 Check if there are accessories plugged in
 @return YES if there are accessories plugged in, NO if there aren't
 */
+ (BOOL)accessoriesPluggedIn;

/*!
 Check the number of accessories plugged in
 @return NSInteger which represents the number of accessories plugged in
 */
+ (NSInteger)numberOfAccessoriesPluggedIn;

/*!
 Check if headphones is plugged in
 @return YES if headphones are plugged in, NO if it aren't
 */
+ (BOOL)isHeadphonesAttached;

@end
