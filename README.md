ALSystemUtilities
=================

In order to use the framework you have to open the project in Xcode and then click on Product -> Archive and drag the .framework file into the project you want to import it.

The project is built using the iOS Universal Framework template (Fake framework) by kstenerud (https://github.com/kstenerud/iOS-Universal-Framework?source=cc).

Overview
=================

The library provides informations for these purviews :

- battery;
- disk;
- hardware;
- jailbreak;
- localization;
- memory (RAM);
- network;
- processor;
- carrier;
- accessories;

Now I'll explain you what informations are contained for every purview.


*Battery*

- ```+ (BOOL)batteryFullCharged;```
- ```+ (BOOL)inCharge;```
- ```+ (BOOL)devicePluggedIntoPower;```
- ```+ (UIDeviceBatteryState)batteryState;```
- ```+ (CGFloat)batteryLevel;```
- ```+ (NSString *)remainingHoursForStandby;```
- ```+ (NSString *)remainingHoursFor3gConversation;```
- ```+ (NSString *)remainingHoursFor2gConversation;```
- ```+ (NSString *)remainingHoursForInternet3g;```
- ```+ (NSString *)remainingHoursForInternetWiFi;```
- ```+ (NSString *)remainingHoursForVideo;```
- ```+ (NSString *)remainingHoursForAudio;```

*Disk*

- ```+ (NSString *)totalDiskSpace;```
- ```+ (NSString *)freeDiskSpace;```
- ```+ (NSString *)usedDiskSpace;```
- ```+ (CGFloat)totalDiskSpaceInBytes;```
- ```+ (CGFloat)freeDiskSpaceInBytes;```
- ```+ (CGFloat)usedDiskSpaceInBytes;```

*Hardware*

- ```+ (NSString *)deviceModel;```
- ```+ (NSString *)deviceName;```
- ```+ (NSString *)systemName;```
- ```+ (NSString *)systemVersion;```
- ```+ (NSInteger)screenWidth;```
- ```+ (NSInteger)screenHeight;```
- ```+ (CGFloat)brightness;```
- ```+ (NSString *)platformType;```
- ```+ (NSDate *)bootTime;```
- ```+ (BOOL)proximitySensor;```
- ```+ (BOOL)multitaskingEnabled;```
- ```+ (NSString *)sim;```
- ```+ (NSString *)dimensions;```
- ```+ (NSString *)weight;```
- ```+ (NSString *)displayType;```
- ```+ (NSString *)displayDensity;```
- ```+ (NSString *)WLAN;```
- ```+ (NSString *)bluetooth;```
- ```+ (NSString *)cameraPrimary;```
- ```+ (NSString *)cameraSecondary;```
- ```+ (NSString *)cpu;```
- ```+ (NSString *)gpu;```
- ```+ (BOOL)siri;```
- ```+ (BOOL)touchID;```

*Jailbreak*

- ```+ (BOOL)isJailbroken;```

*Localization*

- ```+ (NSString *)language;```
- ```+ (NSString *)timeZone;```
- ```+ (NSString *)currencySymbol;```
- ```+ (NSString *)currencyCode;```
- ```+ (NSString *)country;```
- ```+ (NSString *)measurementSystem;```

*Memory (RAM)*

- ```+ (NSInteger)totalMemory;```
- ```+ (CGFloat)freeMemory;```
- ```+ (CGFloat)usedMemory;```
- ```+ (CGFloat)activeMemory;```
- ```+ (CGFloat)wiredMemory;```
- ```+ (CGFloat)inactiveMemory;```

*Network*

- ```+ (NSString *)currentIPAddress;```
- ```+ (BOOL)connectedViaWiFi;```
- ```+ (BOOL)connectedVia3G;```
- ```+ (NSString *)macAddress;```
- ```+ (NSString *)externalIPAddress;```
- ```+ (NSString *)cellIPAddress;```
- ```+ (NSString *)WiFiNetmaskAddress;```
- ```+ (NSString *)WiFiBroadcastAddress;```

*Processor*

- ```+ (NSInteger)processorsNumber;```
- ```+ (NSInteger)activeProcessorsNumber;```
- ```+ (CGFloat)cpuUsageForApp;```
- ```+ (NSArray *)activeProcesses;```
- ```+ (NSInteger)numberOfActiveProcesses;```

*Carrier*

- ```+ (NSString *)carrierName;```
- ```+ (NSString *)carrierISOCountryCode;```
- ```+ (NSString *)carrierMobileCountryCode;```
- ```+ (NSString *)carrierMobileNetworkCode;```
- ```+ (BOOL)carrierAllowsVOIP;```

*Accessories*

- ```+ (BOOL)accessoriesPluggedIn;```
- ```+ (NSInteger)numberOfAccessoriesPluggedIn;```
- ```+ (BOOL)isHeadphonesAttached;```

So, there are 78 methods to get every kind of information!

All methods are class methods, so you can use the syntax ```[ALCarrier carrierName]```. This make the use of the library very very simple!

If you want to let me know if you use my library in your applications, you are free to send me an email to andrea.lufino@me.com :)