//
//  BrandsView.h
//  CategoryFilterDemo
//
//  Created by 赵娟娟 on 2017/12/18.
//  Copyright © 2017年 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandsView : UIView

@property (weak, nonatomic) IBOutlet UIView *leftArrowBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) void (^btnBlick)(NSInteger btnTag);

@end

