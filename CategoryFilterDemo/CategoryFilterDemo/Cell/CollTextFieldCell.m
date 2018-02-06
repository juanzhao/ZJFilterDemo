//
//  LYGPCollTextFieldCell.m
//  rmd_lygp_ios
//
//  Created by 赵娟娟 on 17/2/21.
//  Copyright © 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import "CollTextFieldCell.h"

@implementation CollTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.leftNumTF.delegate = self.rightNumTF.delegate = self;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.leftNumTF.text < self.rightNumTF.text) {
        
        self.numberBlock(self.leftNumTF.text,self.rightNumTF.text);
        
    }else{
        
        self.numberBlock(self.rightNumTF.text,self.leftNumTF.text);
    }
}

@end
