//
//  ALHardware.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALHardware.h"

#define MIB_SIZE 2

@interface ALHardware ()

+ (NSDictionary *)infoForDevice;

@end

@implementation ALHardware

#pragma mark - Info for device

+ (NSDictionary *)infoForDevice {
    NSString *device = [ALHardware platformType];
    NSDictionary *info = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[device stringByReplacingOccurrencesOfString:@" " withString:@""] ofType:@"plist"]];
    return info;
}

#pragma mark - Methods

+ (NSString *)deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)deviceName {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)systemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSInteger)screenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (NSInteger)screenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGFloat)brightness {
    return [[UIScreen mainScreen] brightness]*100;
}

+ (NSString *)platformType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *result = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *type;
    if ([result isEqualToString:@"i386"])           type = @"Simulator";
    if ([result isEqualToString:@"iPod3,1"])        type = @"iPod Touch 3";
    if ([result isEqualToString:@"iPod4,1"])        type = @"iPod Touch 4";
    if ([result isEqualToString:@"iPod5,1"])        type = @"iPod Touch 5";
    if ([result isEqualToString:@"iPhone2,1"])      type = @"iPhone 3Gs";
    if ([result isEqualToString:@"iPhone3,1"])      type = @"iPhone 4";
    if ([result isEqualToString:@"iPhone4,1"])      type = @"iPhone 4s";
    if ([result isEqualToString:@"iPhone5,1"]   ||
        [result isEqualToString:@"iPhone5,2"])      type = @"iPhone 5";
    if ([result isEqualToString:@"iPad2,1"]     ||
        [result isEqualToString:@"iPad2,2"]     ||
        [result isEqualToString:@"iPad2,3"])        type = @"iPad 2";
    if ([result isEqualToString:@"iPad3,1"]     ||
        [result isEqualToString:@"iPad3,2"]     ||
        [result isEqualToString:@"iPad3,3"])        type = @"iPad 3";
    if ([result isEqualToString:@"iPad3,4"]     ||
        [result isEqualToString:@"iPad3,5"]     ||
        [result isEqualToString:@"iPad3,6"])         type = @"iPad 4";
    if ([result isEqualToString:@"iPad2,5"]     ||
        [result isEqualToString:@"iPad2,6"]     ||
        [result isEqualToString:@"iPad2,7"])        type = @"iPad Mini";
    if ([result isEqualToString:@"iPhone6,1"]   ||
        [result isEqualToString:@"iPhone6,2"])      type = @"iPhone 5s";
    if ([result isEqualToString:@"iPhone5,3"]   ||
        [result isEqualToString:@"iPhone5,4"])      type = @"iPhone 5c";
    
    return type;
}

+ (NSString *)bootTime {
    NSInteger ti = (NSInteger)[[NSProcessInfo processInfo] systemUptime];
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
}

+ (BOOL)proximitySensor {
    // Make a Bool for the proximity Sensor
    BOOL proximitySensor = NO;
    // Is the proximity sensor enabled?
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setProximityMonitoringEnabled:)]) {
        // Create a UIDevice variable
        UIDevice *device = [UIDevice currentDevice];
        // Turn the sensor on, if not already on, and see if it works
        if (device.proximityMonitoringEnabled != YES) {
            // Sensor is off
            // Turn it on
            [device setProximityMonitoringEnabled:YES];
            // See if it turned on
            if (device.proximityMonitoringEnabled == YES) {
                // It turned on!  Turn it off
                [device setProximityMonitoringEnabled:NO];
                // It works
                proximitySensor = YES;
            } else {
                // Didn't turn on, no good
                proximitySensor = NO;
            }
        } else {
            // Sensor is already on
            proximitySensor = YES;
        }
    }
    // Return on or off
    return proximitySensor;
}

+ (BOOL)multitaskingEnabled {
    // Is multitasking enabled?
    if ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)]) {
        // Create a bool
        BOOL multitaskingSupported = [UIDevice currentDevice].multitaskingSupported;
        // Return the value
        return multitaskingSupported;
    } else {
        // Doesn't respond to selector
        return NO;
    }
}

// 1.2

+ (NSString *)sim {
    return [[self infoForDevice] objectForKey:@"sim"];
}

+ (NSString *)dimensions {
    return [[self infoForDevice] objectForKey:@"dimensions"];
}

+ (NSString *)weight {
    return [[self infoForDevice] objectForKey:@"weight"];
}

+ (NSString *)displayType {
    return [[self infoForDevice] objectForKey:@"display-type"];
}

+ (NSString *)displayDensity {
    return [[self infoForDevice] objectForKey:@"display-density"];
}

+ (NSString *)WLAN {
    return [[self infoForDevice] objectForKey:@"WLAN"];
}

+ (NSString *)bluetooth {
    return [[self infoForDevice] objectForKey:@"bluetooth"];
}

+ (NSString *)cameraPrimary {
    return [[self infoForDevice] objectForKey:@"camera-primary"];
}

+ (NSString *)cameraSecondary {
    return [[self infoForDevice] objectForKey:@"camera-secondary"];
}

+ (NSString *)cpu {
    return [[self infoForDevice] objectForKey:@"cpu"];
}

+ (NSString *)gpu {
    return [[self infoForDevice] objectForKey:@"gpu"];
}

+ (BOOL)siri {
    if ([[[self infoForDevice] objectForKey:@"siri"] isEqualToString:@"Yes"])
        return YES;
    else
        return NO;
}

+ (BOOL)touchID {
    if ([[[self infoForDevice] objectForKey:@"touch-id"] isEqualToString:@"Yes"])
        return YES;
    else
        return NO;
}

@end
