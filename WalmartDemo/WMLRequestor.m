//
//  INCRequestor.m
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLRequestor.h"
#import "WMLRequestDescriptor.h"

@interface WMLRequestor ()

@property (nonatomic, strong) NSURLSession *URLSession;
@property (nonatomic, readwrite, copy) NSDictionary *userInfo;

@property (nonatomic, assign) BOOL isNetworkActivityInProgress;
@property (nonatomic, assign) NSInteger networkRequestCount;

@end

@implementation WMLRequestor
{
    NSURL *_baseURL;
}

- (instancetype)initWithBaseURL:(NSURL *)baseURL userInfo:(NSDictionary *)userInfo
{
    if (self = [super init])
    {
        _baseURL = baseURL;
        _URLSession = [NSURLSession sharedSession];
        _userInfo = [userInfo copy];
    }
    return self;
}

- (void)setNetworkRequestCount:(NSInteger)networkRequestCount
{
    _networkRequestCount = networkRequestCount;
    
    if (_networkRequestCount > 0)
    {
        self.isNetworkActivityInProgress = YES;
    }
    else
    {
        self.isNetworkActivityInProgress = NO;
    }
}

- (void)startRequestWithDescriptor:(WMLRequestDescriptor *)requestDescriptor completion:(WMLCompletion)completion
{
    self.networkRequestCount++;
    
    __weak typeof(self) weakSelf = self;
    NSURL *baseURL = _baseURL;
    NSURL *requestURL = nil;
    if (!baseURL)
    {
        requestURL = [NSURL URLWithString:[requestDescriptor URLPath]];
    }
    else
    {
        requestURL = [baseURL URLByAppendingPathComponent:[requestDescriptor URLPath]];        
    }

    NSMutableURLRequest *URLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    NSURLSessionDataTask *dataTask = [self.URLSession dataTaskWithRequest:URLRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        weakSelf.networkRequestCount--;
        NSError *parseError = nil;
        id responseObject = [requestDescriptor responseObjectForData:data URLResponse:response userInfo:weakSelf.userInfo error:&parseError];
        if (!error)
        {
            error = parseError;
        }
        completion(responseObject, error);
    }];
    [dataTask resume];
}

@end
