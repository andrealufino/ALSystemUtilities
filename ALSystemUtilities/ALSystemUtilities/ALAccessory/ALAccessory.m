//
//  ALAccessory.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 22/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALAccessory.h"

@implementation ALAccessory

+ (BOOL)accessoriesPluggedIn {
    int accessoryCount = [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] count];
    if (accessoryCount > 0)
        return YES;
    else
        return NO;
}

+ (NSInteger)numberOfAccessoriesPluggedIn {
    return [[[EAAccessoryManager sharedAccessoryManager] connectedAccessories] count];
}

// TODO: Da sviluppare ASSOLUTAMENTE
+ (BOOL)isHeadphonesAttached {
    return NO;
}

@end
