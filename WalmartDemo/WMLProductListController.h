//
//  WMLProductListController.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "WMLConstants.h"
#import "WMLRequestor.h"
#import "WMLProduct.h"

typedef void(^WMLProductListCompletion)();

@interface WMLProductListController : NSObject

- (instancetype)initWithRequestor:(WMLRequestor *)requestor NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) NSInteger totalProducts;
@property (nonatomic, readonly) NSInteger currentPageNumber;

// The fetched results controller will deliver WMLProduct objects to the interface for display.
- (NSFetchedResultsController *)createFetchedResultsController;

- (void)startRequestForNextPageOfProductsWithCompletion:(WMLProductListCompletion)completion;

@property (nonatomic, assign) BOOL requestInProgress;

@end
