//
//  CollTextFieldCell.h
//  rmd_lygp_ios
//
//  Created by ZJ on 17/2/21.
//  Copyright  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollTextFieldCell : UICollectionViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *leftNumTF;
@property (weak, nonatomic) IBOutlet UITextField *rightNumTF;

@property (nonatomic, strong) void(^numberBlock)(NSString *min,NSString *max);

@end
