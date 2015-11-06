//
//  INCDataManager.h
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/15/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface WMLDataManager : NSObject

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

// Document path is ignored if store type is NSInMemoryStoreType.
- (instancetype)initWithModelName:(NSString *)modelName storeType:(NSString *)storeType documentPath:(NSString *)documentPath NS_DESIGNATED_INITIALIZER;

- (instancetype)init;

- (void)saveToPersistentStore;

@end
