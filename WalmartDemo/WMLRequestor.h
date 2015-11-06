//
//  WMLRequestor.h
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WMLRequestDescriptor;

typedef void(^WMLCompletion)(id responseObject, NSError *error);

@interface WMLRequestor : NSObject

@property (nonatomic, readonly) BOOL isNetworkActivityInProgress;

// The userInfo parameter contains any relevant objects that may be useful to your AFGRequestDescriptor subclass (such as an NSManagedObjectContext).
- (instancetype)initWithBaseURL:(NSURL *)baseURL userInfo:(NSDictionary *)userInfo;

- (void)startRequestWithDescriptor:(WMLRequestDescriptor *)requestDescriptor completion:(WMLCompletion)completion;

@property (nonatomic, readonly, copy) NSDictionary *userInfo;

@end
