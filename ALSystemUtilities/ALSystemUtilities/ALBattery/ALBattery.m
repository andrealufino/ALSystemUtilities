//
//  ALBattery.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 18/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALBattery.h"

@interface ALBattery ()

+ (UIDevice *)device;
+ (NSDictionary *)infoForDevice;

@end

@implementation ALBattery

#pragma mark - UIDevice

+ (UIDevice *)device {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice];
}

#pragma mark - Info for device

+ (NSDictionary *)infoForDevice {
    NSString *device = [ALHardware platformType];
    NSDictionary *info = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[device stringByReplacingOccurrencesOfString:@" " withString:@""] ofType:@"plist"]];
    return info;
}

#pragma mark - Battery methods

+ (BOOL)batteryFullCharged {
    if ([self batteryLevel] == 100.00) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)inCharge {
    if ([self device].batteryState == UIDeviceBatteryStateCharging ||
        [self device].batteryState == UIDeviceBatteryStateFull) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)devicePluggedIntoPower {
    if ([self device].batteryState == UIDeviceBatteryStateUnplugged) {
        return NO;
    } else {
        return YES;
    }
}

+ (UIDeviceBatteryState)batteryState {
    return [self device].batteryState;
}

+ (CGFloat)batteryLevel {
    CGFloat batteryLevel = 0.0f;
    CGFloat batteryCharge = [self device].batteryLevel;
    if (batteryCharge > 0.0f)
        batteryLevel = batteryCharge * 100;
    else
        // Unable to find battery level
        return -1;
    
    return batteryLevel;
}

+ (NSString *)remainingHoursForStandby {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"standby"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursFor3gConversation {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"conversation3g"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursFor2gConversation {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"conversation2g"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursForInternet3g {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"internet3g"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursForInternetWiFi {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"internetwifi"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursForVideo {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"video"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; // get hours
        NSInteger minutes = totMinutes - (hours *60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

+ (NSString *)remainingHoursForAudio {
    CGFloat batteryLevel = [self batteryLevel];
    NSDictionary *info = [self infoForDevice];
    NSInteger maxHours = 0;
    if ([info objectForKey:@"standby"]) {
        maxHours = [[info objectForKey:@"audio"] integerValue];
        CGFloat totMinutes = (maxHours - ((100 - batteryLevel) * maxHours / 100)) * 60; //remaining time in minutes
        NSInteger hours = totMinutes / 60; //get hours
        NSInteger minutes = totMinutes - (hours * 60); // get minutes
        if (hours < 0 || minutes < 0) {
            return [NSString stringWithFormat:@"ND"];
        }
        return [NSString stringWithFormat:@"%i:%02i",hours,minutes];
    } else
        return @"NS";
}

@end
