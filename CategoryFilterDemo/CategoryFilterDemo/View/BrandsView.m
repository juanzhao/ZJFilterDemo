//
//  BrandsView.m
//  CategoryFilterDemo
//
//  Created by 赵娟娟 on 2017/12/18.
//  Copyright © 2017年 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import "BrandsView.h"

@implementation BrandsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"BrandsView" owner:self options:nil]firstObject];
    }
    return self;
}

- (IBAction)btnClick:(UIButton *)sender {
    
    self.btnBlick(sender.tag);
}


@end
