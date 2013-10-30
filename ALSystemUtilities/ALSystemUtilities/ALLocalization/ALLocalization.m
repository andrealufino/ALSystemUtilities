//
//  ALLocalization.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALLocalization.h"

@implementation ALLocalization

+ (NSString *)language {
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

+ (NSString *)timeZone {
    return [[NSTimeZone systemTimeZone] name];
}

+ (NSString *)currencySymbol {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
}

+ (NSString *)currencyCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCurrencyCode];
}

+ (NSString *)country {
    return [[NSLocale currentLocale] localeIdentifier];
}

+ (NSString *)measurementSystem {
    return [[NSLocale currentLocale] objectForKey:NSLocaleMeasurementSystem];
}

@end
