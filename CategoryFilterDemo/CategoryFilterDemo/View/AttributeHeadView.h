//
//  AttributeHeadView.h
//  CategoryFilterDemo
//
//  Created by ZJ on 17/4/5.
//  Copyright © 2017年 Raymond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributeHeadView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UIButton *attributeBtn;
@property (weak, nonatomic) IBOutlet UILabel *allLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *allLabelRightWidth;
@property (weak, nonatomic) IBOutlet UILabel *selectLabel;

@property (nonatomic, strong) void(^btnClickBlock)(UIButton *btn);

@end
