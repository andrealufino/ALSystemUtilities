//
//  ALJailbreak.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * This class detects if the device is jailbroken. The class check the presence or less of the Cydia.app
 */
@interface ALJailbreak : NSObject

/*!
 Check if the device is jailbroken
 @return YES if the device is jailbroken, NO if it isn't
 */
+ (BOOL)isJailbroken;

@end
