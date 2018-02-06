//
//  FilterModel.m
//  CategoryFilterDemo
//
//  Created by 赵娟娟 on 2018/2/6.
//  Copyright © 2018年 XXX. All rights reserved.
//

#import "FilterModel.h"

@implementation FilterModel

/**
 *  初始化
 */
- (instancetype)init{
    
    self =[super init];
    
    if (self) {
        
        self.isClick = NO;
        self.sectionName=[[NSString alloc]init];
        self.ID=[[NSString alloc]init];
        self.attributeID=[[NSString alloc]init];
        self.propertyTypeId=[[NSString alloc]init];
        self.brandName = [[NSString alloc]init];
        self.brandID = [[NSString alloc]init];
        self.categoryID = [[NSString alloc]init];
        self.categoryName = [[NSString alloc]init];
        self.listArray =[NSMutableArray array];
        self.isSelectArray =[NSMutableArray array];
        
    }
    return self;
}

/**
 *  @brief  解析dict
 */

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    
    if (self) {
        
        self.listArray = [dict objectForKey:@"content"];
        self.sectionName = [dict objectForKey:@"firstLetter"];
    }
    return self;
}

@end
