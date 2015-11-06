//
//  DetailViewController.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLProductDetailsViewController.h"


@interface WMLProductDetailsViewController ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIStackView *stackView;

@end

@implementation WMLProductDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self populateViewFromProduct:self.product];
}

- (void)populateViewFromProduct:(WMLProduct *)product
{
    self.nameLabel.text = product.name;
    self.priceLabel.text = product.price;
    self.ratingLabel.text = [product ratingText];
    self.shortDescriptionLabel.attributedText = [self attributedStringForHTMLString:product.shortDetails];
    self.longDescriptionLabel.attributedText = [self attributedStringForHTMLString:product.longDetails];
    self.productImageView.image = self.productImage;
}

- (void)setProduct:(WMLProduct *)product
{
    _product = product;
    
    [self populateViewFromProduct:product];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    dispatch_async(dispatch_get_main_queue(), ^
    {
        CGSize size = self.scrollView.contentSize;
        size.height = self.stackView.frame.size.height;
        size.width = self.scrollView.bounds.size.width;
        self.scrollView.contentSize = size;
    });
}

- (NSAttributedString *)attributedStringForHTMLString:(NSString *)htmlString
{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                                                            options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                      NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                 documentAttributes:nil error:nil];
    return attributedString;
    
}

@end
