//
//  ALSystem.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 09/09/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALSystem.h"

@implementation ALSystem

#pragma mark - All info

+ (NSDictionary *)systemInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    // Battery
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery batteryFullCharged]] forKey:ALBattery_batteryFullCharged];
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery inCharge]] forKey:ALBattery_inCharge];
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery devicePluggedIntoPower]] forKey:ALBattery_devicePluggedIntoPower];
    [dictionary setObject:[NSNumber numberWithInt:[ALBattery batteryState]] forKey:ALBattery_batteryState];
    [dictionary setObject:[NSNumber numberWithFloat:[ALBattery batteryLevel]] forKey:ALBattery_batteryLevel];
    [dictionary setObject:[ALBattery remainingHoursForStandby] forKey:ALBattery_remainingHoursForStandby];
    [dictionary setObject:[ALBattery remainingHoursFor3gConversation] forKey:ALBattery_remainingHoursFor3gConversation];
    [dictionary setObject:[ALBattery remainingHoursFor2gConversation] forKey:ALBattery_remainingHoursFor2gConversation];
    [dictionary setObject:[ALBattery remainingHoursForInternet3g] forKey:ALBattery_remainingHoursForInternet3g];
    [dictionary setObject:[ALBattery remainingHoursForInternetWiFi] forKey:ALBattery_remainingHoursForInternetWiFi];
    [dictionary setObject:[ALBattery remainingHoursForVideo] forKey:ALBattery_remainingHoursForVideo];
    [dictionary setObject:[ALBattery remainingHoursForAudio] forKey:ALBattery_remainingHoursForAudio];
    // Disk
    [dictionary setObject:[ALDisk totalDiskSpace] forKey:ALDisk_totalDiskSpace];
    [dictionary setObject:[ALDisk freeDiskSpace] forKey:ALDisk_freeDiskSpace];
    [dictionary setObject:[ALDisk usedDiskSpace] forKey:ALDisk_usedDiskSpace];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk totalDiskSpaceInBytes]] forKey:ALDisk_totalDiskSpaceInBytes];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk freeDiskSpaceInBytes]] forKey:ALDisk_freeDiskSpaceInBytes];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk usedDiskSpaceInBytes]] forKey:ALDisk_usedDiskSpaceInBytes];
    // Hardware
    [dictionary setObject:[ALHardware deviceModel] forKey:ALHardware_deviceModel];
    [dictionary setObject:[ALHardware deviceName] forKey:ALHardware_deviceName];
    [dictionary setObject:[ALHardware systemName] forKey:ALHardware_systemName];
    [dictionary setObject:[ALHardware systemVersion] forKey:ALHardware_systemVersion];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware screenWidth]] forKey:ALHardware_screenWidth];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware screenHeight]] forKey:ALHardware_screenHeight];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware brightness]] forKey:ALHardware_brightness];
    [dictionary setObject:[ALHardware platformType] forKey:ALHardware_platformType];
    [dictionary setObject:[ALHardware bootTime] forKey:ALHardware_bootTime];
    [dictionary setObject:[NSNumber numberWithBool:[ALHardware proximitySensor]] forKey:ALHardware_proximitySensor];
    [dictionary setObject:[NSNumber numberWithBool:[ALHardware multitaskingEnabled]] forKey:ALHardware_multitaskingEnabled];
    [dictionary setObject:[ALHardware sim] forKey:ALHardware_sim];
    [dictionary setObject:[ALHardware dimensions] forKey:ALHardware_dimensions];
    [dictionary setObject:[ALHardware weight] forKey:ALHardware_weight];
    [dictionary setObject:[ALHardware displayType] forKey:ALHardware_displayType];
    [dictionary setObject:[ALHardware displayDensity] forKey:ALHardware_displayDensity];
    [dictionary setObject:[ALHardware WLAN] forKey:ALHardware_WLAN];
    [dictionary setObject:[ALHardware bluetooth] forKey:ALHardware_bluetooth];
    [dictionary setObject:[ALHardware cameraPrimary] forKey:ALHardware_cameraPrimary];
    [dictionary setObject:[ALHardware cameraSecondary] forKey:ALHardware_cameraSecondary];
    [dictionary setObject:[ALHardware cpu] forKey:ALHardware_cpu];
    [dictionary setObject:[ALHardware gpu] forKey:ALHardware_gpu];
    // Jailbreak
    [dictionary setObject:[NSNumber numberWithBool:[ALJailbreak isJailbroken]] forKey:ALJailbreak_isJailbroken];
    // Localization
    [dictionary setObject:[ALLocalization language] forKey:ALLocalization_language];
    [dictionary setObject:[ALLocalization timeZone] forKey:ALLocalization_timeZone];
    [dictionary setObject:[ALLocalization currencySymbol] forKey:ALLocalization_currencySimbol];
    [dictionary setObject:[ALLocalization currencyCode] forKey:ALLocalization_currencyCode];
    [dictionary setObject:[ALLocalization country] forKey:ALLocalization_country];
    [dictionary setObject:[ALLocalization measurementSystem] forKey:ALLocalization_measurementSystem];
    // Memory
    [dictionary setObject:[NSNumber numberWithInteger:[ALMemory totalMemory]] forKey:ALMemory_totalMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory freeMemory]] forKey:ALMemory_freeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory usedMemory]] forKey:ALMemory_usedMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory activeMemory]] forKey:ALMemory_activeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory wiredMemory]] forKey:ALMemory_wiredMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory inactiveMemory]] forKey:ALMemory_inactivemMemory];
    // Network
    [dictionary setObject:[ALNetwork currentIPAddress] forKey:ALNetwork_currentIPAddress];
    [dictionary setObject:[NSNumber numberWithBool:[ALNetwork connectedViaWiFi]] forKey:ALNetwork_connectedViaWiFi];
    [dictionary setObject:[NSNumber numberWithBool:[ALNetwork connectedVia3G]] forKey:ALNetwork_connectedVia3G];
    [dictionary setObject:[ALNetwork macAddress] forKey:ALNetwork_macAddress];
    [dictionary setObject:[ALNetwork externalIPAddress] forKey:ALNetwork_externalIPAddress];
    [dictionary setObject:[ALNetwork cellIPAddress] forKey:ALNetwork_cellIPAddress];
    [dictionary setObject:[ALNetwork WiFiNetmaskAddress] forKey:ALNetwork_WiFiNetmaskAddress];
    [dictionary setObject:[ALNetwork WiFiBroadcastAddress] forKey:ALNetwork_WiFiBroadcastAddress];
    // Processor
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor processorsNumber]] forKey:ALProcessor_processorsNumber];
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor activeProcessorsNumber]] forKey:ALProcessor_activeProcessorsNumber];
    [dictionary setObject:[NSNumber numberWithFloat:[ALProcessor cpuUsageForApp]] forKey:ALProcessor_cpuUsageForApp];
    [dictionary setObject:[ALProcessor activeProcesses] forKey:ALProcessor_activeProcesses];
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor numberOfActiveProcesses]] forKey:ALProcessor_numberOfActiveProcesses];
    // Carrier
    [dictionary setObject:[ALCarrier carrierName] forKey:ALCarrier_carrierName];
    [dictionary setObject:[ALCarrier carrierISOCountryCode] forKey:ALCarrier_carrierISOCountryCode];
    [dictionary setObject:[ALCarrier carrierMobileCountryCode] forKey:ALCarrier_carrierMobileCountryCode];
    [dictionary setObject:[ALCarrier carrierMobileNetworkCode] forKey:ALCarrier_carriermobileNetworkCode];
    [dictionary setObject:[NSNumber numberWithBool:[ALCarrier carrierAllowsVOIP]] forKey:ALCarrier_carrierAllowsVOIP];
    // Accessory
    [dictionary setObject:[NSNumber numberWithBool:[ALAccessory accessoriesPluggedIn]] forKey:ALAccessory_accessoriesPluggedIn];
    [dictionary setObject:[NSNumber numberWithInteger:[ALAccessory numberOfAccessoriesPluggedIn]] forKey:ALAccessory_numberOfAccessoriesPluggedIn];
    [dictionary setObject:[NSNumber numberWithBool:[ALAccessory isHeadphonesAttached]] forKey:ALAccessory_isHeadphonesAttached];
    return dictionary;
}

