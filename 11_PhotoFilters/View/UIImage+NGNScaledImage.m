//
//  UIImage+NGNScaledImage.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 29.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "UIImage+NGNScaledImage.h"

@implementation UIImage (NGNScaledImage)

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image convertWithScale:(CGSize)scale {
    UIGraphicsBeginImageContext(CGSizeMake((image.size.width * scale.width), (image.size.height * scale.height)));
    [image drawInRect:CGRectMake(0, 0, (image.size.width * scale.width), (image.size.height * scale.height))];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

@end
