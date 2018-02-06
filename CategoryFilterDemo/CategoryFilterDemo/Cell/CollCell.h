//
//  LYGPCollCell.h
//  rmd_lygp_ios
//
//  Created by ZJ on 17/2/21.
//  Copyright All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UILabel *moreBrandLabel;

@end
