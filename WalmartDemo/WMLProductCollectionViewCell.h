//
//  WMLProductCollectionViewCell.h
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/6/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMLProductCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *ratingLabel;
@property (nonatomic, strong) IBOutlet UIImageView *productImageView;

@end
