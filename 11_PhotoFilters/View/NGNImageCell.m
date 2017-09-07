//
//  NGNImageCell.m
//  11_PhotoFilters
//
//  Created by Alexey Stafeyev on 29.08.17.
//  Copyright © 2017 Alexey Stafeyev. All rights reserved.
//

#import "NGNImageCell.h"

@implementation NGNImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 20;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2;
}

@end
