//
//  NGNFilteringService.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 29.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "NGNFilteringService.h"

@implementation NGNFilteringService

+ (void)filterImage:(UIImage *)originalImage
         effectType:(NGNFilteringEffectType)effectType
  completitionBlock:(completitionBlock)completitionBlock {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CIImage *ciImage = [CIImage imageWithCGImage:originalImage.CGImage];
        CIFilter *filter = [CIFilter filterWithName:NGNStringFilteringEffectType[effectType]];
        [filter setValue:ciImage forKey:kCIInputImageKey];
        CIImage *ciFilteredImage = [filter outputImage];
        UIImage *filteredImage = [UIImage imageWithCIImage:ciFilteredImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completitionBlock) {
                completitionBlock(filteredImage, effectType);
            }
        });
    });
    
}

@end
