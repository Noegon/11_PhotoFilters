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
#import "NGNFilteringService.h"

static NSString *const NGNThumbnailICelldentifier = @"NGNThumbnailICelldentifier";

@interface NGNFilteringViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UIImage *scaledImage;
@property (strong, nonatomic) UIImage *thumbnailImage;
@property (strong, nonatomic) UIImage *handledImage;
@property (assign, nonatomic, getter=isHandlingInProgress) BOOL handlingInProgress;
@property (assign, nonatomic) NGNFilteringEffectType currentType;

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;

@end

@implementation NGNFilteringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize scale = (self.originalImage.size.width > self.view.bounds.size.width) ? CGSizeMake(0.2, 0.2) : self.originalImage.size;
    self.scaledImage = [UIImage imageWithImage:self.originalImage convertWithScale:scale];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.autoresizingMask = ( UIViewAutoresizingNone );
    
    self.imageView.image = self.scaledImage;
    self.thumbnailImage = [UIImage imageWithImage:self.originalImage convertToSize:CGSizeMake(90, 90)];
    self.handlingInProgress = NO;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.isHandlingInProgress) {
        return;
    }
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:self.handledImage];
    } completionHandler:^(BOOL success, NSError *error){
        if (error) {
            NSLog(@"%@", error.userInfo);
        }
    }];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"%@", error.userInfo);
    }
}

#pragma mark - CollectionView data source delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return NGNFilteringEffectCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NGNImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NGNThumbnailICelldentifier
                                                                   forIndexPath:indexPath];
    [NGNFilteringService filterImage:self.thumbnailImage
                          effectType:indexPath.row
                   completitionBlock:
     ^(UIImage *filterredImage, NGNFilteringEffectType effectType){
         if (effectType != NGNFilteringEffectTypeNone) {
             cell.imageView.image = filterredImage;
         }
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.isHandlingInProgress) {
        return;
    }
    self.handlingInProgress = YES;
    [NGNFilteringService filterImage:self.scaledImage
                          effectType:indexPath.row
                   completitionBlock:
     ^(UIImage *filteredImage, NGNFilteringEffectType effectType){
         self.imageView.image = filteredImage;
         
         self.currentType = indexPath.row;
         self.handlingInProgress = NO;
    }];
}

@end
