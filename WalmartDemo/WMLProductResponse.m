#import "WMLProductResponse.h"
#import "WMLProduct.h"

@interface WMLProductResponse ()

// Private interface goes here.

@end

@implementation WMLProductResponse

- (id)customDeserializationValueOfValue:(id)value forJSONKeyPath:(NSString *)JSONKeyPath
{
    id newValue = value;
    if ([JSONKeyPath isEqualToString:@"products"])
    {
        NSMutableArray *insertedProducts = [NSMutableArray array];
        NSArray *products = value;
        NSInteger order = 0;
        for (NSDictionary *productDictionary in products)
        {
            WMLProduct *product = [WMLProduct insertInManagedObjectContext:self.managedObjectContext];
            [product setValuesForKeysWithDictionary:productDictionary];
            product.timeInserted = [NSDate date];
            product.order = @(order);
            [insertedProducts addObject:product];
            order++;
        }
        newValue = [NSSet setWithArray:insertedProducts];
    }
    return newValue;
}

@end
