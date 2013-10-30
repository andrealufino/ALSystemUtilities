//
//  ALJailbreak.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALJailbreak.h"

@implementation ALJailbreak

+ (BOOL)isJailbroken {
//    NSString *filePath = @"/Applications/Cydia.app";
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
//        return YES;
//    else
//        return NO;
    FILE *f = fopen("/bin/bash", "r");
    BOOL isJailbroken = NO;
    if (f != NULL)
        // Device is jailbroken
        isJailbroken = YES;
    else
        // Device isn't jailbroken
        isJailbroken = NO;
    
    fclose(f);
    
    return isJailbroken;
}

@end
