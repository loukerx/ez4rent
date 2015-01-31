//
//  AppDelegate.h
//  ez4rent
//
//  Created by Yin Hua on 15/1/26.
//  Copyright (c) 2015年 Yin Hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

// create a object for room, address, user
@property (strong, nonatomic) NSString *mName;
@property (strong, nonatomic) NSString *mMobile;
@property (strong, nonatomic) NSString *mRentType;
@property (strong, nonatomic) NSString *mBuildingType;
@property (strong, nonatomic) NSString *mStreet;
@property (strong, nonatomic) NSString *mSuburb;
@property (strong, nonatomic) NSString *mCity;
@property (strong, nonatomic) NSString *mBedType;
@property (strong, nonatomic) NSString *mBedrooms;
@property (strong, nonatomic) NSString *mBathrooms;
@property (strong, nonatomic) NSString *mAccommodates;
@property (strong, nonatomic) NSString *mAvailableDate;
@property (strong, nonatomic) NSString *mRoomPrice;
@property (strong, nonatomic) NSString *mRoomSummary;
@property (strong, nonatomic) NSMutableArray *mRoomImages;






@end

