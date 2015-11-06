//
//  INCManagedObject.m
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/15/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLManagedObject.h"

#import <objc/runtime.h>

@implementation WMLManagedObject

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
    NSArray *properties = [self.entity valueForKeyPath:@"properties"];
    
    for (NSPropertyDescription *property in properties)
    {
        NSString *propertyName = property.name;
        NSString *JSONKeyPath = [self JSONKeyPathForPropertyName:propertyName];
        id value = [keyedValues valueForKeyPath:JSONKeyPath];
        if (value)
        {
            value = [self customDeserializationValueOfValue:value forJSONKeyPath:JSONKeyPath];
            [self setValue:value forKey:propertyName];
        }
    }
}

- (id)customDeserializationValueOfValue:(id)value forJSONKeyPath:(NSString *)JSONKeyPath
{
    return value;
}

- (NSDictionary *)propertyNameToJSONKeyPathMapping
{
    return @{};
}

- (NSString *)JSONKeyPathForPropertyName:(NSString *)propertyName
{
    NSDictionary *mapping = [self propertyNameToJSONKeyPathMapping];
    NSString *JSONKeyPath = mapping[propertyName];
    if (!JSONKeyPath)
    {
        JSONKeyPath = propertyName;
    }
    return JSONKeyPath;
}

@end
