//
//  FilterModel.h
//  CategoryFilterDemo
//
//  Created by ZJ on 2018/2/6.
//  Copyright © 2018年 XXX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterModel : NSObject

/**
 *  @brief  每个section里面cell的数据
 */

@property (nonatomic, strong) NSMutableArray *listArray;

/**
 *  @brief  cell未点击置为初始数据
 */

@property (nonatomic, strong) NSMutableArray *isSelectArray;

/**
 *  @brief  每个section组数据
 */

@property (nonatomic, copy) NSString *sectionName;

/**
 *  @brief  id
 */

@property (nonatomic, copy) NSString *ID;

/**
 *  @brief  attributeID
 */

@property (nonatomic, copy) NSString *attributeID;

/**
 *  @brief  propertyTypeId
 */

@property (nonatomic, copy) NSString *propertyTypeId;


/**
 *  @brief
 */

@property (nonatomic, copy) NSString *brandID;

/**
 *  @brief
 */

@property (nonatomic, copy) NSString *brandName;

/**
 *  @brief
 */

@property (nonatomic, copy) NSString *categoryID;

/**
 *  @brief
 */

@property (nonatomic, copy) NSString *categoryName;

/**
 *  @brief
 */

@property (nonatomic, assign) BOOL isClick;

#pragma mark -- 字典

-(instancetype)initWithDict:(NSDictionary *)dict;


@end
