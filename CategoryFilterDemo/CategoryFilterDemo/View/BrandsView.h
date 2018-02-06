//
//  BrandsView.h
//  CategoryFilterDemo
//
//  Created by ZJ on 2017/12/18.
//  Copyright . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandsView : UIView

@property (weak, nonatomic) IBOutlet UIView *leftArrowBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) void (^btnBlick)(NSInteger btnTag);

@end

