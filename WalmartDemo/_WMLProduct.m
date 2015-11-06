// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WMLProduct.m instead.

#import "_WMLProduct.h"

const struct WMLProductAttributes WMLProductAttributes = {
	.identifier = @"identifier",
	.inStock = @"inStock",
	.longDetails = @"longDetails",
	.name = @"name",
	.order = @"order",
	.price = @"price",
	.productImageURLString = @"productImageURLString",
	.reviewCount = @"reviewCount",
	.reviewRating = @"reviewRating",
	.shortDetails = @"shortDetails",
	.timeInserted = @"timeInserted",
};

const struct WMLProductRelationships WMLProductRelationships = {
	.productResponse = @"productResponse",
};

@implementation WMLProductID
@end

@implementation _WMLProduct

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Product";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc_];
}

- (WMLProductID*)objectID {
	return (WMLProductID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"inStockValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inStock"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"orderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"order"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"reviewCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"reviewCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"reviewRatingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"reviewRating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic identifier;

@dynamic inStock;

- (BOOL)inStockValue {
	NSNumber *result = [self inStock];
	return [result boolValue];
}

- (void)setInStockValue:(BOOL)value_ {
	[self setInStock:@(value_)];
}

- (BOOL)primitiveInStockValue {
	NSNumber *result = [self primitiveInStock];
	return [result boolValue];
}

- (void)setPrimitiveInStockValue:(BOOL)value_ {
	[self setPrimitiveInStock:@(value_)];
}

@dynamic longDetails;

@dynamic name;

@dynamic order;

- (int64_t)orderValue {
	NSNumber *result = [self order];
	return [result longLongValue];
}

- (void)setOrderValue:(int64_t)value_ {
	[self setOrder:@(value_)];
}

- (int64_t)primitiveOrderValue {
	NSNumber *result = [self primitiveOrder];
	return [result longLongValue];
}

- (void)setPrimitiveOrderValue:(int64_t)value_ {
	[self setPrimitiveOrder:@(value_)];
}

@dynamic price;

@dynamic productImageURLString;

@dynamic reviewCount;

- (int64_t)reviewCountValue {
	NSNumber *result = [self reviewCount];
	return [result longLongValue];
}

- (void)setReviewCountValue:(int64_t)value_ {
	[self setReviewCount:@(value_)];
}

- (int64_t)primitiveReviewCountValue {
	NSNumber *result = [self primitiveReviewCount];
	return [result longLongValue];
}

- (void)setPrimitiveReviewCountValue:(int64_t)value_ {
	[self setPrimitiveReviewCount:@(value_)];
}

@dynamic reviewRating;

- (float)reviewRatingValue {
	NSNumber *result = [self reviewRating];
	return [result floatValue];
}

- (void)setReviewRatingValue:(float)value_ {
	[self setReviewRating:@(value_)];
}

- (float)primitiveReviewRatingValue {
	NSNumber *result = [self primitiveReviewRating];
	return [result floatValue];
}

- (void)setPrimitiveReviewRatingValue:(float)value_ {
	[self setPrimitiveReviewRating:@(value_)];
}

@dynamic shortDetails;

@dynamic timeInserted;

@dynamic productResponse;

@end

