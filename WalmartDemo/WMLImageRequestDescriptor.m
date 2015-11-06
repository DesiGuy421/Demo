//
//  WMLImageRequestDescriptor.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLImageRequestDescriptor.h"

@implementation WMLImageRequestDescriptor

- (NSString *)URLPath
{
    return self.imageURLString;
}

- (id)responseObjectForData:(NSData *)data URLResponse:(NSURLResponse *)response userInfo:(NSDictionary *)userInfo error:(NSError *__autoreleasing *)error
{
    UIImage *image = [UIImage imageWithData:data scale:0.0];
    return image;
}

@end
