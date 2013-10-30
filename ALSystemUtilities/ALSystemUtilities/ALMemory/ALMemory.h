//
//  ALMemory.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

/*!
 * This class provides some informations about the memory of the device
 */
@interface ALMemory : NSObject

/*!
 Check the total memory of the device
 @return NSInteger value which represents the total memory
 */
+ (NSInteger)totalMemory;

/*!
 Check free memory
 @return CGFloat which represents the free memory
 */
+ (CGFloat)freeMemory;

/*!
 Check the used memory
 @return CGFloat which represents the used memory
 */
+ (CGFloat)usedMemory;

/*!
 Check the active memory
 @return CGFloat which represents the active memory of the device
 */
+ (CGFloat)activeMemory;

/*!
 Check wired memory
 @return CGFloat which represents the wired memory
 */
+ (CGFloat)wiredMemory;

/*!
 Check the inactive memory
 @return CGFloat which represents the inactive memory
 */
+ (CGFloat)inactiveMemory;

@end
