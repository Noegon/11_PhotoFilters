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
    
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.imageView.layer.borderWidth = 2;
}

@end
