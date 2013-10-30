//
//  ALSystem.h
//  ALSystem
//
//  Created by Andrea Mario Lufino on 09/09/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALBattery.h"
#import "ALDisk.h"
#import "ALHardware.h"
#import "ALJailbreak.h"
#import "ALLocalization.h"
#import "ALMemory.h"
#import "ALNetwork.h"
#import "ALProcessor.h"
#import "ALCarrier.h"
#import "ALAccessory.h"
#import "ALSystemConstants.h"


/*!
 * This class imports all the other classes of the ALSystemUtilities library, so you can import only ALSystem.h to import all the library.
 * ALSystem provides methods to get the informations about every specific purview in a NSDictionary object which keys are declared in the relative extension header of ALSystem.
 */
@interface ALSystem : NSObject

/*!
 All the informations of the library
 @return NSDictionary which contains all informations the library can provides
 */
+ (NSDictionary *)systemInformations;

/*!
 All the informations about the battery
 @return NSDictionary which contains all informations about the battery
 */
+ (NSDictionary *)batteryInformations;

/*!
 All the informations about the disk
 @return NSDictionary which contains all informations about the disk
 */
+ (NSDictionary *)diskInformations;

/*!
 All the informations about the hardware
 @return NSDictionary which contains all informations about the hardware
 */
+ (NSDictionary *)hardwareInformations;

/*!
 All the informations about the jailbreak
 @return NSDictionary which contains all informations about the jailbreak
 */
+ (NSDictionary *)jailbreakInformations;

/*!
 All the informations about the localization
 @return NSDictionary which contains all informations about the localization
 */
+ (NSDictionary *)localizationInformations;

/*!
 All the informations about the memory
 @return NSDictionary which contains all informations about the memory
 */
+ (NSDictionary *)memoryInformations;

/*!
 All the informations about the network
 @return NSDictionary which contains all informations about the network
 */
+ (NSDictionary *)networkInformations;

/*!
 All the informations avout the processor
 @return NSDictionary which contains all informations about the processor
 */
+ (NSDictionary *)processorInformations;

/*!
 All the informations acout the carrier
 @return NSDictionary which contains all informations about the carrier
 */
+ (NSDictionary *)carrierInformations;

/*!
 All the informations about the accessories
 @return NSDictionary which contains all informations about the accessories
 */
+ (NSDictionary *)accessoryInformations;

@end