#pragma mark - Battery

+ (NSDictionary *)batteryInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery batteryFullCharged]] forKey:ALBattery_batteryFullCharged];
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery inCharge]] forKey:ALBattery_inCharge];
    [dictionary setObject:[NSNumber numberWithBool:[ALBattery devicePluggedIntoPower]] forKey:ALBattery_devicePluggedIntoPower];
    [dictionary setObject:[NSNumber numberWithInt:[ALBattery batteryState]] forKey:ALBattery_batteryState];
    [dictionary setObject:[NSNumber numberWithFloat:[ALBattery batteryLevel]] forKey:ALBattery_batteryLevel];
    [dictionary setObject:[ALBattery remainingHoursForStandby] forKey:ALBattery_remainingHoursForStandby];
    [dictionary setObject:[ALBattery remainingHoursFor3gConversation] forKey:ALBattery_remainingHoursFor3gConversation];
    [dictionary setObject:[ALBattery remainingHoursFor2gConversation] forKey:ALBattery_remainingHoursFor2gConversation];
    [dictionary setObject:[ALBattery remainingHoursForInternet3g] forKey:ALBattery_remainingHoursForInternet3g];
    [dictionary setObject:[ALBattery remainingHoursForInternetWiFi] forKey:ALBattery_remainingHoursForInternetWiFi];
    [dictionary setObject:[ALBattery remainingHoursForVideo] forKey:ALBattery_remainingHoursForVideo];
    [dictionary setObject:[ALBattery remainingHoursForAudio] forKey:ALBattery_remainingHoursForAudio];
    return dictionary;
}

