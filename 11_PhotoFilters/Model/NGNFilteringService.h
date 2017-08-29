//
//  NGNFilteringService.h
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 29.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Photos/Photos.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NGNFilteringEffectType) {
    NGNFilteringEffectTypeMono = 0,
    NGNFilteringEffectTypeChrome,
    NGNFilteringEffectTypeFade,
    NGNFilteringEffectTypeInvert,
    NGNFilteringEffectTypeNoir,
    NGNFilteringEffectTypeProcess,
    NGNFilteringEffectTypeTonal,
    NGNFilteringEffectTypeTransfer,
    NGNFilteringEffectTypeNone
};

typedef void (^completitionBlock) (UIImage *image, NGNFilteringEffectType effectType);

static const NSUInteger NGNFilteringEffectCount = 8;

// fine descision for enum and string values binding
static NSString *const NGNStringFilteringEffectType[] = {
    [NGNFilteringEffectTypeMono] = @"CIColorMonochrome",
    [NGNFilteringEffectTypeChrome] = @"CIPhotoEffectChrome",
    [NGNFilteringEffectTypeFade] = @"CIPhotoEffectFade",
    [NGNFilteringEffectTypeInvert] = @"CIColorInvert",
    [NGNFilteringEffectTypeNoir] = @"CIPhotoEffectNoir",
    [NGNFilteringEffectTypeProcess] = @"CIPhotoEffectProcess",
    [NGNFilteringEffectTypeTonal] = @"CIPhotoEffectTonal",
    [NGNFilteringEffectTypeTransfer] = @"CIPhotoEffectTransfer"
};

@interface NGNFilteringService : NSObject

+ (void)filterImage:(UIImage *)originalImafe effectType:(NGNFilteringEffectType)effectType completitionBlock:(completitionBlock)completitionBlock;

@end
