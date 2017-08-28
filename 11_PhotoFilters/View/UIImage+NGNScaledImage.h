//
//  UIImage+NGNScaledImage.h
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 29.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NGNScaledImage)

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;

@end