#pragma mark - Disk

+ (NSDictionary *)diskInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[ALDisk totalDiskSpace] forKey:ALDisk_totalDiskSpace];
    [dictionary setObject:[ALDisk freeDiskSpace] forKey:ALDisk_freeDiskSpace];
    [dictionary setObject:[ALDisk usedDiskSpace] forKey:ALDisk_usedDiskSpace];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk totalDiskSpaceInBytes]] forKey:ALDisk_totalDiskSpaceInBytes];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk freeDiskSpaceInBytes]] forKey:ALDisk_freeDiskSpaceInBytes];
    [dictionary setObject:[NSNumber numberWithFloat:[ALDisk usedDiskSpaceInBytes]] forKey:ALDisk_usedDiskSpaceInBytes];
    return dictionary;
}

#pragma mark - Hardware

+ (NSDictionary *)hardwareInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[ALHardware deviceModel] forKey:ALHardware_deviceModel];
    [dictionary setObject:[ALHardware deviceName] forKey:ALHardware_deviceName];
    [dictionary setObject:[ALHardware systemName] forKey:ALHardware_systemName];
    [dictionary setObject:[ALHardware systemVersion] forKey:ALHardware_systemVersion];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware screenWidth]] forKey:ALHardware_screenWidth];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware screenHeight]] forKey:ALHardware_screenHeight];
    [dictionary setObject:[NSNumber numberWithFloat:[ALHardware brightness]] forKey:ALHardware_brightness];
    [dictionary setObject:[ALHardware platformType] forKey:ALHardware_platformType];
    [dictionary setObject:[ALHardware bootTime] forKey:ALHardware_bootTime];
    [dictionary setObject:[NSNumber numberWithBool:[ALHardware proximitySensor]] forKey:ALHardware_proximitySensor];
    [dictionary setObject:[NSNumber numberWithBool:[ALHardware multitaskingEnabled]] forKey:ALHardware_multitaskingEnabled];
    [dictionary setObject:[ALHardware sim] forKey:ALHardware_sim];
    [dictionary setObject:[ALHardware dimensions] forKey:ALHardware_dimensions];
    [dictionary setObject:[ALHardware weight] forKey:ALHardware_weight];
    [dictionary setObject:[ALHardware displayType] forKey:ALHardware_displayType];
    [dictionary setObject:[ALHardware displayDensity] forKey:ALHardware_displayDensity];
    [dictionary setObject:[ALHardware WLAN] forKey:ALHardware_WLAN];
    [dictionary setObject:[ALHardware bluetooth] forKey:ALHardware_bluetooth];
    [dictionary setObject:[ALHardware cameraPrimary] forKey:ALHardware_cameraPrimary];
    [dictionary setObject:[ALHardware cameraSecondary] forKey:ALHardware_cameraSecondary];
    [dictionary setObject:[ALHardware cpu] forKey:ALHardware_cpu];
    [dictionary setObject:[ALHardware gpu] forKey:ALHardware_gpu];
    return dictionary;
}

#pragma mark - Jailbreak

+ (NSDictionary *)jailbreakInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithBool:[ALJailbreak isJailbroken]] forKey:ALJailbreak_isJailbroken];
    return dictionary;
}

