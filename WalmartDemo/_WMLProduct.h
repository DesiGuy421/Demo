// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WMLProduct.h instead.

@import CoreData;
#import "WMLManagedObject.h"

extern const struct WMLProductAttributes {
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *inStock;
	__unsafe_unretained NSString *longDetails;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *productImageURLString;
	__unsafe_unretained NSString *reviewCount;
	__unsafe_unretained NSString *reviewRating;
	__unsafe_unretained NSString *shortDetails;
	__unsafe_unretained NSString *timeInserted;
} WMLProductAttributes;

extern const struct WMLProductRelationships {
	__unsafe_unretained NSString *productResponse;
} WMLProductRelationships;

@class WMLProductResponse;

@interface WMLProductID : NSManagedObjectID {}
@end

@interface _WMLProduct : WMLManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WMLProductID* objectID;

@property (nonatomic, strong) NSString* identifier;

//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* inStock;

@property (atomic) BOOL inStockValue;
- (BOOL)inStockValue;
- (void)setInStockValue:(BOOL)value_;

//- (BOOL)validateInStock:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* longDetails;

//- (BOOL)validateLongDetails:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* order;

@property (atomic) int64_t orderValue;
- (int64_t)orderValue;
- (void)setOrderValue:(int64_t)value_;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* price;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* productImageURLString;

//- (BOOL)validateProductImageURLString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* reviewCount;

@property (atomic) int64_t reviewCountValue;
- (int64_t)reviewCountValue;
- (void)setReviewCountValue:(int64_t)value_;

//- (BOOL)validateReviewCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* reviewRating;

@property (atomic) float reviewRatingValue;
- (float)reviewRatingValue;
- (void)setReviewRatingValue:(float)value_;

//- (BOOL)validateReviewRating:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* shortDetails;

//- (BOOL)validateShortDetails:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timeInserted;

//- (BOOL)validateTimeInserted:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) WMLProductResponse *productResponse;

//- (BOOL)validateProductResponse:(id*)value_ error:(NSError**)error_;

@end

@interface _WMLProduct (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;

- (NSNumber*)primitiveInStock;
- (void)setPrimitiveInStock:(NSNumber*)value;

- (BOOL)primitiveInStockValue;
- (void)setPrimitiveInStockValue:(BOOL)value_;

- (NSString*)primitiveLongDetails;
- (void)setPrimitiveLongDetails:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveOrder;
- (void)setPrimitiveOrder:(NSNumber*)value;

- (int64_t)primitiveOrderValue;
- (void)setPrimitiveOrderValue:(int64_t)value_;

- (NSString*)primitivePrice;
- (void)setPrimitivePrice:(NSString*)value;

- (NSString*)primitiveProductImageURLString;
- (void)setPrimitiveProductImageURLString:(NSString*)value;

- (NSNumber*)primitiveReviewCount;
- (void)setPrimitiveReviewCount:(NSNumber*)value;

- (int64_t)primitiveReviewCountValue;
- (void)setPrimitiveReviewCountValue:(int64_t)value_;

- (NSNumber*)primitiveReviewRating;
- (void)setPrimitiveReviewRating:(NSNumber*)value;

- (float)primitiveReviewRatingValue;
- (void)setPrimitiveReviewRatingValue:(float)value_;

- (NSString*)primitiveShortDetails;
- (void)setPrimitiveShortDetails:(NSString*)value;

- (NSDate*)primitiveTimeInserted;
- (void)setPrimitiveTimeInserted:(NSDate*)value;

- (WMLProductResponse*)primitiveProductResponse;
- (void)setPrimitiveProductResponse:(WMLProductResponse*)value;

@end
