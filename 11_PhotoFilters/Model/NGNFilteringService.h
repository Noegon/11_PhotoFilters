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
    NGNFilteringEffectTypeNone = 0,
    NGNFilteringEffectTypeMono,
    NGNFilteringEffectTypeChrome,
    NGNFilteringEffectTypeFade,
    NGNFilteringEffectTypeInstant,
    NGNFilteringEffectTypeNoir,
    NGNFilteringEffectTypeProcess,
    NGNFilteringEffectTypeTonel,
    NGNFilteringEffectTypeTransfer
};

typedef void (^completitionBlock) (UIImage *image, NGNFilteringEffectType effectType);

static const NSUInteger FilteringEffectCount = 8;

static NSString *const NGNStringFilteringEffectType[] = {
    [NGNFilteringEffectTypeMono] = @"",
    [NGNFilteringEffectTypeChrome] = @"",
    [NGNFilteringEffectTypeFade] = @"",
    [NGNFilteringEffectTypeInstant] = @"",
    [NGNFilteringEffectTypeNoir] = @"",
    [NGNFilteringEffectTypeProcess] = @"",
    [NGNFilteringEffectTypeTonel] = @"",
    [NGNFilteringEffectTypeTransfer] = @""
};

@interface NGNFilteringService : NSObject

@end