#pragma mark - Localization

+ (NSDictionary *)localizationInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[ALLocalization language] forKey:ALLocalization_language];
    [dictionary setObject:[ALLocalization timeZone] forKey:ALLocalization_timeZone];
    [dictionary setObject:[ALLocalization currencySymbol] forKey:ALLocalization_currencySimbol];
    [dictionary setObject:[ALLocalization currencyCode] forKey:ALLocalization_currencyCode];
    [dictionary setObject:[ALLocalization country] forKey:ALLocalization_country];
    [dictionary setObject:[ALLocalization measurementSystem] forKey:ALLocalization_measurementSystem];
    return dictionary;
}

#pragma mark - Memory

+ (NSDictionary *)memoryInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithInteger:[ALMemory totalMemory]] forKey:ALMemory_totalMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory freeMemory]] forKey:ALMemory_freeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory usedMemory]] forKey:ALMemory_usedMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory activeMemory]] forKey:ALMemory_activeMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory wiredMemory]] forKey:ALMemory_wiredMemory];
    [dictionary setObject:[NSNumber numberWithFloat:[ALMemory inactiveMemory]] forKey:ALMemory_inactivemMemory];
    return dictionary;
}

#pragma mark - Network

+ (NSDictionary *)networkInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[ALNetwork currentIPAddress] forKey:ALNetwork_currentIPAddress];
    [dictionary setObject:[NSNumber numberWithBool:[ALNetwork connectedViaWiFi]] forKey:ALNetwork_connectedViaWiFi];
    [dictionary setObject:[NSNumber numberWithBool:[ALNetwork connectedVia3G]] forKey:ALNetwork_connectedVia3G];
    [dictionary setObject:[ALNetwork macAddress] forKey:ALNetwork_macAddress];
    [dictionary setObject:[ALNetwork externalIPAddress] forKey:ALNetwork_externalIPAddress];
    [dictionary setObject:[ALNetwork cellIPAddress] forKey:ALNetwork_cellIPAddress];
    [dictionary setObject:[ALNetwork WiFiNetmaskAddress] forKey:ALNetwork_WiFiNetmaskAddress];
    [dictionary setObject:[ALNetwork WiFiBroadcastAddress] forKey:ALNetwork_WiFiBroadcastAddress];
    return dictionary;
}

#pragma mark - Processor

+ (NSDictionary *)processorInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor processorsNumber]] forKey:ALProcessor_processorsNumber];
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor activeProcessorsNumber]] forKey:ALProcessor_activeProcessorsNumber];
    [dictionary setObject:[NSNumber numberWithFloat:[ALProcessor cpuUsageForApp]] forKey:ALProcessor_cpuUsageForApp];
    [dictionary setObject:[ALProcessor activeProcesses] forKey:ALProcessor_activeProcesses];
    [dictionary setObject:[NSNumber numberWithInteger:[ALProcessor numberOfActiveProcesses]] forKey:ALProcessor_numberOfActiveProcesses];
    return dictionary;
}

#pragma mark - Carrier

+ (NSDictionary *)carrierInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[ALCarrier carrierName] forKey:ALCarrier_carrierName];
    [dictionary setObject:[ALCarrier carrierISOCountryCode] forKey:ALCarrier_carrierISOCountryCode];
    [dictionary setObject:[ALCarrier carrierMobileCountryCode] forKey:ALCarrier_carrierMobileCountryCode];
    [dictionary setObject:[ALCarrier carrierMobileNetworkCode] forKey:ALCarrier_carriermobileNetworkCode];
    [dictionary setObject:[NSNumber numberWithBool:[ALCarrier carrierAllowsVOIP]] forKey:ALCarrier_carrierAllowsVOIP];
    return dictionary;
}

#pragma mark - Accessory

+ (NSDictionary *)accessoryInformations {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:[NSNumber numberWithBool:[ALAccessory accessoriesPluggedIn]] forKey:ALAccessory_accessoriesPluggedIn];
    [dictionary setObject:[NSNumber numberWithInteger:[ALAccessory numberOfAccessoriesPluggedIn]] forKey:ALAccessory_numberOfAccessoriesPluggedIn];
    [dictionary setObject:[NSNumber numberWithBool:[ALAccessory isHeadphonesAttached]] forKey:ALAccessory_isHeadphonesAttached];
    return dictionary;
}

@end
