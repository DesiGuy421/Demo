//
//  MasterViewController.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WMLProductListController.h"

@class WMLProductDetailsViewController;

@interface WMLProductListViewController : UIViewController

@property (nonatomic, strong) WMLProductListController *productListController;

@property (strong, nonatomic) WMLProductDetailsViewController *detailViewController;

@end

