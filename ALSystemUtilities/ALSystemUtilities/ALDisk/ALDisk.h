//
//  ALDisk.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 19/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * Check total and free disk space
 */
@interface ALDisk : NSObject

/*!
 The total disk space
 @return String which represents the total disk space
 */
+ (NSString *)totalDiskSpace;

/*!
 The free disk space
 @return String which represents the free disk space
 */
+ (NSString *)freeDiskSpace;

/*!
 The used disk space
 @return String which represents the used disk space
 */
+ (NSString *)usedDiskSpace;

/*!
 The total disk space in bytes
 @return CGFloat represents the total disk space in bytes
 */
+ (CGFloat)totalDiskSpaceInBytes;

/*!
 The free disk space in bytes
 @return CGFloat represents the free disk space in bytes
 */
+ (CGFloat)freeDiskSpaceInBytes;

/*!
 The used disk space in bytes
 @return CGFloat represents the used disk space in bytes
 */
+ (CGFloat)usedDiskSpaceInBytes;

@end
