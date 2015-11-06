//
//  WMLRequestDescriptor.h
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLObject.h"

@interface WMLRequestDescriptor : WMLObject

+ (instancetype)descriptor;

- (NSString *)URLPath;
- (NSDictionary *)JSONRepresentation;


// Returns a JSON object by default.  Subclasses may override and return a custom object.
// userInfo parameter is passed in from AFGRequestor.
- (id)responseObjectForData:(NSData *)data URLResponse:(NSURLResponse *)response userInfo:(NSDictionary *)userInfo error:(NSError **)error;

@end
