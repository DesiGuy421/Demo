//
//  AppDelegate.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLAppDelegate.h"

#import "WMLConstants.h"
#import "WMLRequestor.h"
#import "WMLProductListController.h"
#import "WMLDataManager.h"

#import "WMLProductListViewController.h"
#import "WMLProductDetailsViewController.h"

static NSString * const WMLBaseURL = @"https://walmartlabs-test.appspot.com/_ah/api/walmart/";

@interface WMLAppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic, strong) WMLRequestor *requestor;
@property (nonatomic, strong) WMLDataManager *dataManager;

@end

@implementation WMLAppDelegate

static NSString *isNetworkActivityInProgressKey = @"isNetworkActivityInProgress";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.dataManager = [[WMLDataManager alloc] initWithModelName:@"Model" storeType:NSInMemoryStoreType documentPath:nil];
    
    NSURL *baseURL = [NSURL URLWithString:WMLBaseURL];
    NSDictionary *userInfo = @{WMLManagedObjectContextUserInfoKey : self.dataManager.managedObjectContext};
    self.requestor = [[WMLRequestor alloc] initWithBaseURL:baseURL userInfo:userInfo];
    WMLProductListController *controller = [[WMLProductListController alloc] initWithRequestor:self.requestor];
    
    [self.requestor addObserver:self forKeyPath:isNetworkActivityInProgressKey options:NSKeyValueObservingOptionNew context:&isNetworkActivityInProgressKey];
    
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    WMLProductListViewController *productListViewController = (WMLProductListViewController *)[[splitViewController.viewControllers firstObject] topViewController];
    productListViewController.productListController = controller;
    
    return YES;
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[WMLProductDetailsViewController class]] && ([(WMLProductDetailsViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (context == &isNetworkActivityInProgressKey)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:self.requestor.isNetworkActivityInProgress];
    }
}

@end
