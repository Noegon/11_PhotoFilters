//
//  NGNFilteringViewController.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 28.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "NGNFilteringViewController.h"
#import "UIImage+NGNScaledImage.h"
#import "NGNImageCell.h"

static NSString *const NGNThumbnailICelldentifier = @"NGNThumbnailICelldentifier";

@interface NGNFilteringViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UIImage *thumbnailImage;

@end

@implementation NGNFilteringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.originalImage;
    self.thumbnailImage = [UIImage imageWithImage:self.originalImage convertToSize:CGSizeMake(90, 90)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView data source delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NGNImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NGNThumbnailICelldentifier
                                                                   forIndexPath:indexPath];
    return cell;
}

@end
