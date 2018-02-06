//
//  AttributeHeadView.m
//  CategoryFilterDemo
//
//  Created by ZJ on 17/4/5.
//  Copyright © 2017年 Raymond. All rights reserved.
//

#import "AttributeHeadView.h"

@implementation AttributeHeadView

- (void)awakeFromNib {
    
    [super awakeFromNib];
 
     
}
- (IBAction)btnClick:(id)sender {
    
    self.btnClickBlock(sender);
}


@end
