//
//  LYGPCollCell.h
//  rmd_lygp_ios
//
//  Created by 赵娟娟 on 17/2/21.
//  Copyright © 猎鹰全球国际电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UILabel *moreBrandLabel;

@end
