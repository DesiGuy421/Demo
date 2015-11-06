//
//  WMLProductsRequestDescriptor.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLRequestDescriptor.h"

#import <CoreData/CoreData.h>

@interface WMLProductsRequestDescriptor : WMLRequestDescriptor

@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, assign) NSInteger pageNumber;
@property (nonatomic, assign) NSInteger pageSize;

@end
