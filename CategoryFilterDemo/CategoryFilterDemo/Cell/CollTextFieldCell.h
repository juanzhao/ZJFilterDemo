//
//  CollTextFieldCell.h
//  rmd_lygp_ios
//
//  Created by 赵娟娟 on 17/2/21.
//  Copyright © 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollTextFieldCell : UICollectionViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *leftNumTF;
@property (weak, nonatomic) IBOutlet UITextField *rightNumTF;

@property (nonatomic, strong) void(^numberBlock)(NSString *min,NSString *max);

@end
