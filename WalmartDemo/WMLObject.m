//
//  INCObject.m
//  Aqeel Gunja
//
//  Created by Aqeel Gunja on 12/16/14.
//  Copyright (c) 2014 Aqeel Gunja. All rights reserved.
//

#import "WMLObject.h"


@implementation WMLObject

+ (NSArray *)classPropertyNames
{
    unsigned int numberOfProperties = 0;
    objc_property_t *propertiesArray = class_copyPropertyList([self class], &numberOfProperties);
    
    NSMutableArray *propertyNames = [NSMutableArray array];
    for(NSUInteger i = 0; i < numberOfProperties; i++)
    {
        objc_property_t property = propertiesArray[i];
        NSString *propertyName = [[NSString alloc] initWithUTF8String:property_getName(property)];
        [propertyNames addObject:propertyName];
    }
    free(propertiesArray);
    return [propertyNames copy];
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
    NSArray *propertyNames = [[self class] classPropertyNames];
    for (NSString *propertyName in propertyNames)
    {
        NSString *JSONKeyPath = [self JSONKeyPathForPropertyName:propertyName];
        id value = [keyedValues valueForKeyPath:JSONKeyPath];
        value = [self customDeserializationValueOfValue:value forJSONKeyPath:JSONKeyPath];
        [self setValue:value forKey:propertyName];
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

- (NSString *)description
{
    NSArray *propertyNames = [[self class] classPropertyNames];
    NSMutableArray *values = [NSMutableArray array];
    for (NSString *propertyName in propertyNames)
    {
        id value = [self valueForKey:propertyName];
        if (!value)
        {
            value = [NSNull null];
        }
        [values addObject:value];
    }
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:values forKeys:propertyNames];
    return [dictionary description];
}

@end
