#import "WMLProduct.h"

@interface WMLProduct ()

// Private interface goes here.

@end

@implementation WMLProduct

- (NSDictionary *)propertyNameToJSONKeyPathMapping
{
    return @{@"identifier" : @"productId",
             @"name" : @"productName",
             @"longDetails" : @"longDescription",
             @"shortDetails" : @"shortDescription",
             @"productImageURLString" : @"productImage",
             @"identifier" : @"productId",};
}

- (NSString *)ratingText
{
    return [NSString stringWithFormat:@"%.2F rating – %@ reviews", [self.reviewRating floatValue], self.reviewCount];
}

@end
