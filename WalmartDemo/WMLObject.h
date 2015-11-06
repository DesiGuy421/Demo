//
//  WMLObject.h
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface WMLObject : NSObject

// Subclasses can override this method to perform data transformations for any data is returned from an endpoint.  For example, if an API returned a UNIX timestamp for a particular value, this method can be used to convert that into an NSDate object.
- (id)customDeserializationValueOfValue:(id)value forJSONKeyPath:(NSString *)JSONKeyPath;

// A dictionary mapping that allows a property name to be mapped to a custom JSON KeyPath in a subclass.  Only override if JSON key is different than corresponding property name.
- (NSDictionary *)propertyNameToJSONKeyPathMapping;

@end
