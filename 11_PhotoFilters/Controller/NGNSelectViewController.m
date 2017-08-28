//
//  ViewController.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 28.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "NGNSelectViewController.h"
#import "NGNFilteringViewController.h"

@interface NGNSelectViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)selectButtonTapped:(UIButton *)sender;
- (IBAction)takeButtonTapped:(UIButton *)sender;

@end

@implementation NGNSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectButtonTapped:(UIButton *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

- (IBAction)takeButtonTapped:(UIButton *)sender {
    
}

#pragma mark - Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        NGNFilteringViewController *filteringViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NGNFilteringViewController"];
        filteringViewController.originalImage = image;
        [self.navigationController pushViewController:filteringViewController animated:YES];
    }];
}

@end
