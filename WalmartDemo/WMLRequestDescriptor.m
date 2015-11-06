//
//  INCRequest.m
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLRequestDescriptor.h"

@implementation WMLRequestDescriptor

+ (instancetype)descriptor
{
    return [[self alloc] init];
}



- (NSString *)URLPath
{
    return @"";
}

- (NSDictionary *)JSONRepresentation
{
    return nil;
}

- (id)responseObjectForData:(NSData *)data URLResponse:(NSURLResponse *)response userInfo:(NSDictionary *)userInfo error:(NSError **)error
{
    id JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return JSONObject;
}

@end
