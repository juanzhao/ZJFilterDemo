//
//  LYGPCollCell.m
//  rmd_lygp_ios
//
//  Created by 赵娟娟 on 17/2/21.
//  Copyright © 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import "CollCell.h"

@implementation CollCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

@end
