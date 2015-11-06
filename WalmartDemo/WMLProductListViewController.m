//
//  MasterViewController.m
//  WalmartDemo
//
//  Created by Aqeel Gunja on 11/5/15.
//  Copyright © 2015 Aqeel Gunja. All rights reserved.
//

#import "WMLProductListViewController.h"
#import "WMLProductDetailsViewController.h"
#import "WMLProductCollectionViewCell.h"
#import "WMLCollectionReusableView.h"

#import "WMLRequestor.h"
#import "WMLImageRequestDescriptor.h"

static CGFloat WMLCellAspectRatio = 240.0/220;

@interface WMLProductListViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    NSFetchedResultsControllerDelegate
>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UICollectionReusableView *reusableView;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) WMLRequestor *imageRequestor;

@property (nonatomic, strong) NSCache *imageCache;

@property (nonatomic, strong) WMLProduct *selectedProduct;

@end

@implementation WMLProductListViewController
{
    NSMutableArray *_insertedIndexPaths;
}

#pragma mark - Instance methods

- (void)loadImageForProduct:(WMLProduct *)product inCell:(WMLProductCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    WMLImageRequestDescriptor *imageRequestDescriptor = [[WMLImageRequestDescriptor alloc] init];
    imageRequestDescriptor.imageURLString = product.productImageURLString;
    [self.imageRequestor startRequestWithDescriptor:imageRequestDescriptor completion:^(UIImage *image, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(), ^
                        {
                            [self.imageCache setObject:image forKey:product.identifier];
                            
                            cell.productImageView.image = image;
                        });
     }];
}

- (void)requestNextPage
{
    __weak typeof(self) weakSelf = self;
    [self.productListController startRequestForNextPageOfProductsWithCompletion:^
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            NSInteger count = [weakSelf.productListController totalProducts];
            weakSelf.navigationItem.prompt = [NSString stringWithFormat:@"%ld products found | %ld showing", count, [weakSelf.fetchedResultsController.fetchedObjects count]];
        });
    }];
}

#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageCache = [[NSCache alloc] init];
    self.imageCache.countLimit = 30;
    
    self.imageRequestor = [[WMLRequestor alloc] initWithBaseURL:nil userInfo:nil];
    
    NSString *identifier = NSStringFromClass([WMLProductCollectionViewCell class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
    NSString *footer = NSStringFromClass([WMLCollectionReusableView class]);
    UINib *footerNib = [UINib nibWithNibName:footer bundle:nil];
    [self.collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footer];

    self.fetchedResultsController = [self.productListController createFetchedResultsController];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:NULL];
    

    self.detailViewController = (WMLProductDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {

        WMLProductDetailsViewController *controller = (WMLProductDetailsViewController *)[[segue destinationViewController] topViewController];
        controller.product = self.selectedProduct;
        UIImage *productImage = [self.imageCache objectForKey:self.selectedProduct.identifier];
        controller.productImage = productImage;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGRect bounds = self.collectionView.bounds;
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat cellWidth = bounds.size.width - 32.0;
    flowLayout.itemSize = CGSizeMake(cellWidth, ceilf(cellWidth/WMLCellAspectRatio));
    flowLayout.footerReferenceSize = CGSizeMake(cellWidth, 50.0);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat cellWidth = size.width - 32.0;
    flowLayout.itemSize = CGSizeMake(cellWidth, ceilf(cellWidth/WMLCellAspectRatio));
}

#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.fetchedResultsController.sections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    return sectionInfo.numberOfObjects;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([WMLProductCollectionViewCell class]);
    WMLProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    WMLProduct *product = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.nameLabel.text = product.name;
    cell.priceLabel.text = product.price;
    cell.ratingLabel.text = [product ratingText];
    
    UIImage *cachedImage = [self.imageCache objectForKey:product.identifier];
    cell.productImageView.image = cachedImage;
    if (!cachedImage)
    {
        [self loadImageForProduct:product inCell:cell atIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    WMLProduct *product = [self.fetchedResultsController objectAtIndexPath:indexPath];
    self.selectedProduct = product;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (!self.productListController.requestInProgress)
    {
        [self requestNextPage];
    }
    NSString *footer = NSStringFromClass([WMLCollectionReusableView class]);
    WMLCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footer forIndexPath:indexPath];
    return view;
}

#pragma mark - NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    _insertedIndexPaths = [NSMutableArray array];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    if (type == NSFetchedResultsChangeInsert)
    {
        [_insertedIndexPaths addObject:newIndexPath];
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *insertedIndexPaths = _insertedIndexPaths;
    [self.collectionView performBatchUpdates:^
    {
        [weakSelf.collectionView insertItemsAtIndexPaths:insertedIndexPaths];
    } completion:^(BOOL finished)
    {
        [insertedIndexPaths removeAllObjects];
    }];
}

@end
