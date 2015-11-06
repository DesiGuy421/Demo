//
//  WMLProductListController.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLProductListController.h"
#import "WMLProductsRequestDescriptor.h"
#import "WMLProductResponse.h"

@interface WMLProductListController ()

@property (nonatomic, strong) WMLRequestor *requestor;

@property (nonatomic, strong) WMLProductsRequestDescriptor *requestDescriptor;
@property (nonatomic, strong) WMLProductResponse *lastProductResponse;

@end

@implementation WMLProductListController

- (instancetype)init
{
    return [self initWithRequestor:nil];
}

- (instancetype)initWithRequestor:(WMLRequestor *)requestor
{
    if (self = [super init])
    {
        _requestor = requestor;
        _requestDescriptor = [[WMLProductsRequestDescriptor alloc] init];
    }
    return self;
}

- (NSFetchedResultsController *)createFetchedResultsController
{
    NSManagedObjectContext *context = _requestor.userInfo[WMLManagedObjectContextUserInfoKey];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[WMLProduct entityInManagedObjectContext:context]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeInserted" ascending:YES];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    return fetchedResultsController;
}

- (NSInteger)currentPageNumber
{
    return [self.lastProductResponse.pageNumber integerValue];
}

- (void)startRequestForNextPageOfProductsWithCompletion:(WMLProductListCompletion)completion
{
    if (self.lastProductResponse)
    {
        self.requestDescriptor.pageNumber = [self.lastProductResponse.pageNumber integerValue] + 1;
    }
    
    __weak typeof(self) weakSelf = self;
    [self.requestor startRequestWithDescriptor:self.requestDescriptor completion:^(id responseObject, NSError *error)
    {
        weakSelf.lastProductResponse = responseObject;
        dispatch_async(dispatch_get_main_queue(), ^
        {
            if (completion)
            {
                completion();
            }
        });
    }];
}

@end
