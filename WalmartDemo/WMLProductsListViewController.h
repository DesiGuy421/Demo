//
//  MasterViewController.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMLProductDetailsViewController;

@interface WMLProductsListViewController : UITableViewController

@property (strong, nonatomic) WMLProductDetailsViewController *detailViewController;


@end

