// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WMLProductResponse.h instead.

@import CoreData;
#import "WMLManagedObject.h"

extern const struct WMLProductResponseAttributes {
	__unsafe_unretained NSString *pageNumber;
	__unsafe_unretained NSString *pageSize;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *timeInserted;
	__unsafe_unretained NSString *totalProducts;
} WMLProductResponseAttributes;

extern const struct WMLProductResponseRelationships {
	__unsafe_unretained NSString *products;
} WMLProductResponseRelationships;

@class WMLProduct;

@interface WMLProductResponseID : NSManagedObjectID {}
@end

@interface _WMLProductResponse : WMLManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) WMLProductResponseID* objectID;

@property (nonatomic, strong) NSNumber* pageNumber;

@property (atomic) int64_t pageNumberValue;
- (int64_t)pageNumberValue;
- (void)setPageNumberValue:(int64_t)value_;

//- (BOOL)validatePageNumber:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* pageSize;

@property (atomic) int64_t pageSizeValue;
- (int64_t)pageSizeValue;
- (void)setPageSizeValue:(int64_t)value_;

//- (BOOL)validatePageSize:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* status;

@property (atomic) int64_t statusValue;
- (int64_t)statusValue;
- (void)setStatusValue:(int64_t)value_;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timeInserted;

//- (BOOL)validateTimeInserted:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* totalProducts;

@property (atomic) int64_t totalProductsValue;
- (int64_t)totalProductsValue;
- (void)setTotalProductsValue:(int64_t)value_;

//- (BOOL)validateTotalProducts:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *products;

- (NSMutableSet*)productsSet;

@end

@interface _WMLProductResponse (ProductsCoreDataGeneratedAccessors)
- (void)addProducts:(NSSet*)value_;
- (void)removeProducts:(NSSet*)value_;
- (void)addProductsObject:(WMLProduct*)value_;
- (void)removeProductsObject:(WMLProduct*)value_;

@end

@interface _WMLProductResponse (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitivePageNumber;
- (void)setPrimitivePageNumber:(NSNumber*)value;

- (int64_t)primitivePageNumberValue;
- (void)setPrimitivePageNumberValue:(int64_t)value_;

- (NSNumber*)primitivePageSize;
- (void)setPrimitivePageSize:(NSNumber*)value;

- (int64_t)primitivePageSizeValue;
- (void)setPrimitivePageSizeValue:(int64_t)value_;

- (NSNumber*)primitiveStatus;
- (void)setPrimitiveStatus:(NSNumber*)value;

- (int64_t)primitiveStatusValue;
- (void)setPrimitiveStatusValue:(int64_t)value_;

- (NSDate*)primitiveTimeInserted;
- (void)setPrimitiveTimeInserted:(NSDate*)value;

- (NSNumber*)primitiveTotalProducts;
- (void)setPrimitiveTotalProducts:(NSNumber*)value;

- (int64_t)primitiveTotalProductsValue;
- (void)setPrimitiveTotalProductsValue:(int64_t)value_;

- (NSMutableSet*)primitiveProducts;
- (void)setPrimitiveProducts:(NSMutableSet*)value;

@end
