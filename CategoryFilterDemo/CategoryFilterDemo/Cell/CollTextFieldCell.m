//
//  LYGPCollTextFieldCell.m
//  rmd_lygp_ios
//
//  Created by ZJ on 17/2/21.
//  Copyright  All rights reserved.
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
