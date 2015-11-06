// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WMLProductResponse.m instead.

#import "_WMLProductResponse.h"

const struct WMLProductResponseAttributes WMLProductResponseAttributes = {
	.pageNumber = @"pageNumber",
	.pageSize = @"pageSize",
	.status = @"status",
	.timeInserted = @"timeInserted",
	.totalProducts = @"totalProducts",
};

const struct WMLProductResponseRelationships WMLProductResponseRelationships = {
	.products = @"products",
};

@implementation WMLProductResponseID
@end

@implementation _WMLProductResponse

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ProductResponse" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ProductResponse";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ProductResponse" inManagedObjectContext:moc_];
}

- (WMLProductResponseID*)objectID {
	return (WMLProductResponseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"pageNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pageNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pageSizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pageSize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"statusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"status"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"totalProductsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalProducts"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic pageNumber;

- (int64_t)pageNumberValue {
	NSNumber *result = [self pageNumber];
	return [result longLongValue];
}

- (void)setPageNumberValue:(int64_t)value_ {
	[self setPageNumber:@(value_)];
}

- (int64_t)primitivePageNumberValue {
	NSNumber *result = [self primitivePageNumber];
	return [result longLongValue];
}

- (void)setPrimitivePageNumberValue:(int64_t)value_ {
	[self setPrimitivePageNumber:@(value_)];
}

@dynamic pageSize;

- (int64_t)pageSizeValue {
	NSNumber *result = [self pageSize];
	return [result longLongValue];
}

- (void)setPageSizeValue:(int64_t)value_ {
	[self setPageSize:@(value_)];
}

- (int64_t)primitivePageSizeValue {
	NSNumber *result = [self primitivePageSize];
	return [result longLongValue];
}

- (void)setPrimitivePageSizeValue:(int64_t)value_ {
	[self setPrimitivePageSize:@(value_)];
}

@dynamic status;

- (int64_t)statusValue {
	NSNumber *result = [self status];
	return [result longLongValue];
}

- (void)setStatusValue:(int64_t)value_ {
	[self setStatus:@(value_)];
}

- (int64_t)primitiveStatusValue {
	NSNumber *result = [self primitiveStatus];
	return [result longLongValue];
}

- (void)setPrimitiveStatusValue:(int64_t)value_ {
	[self setPrimitiveStatus:@(value_)];
}

@dynamic timeInserted;

@dynamic totalProducts;

- (int64_t)totalProductsValue {
	NSNumber *result = [self totalProducts];
	return [result longLongValue];
}

- (void)setTotalProductsValue:(int64_t)value_ {
	[self setTotalProducts:@(value_)];
}

- (int64_t)primitiveTotalProductsValue {
	NSNumber *result = [self primitiveTotalProducts];
	return [result longLongValue];
}

- (void)setPrimitiveTotalProductsValue:(int64_t)value_ {
	[self setPrimitiveTotalProducts:@(value_)];
}

@dynamic products;

- (NSMutableSet*)productsSet {
	[self willAccessValueForKey:@"products"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"products"];

	[self didAccessValueForKey:@"products"];
	return result;
}

@end

