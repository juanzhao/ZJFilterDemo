//
//  LYGPCollCell.m
//  rmd_lygp_ios
//
//  Created by ZJ on 17/2/21.
//  Copyright . All rights reserved.
//

#import "CollCell.h"

@implementation CollCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

@end
