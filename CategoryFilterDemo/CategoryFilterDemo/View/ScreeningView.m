
//
//  ScreeningView.m
//  CategoryFilterDemo
//
//  Created by 赵娟娟 on 17/2/21.
//  Copyright © 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import "ScreeningView.h"

@implementation ScreeningView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self =  [[[NSBundle mainBundle]loadNibNamed:@"ScreeningView" owner:self options:nil]firstObject];
    }
    return self;
}


- (IBAction)btnClick:(UIButton *)sender {
    
    self.btnClickBlock(sender.tag);
}

@end
