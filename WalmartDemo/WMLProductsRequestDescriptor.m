//
//  WMLProductsRequestDescriptor.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLProductsRequestDescriptor.h"

#import "WMLConstants.h"
#import "WMLProductResponse.h"

@implementation WMLProductsRequestDescriptor

- (instancetype)init
{
    if (self = [super init])
    {
        _pageNumber = 0;
        _pageSize = 30;
    }
    return self;
}

- (NSString *)apiKey
{
    if (!_apiKey)
    {
        _apiKey = @"2fb48df0-95fc-432e-b2e3-b03ed1049255";
    }
    return _apiKey;
}

- (NSString *)URLPath
{
    NSMutableArray *pathComponents = [NSMutableArray array];
    [pathComponents addObject:@"v1"];
    [pathComponents addObject:@"walmartproducts"];
    [pathComponents addObject:self.apiKey];
    [pathComponents addObject:[NSString stringWithFormat:@"%ld", self.pageNumber]];
    [pathComponents addObject:[NSString stringWithFormat:@"%ld", self.pageSize]];
    return [pathComponents componentsJoinedByString:@"/"];
}

- (id)responseObjectForData:(NSData *)data URLResponse:(NSURLResponse *)response userInfo:(NSDictionary *)userInfo error:(NSError *__autoreleasing *)error
{
    NSDictionary *JSONDictionary = [super responseObjectForData:data URLResponse:response userInfo:userInfo error:error];
    
    NSManagedObjectContext *context = userInfo[WMLManagedObjectContextUserInfoKey];
    __block WMLProductResponse *productResponse = nil;
    
    [context performBlockAndWait:^
    {
        productResponse = [WMLProductResponse insertInManagedObjectContext:context];
        [productResponse setValuesForKeysWithDictionary:JSONDictionary];
        productResponse.timeInserted = [NSDate date];
        
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Error saving product response: %@", error);
        }
    }];
    return productResponse;
}

@end
