//
//  DetailViewController.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMLProduct.h"
#import "WMLImageRequestDescriptor.h"
#import "WMLRequestor.h"

@interface WMLProductDetailsViewController : UIViewController

@property (nonatomic, strong) WMLProduct *product;
@property (nonatomic, strong) UIImage *productImage;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *ratingLabel;
@property (nonatomic, strong) IBOutlet UIImageView *productImageView;
@property (nonatomic, strong) IBOutlet UILabel *shortDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *longDescriptionLabel;

@end

