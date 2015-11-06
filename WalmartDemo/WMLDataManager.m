//
//  INCDataManager.m
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/15/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLDataManager.h"

@interface WMLDataManager ()

@property (nonatomic,copy) NSString *modelName;
@property (nonatomic,copy) NSString *documentPath;
@property (nonatomic,strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSManagedObjectContext *privateContext;
@property (nonatomic, strong) NSTimer *saveTimer;

@end

@implementation WMLDataManager

+ (NSString *)defaultModelName
{
    return @"Model";
}

+ (NSString *)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath;
    if( [paths objectAtIndex:0] != nil )
    {
        docsPath = [paths objectAtIndex:0];
    }
    return docsPath;
}

- (instancetype)initWithModelName:(NSString *)modelName storeType:(NSString *)storeType documentPath:(NSString *)documentPath
{
    if ( self = [super init] )
    {
        _modelName = [modelName copy];

        // Init managed object model.
        NSString *modelPath = [[NSBundle mainBundle] pathForResource:_modelName ofType:@"momd"];
        NSURL *modelPathURL = [NSURL fileURLWithPath:modelPath];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelPathURL];
        
        // Init persistent store coordinator.
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
        NSError *error = nil;
        NSDictionary *options = @{
                                  NSMigratePersistentStoresAutomaticallyOption : @YES,
                                  NSInferMappingModelAutomaticallyOption : @YES
                                  };
        
        // Handle documentPath if the store type is NSSQLiteStoreType
        NSURL *URL = nil;
        if ([storeType isEqualToString:NSSQLiteStoreType])
        {
            _documentPath = [documentPath copy];
            if ( !documentPath )
            {
                NSString *docsDirectory = [[self class] applicationDocumentsDirectory];
                NSString *modelFileName = [_modelName stringByAppendingPathExtension:@"sqlite"];
                _documentPath = [[docsDirectory stringByAppendingPathComponent:modelFileName] copy];
            }
            URL = [NSURL fileURLWithPath:_documentPath];
        }
        
        // Create persistent store.
        [_persistentStoreCoordinator addPersistentStoreWithType:storeType configuration:nil URL:URL options:options error:&error];
        if( error )
        {
            NSLog(@"Persistent store coordinator was unable to add persistent store with error: %@", error);
        }
        
        // Init managed object context.
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        // Create private context that saves to disk on a background thread only in the case of NSSQLiteStoreType
        if ([storeType isEqualToString:NSSQLiteStoreType])
        {
            _privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            NSPersistentStoreCoordinator *persistentStoreCoordinator = _persistentStoreCoordinator;
            [_privateContext setPersistentStoreCoordinator:persistentStoreCoordinator];
            [_managedObjectContext setParentContext:_privateContext];
            
            _saveTimer = [NSTimer timerWithTimeInterval:15.0 target:self selector:@selector(saveTimerFired:) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:_saveTimer forMode:NSRunLoopCommonModes];
        }
        else
        {
            [_managedObjectContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
        }
    }
    return self;
}

- (void)saveToPersistentStore
{
    [self.privateContext performBlock:^
    {
        NSError *error = nil;
        if (![self.privateContext save:&error])
        {
            NSLog(@"Error saving context: %@", error);
        }
    }];
}

- (void)saveTimerFired:(NSTimer *)timer
{
    [self saveToPersistentStore];
}

- (instancetype)initWithModelName:(NSString *)modelName
{
    return [self initWithModelName:modelName storeType:NSSQLiteStoreType documentPath:nil];
}

#pragma mark - NSObject Methods

- (instancetype)init
{
    return [self initWithModelName:[[self class] defaultModelName]];
}

@end
