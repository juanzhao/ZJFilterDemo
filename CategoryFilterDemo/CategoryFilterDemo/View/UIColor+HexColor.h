//
//  UIColor+HexColor.h
//  rmd_lygp_iphone
//
//  Created by ZJ  on 16/6/6.
//  Copyright  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

/**
 *  @author 李青楠
 *  @brief  获取UIColor色彩，根据Hex
 *  @return UIColor
 */
+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end
