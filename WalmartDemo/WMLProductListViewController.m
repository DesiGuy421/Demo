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

@interface WMLProductListViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    NSFetchedResultsControllerDelegate
>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation WMLProductListViewController
{
    NSMutableArray *_insertedIndexPaths;
}

#pragma mark - Instance methods

- (NSAttributedString *)attributedStringForHTMLString:(NSString *)htmlString
{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                                                            options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                      NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                 documentAttributes:nil error:nil];
    return attributedString;
    
}

#pragma mark - UIControl methods

- (IBAction)loadMoreTapped:(id)sender
{
    [self.productListController startRequestForNextPageOfProductsWithCompletion:NULL];
}

#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    flowLayout.estimatedItemSize = CGSizeMake(240.0, 220.0);
    flowLayout.itemSize = CGSizeMake(240.0, 220.0);
    
    NSString *identifier = NSStringFromClass([WMLProductCollectionViewCell class]);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];

    self.fetchedResultsController = [self.productListController createFetchedResultsController];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:NULL];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (WMLProductDetailsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
//    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.collectionView indexPathsForSelectedItems][0];

        WMLProductDetailsViewController *controller = (WMLProductDetailsViewController *)[[segue destinationViewController] topViewController];

        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
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
    
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[indexPath.section];
    WMLProduct *product = sectionInfo.objects[indexPath.item];
    
    cell.nameLabel.text = product.name;
    cell.priceLabel.text = product.price;
    cell.ratingLabel.text = [product ratingText];
//    cell.descriptionLabel.attributedText = [self attributedStringForHTMLString:product.shortDetails];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate methods



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
