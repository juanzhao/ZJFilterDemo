//
//  BrandsView.m
//  CategoryFilterDemo
//
//  Created by ZJ on 2017/12/18.
//  Copyright  All rights reserved.
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
