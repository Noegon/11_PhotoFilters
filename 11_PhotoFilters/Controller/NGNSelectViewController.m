//
//  ViewController.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 28.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "NGNCommonConstants.h"
#import "NGNSelectViewController.h"
#import "NGNFilteringViewController.h"

@interface NGNSelectViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)selectButtonTapped:(UIButton *)sender;
- (IBAction)takeButtonTapped:(UIButton *)sender;

@end

@implementation NGNSelectViewController

- (IBAction)selectButtonTapped:(UIButton *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

- (IBAction)takeButtonTapped:(UIButton *)sender {

}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:NGNFilteringViewController.class]) {
        NGNFilteringViewController *filteringViewController = segue.destinationViewController;
        filteringViewController.originalImage = self.imageView.image;
    }
}

#pragma mark - Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = image;
    }];
}

@end
