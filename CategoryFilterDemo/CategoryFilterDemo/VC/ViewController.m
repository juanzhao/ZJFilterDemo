//
//  ViewController.m
//  CategoryFilterDemo
//
//  Created by 赵娟娟 on 2018/2/6.
//  Copyright © 2018年 XXX. All rights reserved.
//

#import "ViewController.h"
#import "FilterModel.h"
#import "ScreeningView.h"
#import "AttributeHeadView.h"
#import "BrandsView.h"
#import "CollCell.h"
#import "CollTextFieldCell.h"
#import "BrandCell.h"
#import "NSString+PinYin.h"
#import "UIColor+HexColor.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Color_Orange    [UIColor colorWithHexString:@"FE6000"]
#define TextColor_Dark  [UIColor colorWithHexString:@"333333"]

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) BrandsView *brandsView;
@property (nonatomic, strong) ScreeningView *screeningView; //筛选
@property (nonatomic, strong) NSMutableArray *selectedHeaderBtnArray;
@property (nonatomic, strong) NSMutableArray *headerTitleArray;
@property (nonatomic, strong) NSMutableArray *categoryListArray;//分类列表
@property (nonatomic, strong) NSMutableArray *brandListArray;//品牌列表
@property (nonatomic, strong) NSMutableArray *selectBrandsArray;//选中的品牌
@property (nonatomic, strong) NSMutableArray *selectTabBrandsArray;//tab选中的品牌
@property (nonatomic, strong) NSMutableArray *markBrandArray;//标记品牌起始未选中状态为0
@property (nonatomic, strong) NSMutableArray *markTabBrandArray;//标记tab起始未选中状态为0
@property (nonatomic, strong) NSMutableArray *seletBrandIDArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) BOOL isClickMoreBrand;
@property (nonatomic, copy) NSString *maxPrice;
@property (nonatomic, copy) NSString *mixPrice;

// 传接口的字段 多选
@property (nonatomic, copy) NSString *selectTabBrandStr;
@property (nonatomic, copy) NSString *selectBrandStr;

// 单选
@property (nonatomic, assign) NSInteger selectCategoryIndex;
@property (nonatomic, copy) NSString *selectCategoryIDStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];

    [self createScreentingView];
    
    [self createBrandsView];
}

#pragma mark --  假数据
- (void)createData
{
    self.brandListArray = [[NSMutableArray alloc]init];
    self.categoryListArray = [[NSMutableArray alloc]init];
    self.selectBrandsArray = [[NSMutableArray alloc]init];
    self.headerTitleArray = [[NSMutableArray alloc]init];
    self.selectedHeaderBtnArray = [[NSMutableArray alloc]init];
    self.markBrandArray = [[NSMutableArray alloc]init];
    self.selectTabBrandsArray = [[NSMutableArray alloc]init];
    self.seletBrandIDArray = [[NSMutableArray alloc]init];
    self.dataArray = [[NSMutableArray alloc]init];
    self.selectCategoryIndex = -1;
    
    //组头标题
    self.headerTitleArray = [NSMutableArray arrayWithArray:@[@"品牌",@"分类"]];
    
    //品牌数据
    for (NSInteger i = 0; i < 10; i++) {
        
        FilterModel *model = [[FilterModel alloc]init];
        model.brandID = [NSString stringWithFormat:@"%ld",i];
        model.brandName = [NSString stringWithFormat:@"品牌%ld",i];
        [self.brandListArray addObject:model];
    }
    
    for (NSInteger i = 0; i< self.brandListArray.count; i++) {
        
        [self.markBrandArray addObject:@"0"];
    }
    
    //分类数据
    for (NSInteger i = 0; i < 8; i++) {
        
        FilterModel *model = [[FilterModel alloc]init];
        model.categoryID = [NSString stringWithFormat:@"%ld",i];
        model.categoryName = [NSString stringWithFormat:@"分类%ld",i];
        [self.categoryListArray addObject:model];
    }
    
    // 索引品牌数据
    NSArray *arr = @[@"addss",@"bobo",@"coco",@"Nike",@"特步",@"贵人鸟",@"新百伦",@"VeroModa",@"摩奥",@"卓诗尼",@"红豆",@"唐狮",@"aaaa",@"bbbb",@"ccccc",@"ddddd",@"fffff",@"gggg",@"hhhhh",@"ttttt",@"hhhhh",@"eeeee"];
    
    // 排好序的数组
    NSArray *indexArray = [arr arrayWithPinYinFirstLetterFormat];
   
    for (NSDictionary *dict in indexArray) {
        
        FilterModel *model = [[FilterModel alloc]initWithDict:dict];
        model.isSelectArray = [[NSMutableArray alloc]init];
        
        for (NSInteger i = 0; i < model.listArray.count; i++) {
            
            [model.isSelectArray addObject:@"0"];
        }
        [self.dataArray addObject:model];
    }
}

#pragma mark -- 创建品牌
- (void)createBrandsView
{
    self.brandsView = [[BrandsView alloc]init];
    self.brandsView.frame = CGRectMake(Screen_Width, 0, Screen_Width - 40, Screen_Height);
    [self.view addSubview:self.brandsView];
    
    self.brandsView.tableView.dataSource = self;
    self.brandsView.tableView.delegate = self;
    
    [self.brandsView.tableView registerNib:[UINib nibWithNibName:@"BrandCell" bundle:nil] forCellReuseIdentifier:@"BrandCell"];
    
    __weak ViewController *weakVC = self;
    
    self.brandsView.btnBlick = ^(NSInteger btnTag) {
        
        if (btnTag == 10) {
            //返回 值不变
            [UIView animateWithDuration:0.3 animations:^{
                
                weakVC.brandsView.frame = CGRectMake(Screen_Width, 0, Screen_Width-40, Screen_Height);
            }];
            
        }else{
            //确定 清除原来选中的品牌 把此事选中品牌带过去 如果没选返回还是显示原来选中的
            
            weakVC.isClickMoreBrand = YES;
//            weakVC.selectTabBrandStr = [weakVC.selectTabBrandIDArray componentsJoinedByString:@","];
            
            [UIView animateWithDuration:0.3 animations:^{
                
                weakVC.brandsView.frame = CGRectMake(Screen_Width, 0, Screen_Width-40, Screen_Height);
            }];
            
            //清除以前选中brands
            for (NSInteger i = 0; i < weakVC.brandListArray.count; i++) {
                
                [weakVC.markBrandArray replaceObjectAtIndex:i withObject:@"0"];
            }
            
            [weakVC.screeningView.screenColView reloadData];
        }
    };
}

#pragma mark -- 创建筛选界面
- (void)createScreentingView
{
    self.screeningView = [[ScreeningView alloc]init];
    self.screeningView.frame = CGRectMake(Screen_Width, 0, Screen_Width, Screen_Height);
    self.screeningView.hidden = YES;
    [self.view addSubview:self.screeningView];

    self.screeningView.screenColView.delegate = self;
    self.screeningView.screenColView.dataSource = self;
   
    [self.screeningView.screenColView registerNib:[UINib nibWithNibName:@"CollCell" bundle:nil] forCellWithReuseIdentifier:@"CollCell"];
    [self.screeningView.screenColView registerNib:[UINib nibWithNibName:@"CollTextFieldCell" bundle:nil] forCellWithReuseIdentifier:@"CollTextFieldCell"];
    [self.screeningView.screenColView registerNib:[UINib nibWithNibName:@"AttributeHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AttributeHeadView"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackViewTap)];
    [self.screeningView.screenBlackView addGestureRecognizer:tap];
    
    __weak  ViewController *weakVC = self;
    
    self.screeningView.btnClickBlock = ^(NSInteger btntag){
        
        if (btntag == 20) {
            //重置
            //清除选中brands
            for (NSInteger i = 0; i < weakVC.brandListArray.count; i++) {
                
                [weakVC.markBrandArray replaceObjectAtIndex:i withObject:@"0"];
            }
            //清除选中attribute
            weakVC.selectCategoryIndex = -1;
            
            for (NSInteger i = 0; i< weakVC.dataArray.count; i++) {
                
                FilterModel *modelA = weakVC.dataArray[i];
                for (NSInteger j = 0; j < modelA.listArray.count; j++) {
                    
                    [modelA.isSelectArray replaceObjectAtIndex:j withObject:@"0"];
                }
            }
            
            [weakVC.selectBrandsArray removeAllObjects];
            [weakVC.seletBrandIDArray removeAllObjects];
            [weakVC.screeningView.screenColView reloadData];
            
            [weakVC.selectTabBrandsArray removeAllObjects];
            //            [weakVC.selectTabBrandIDArray removeAllObjects];
            [weakVC.brandsView.tableView reloadData];
            
        }else{
            //确定
            //把对应的价格 品牌id 分类 传给后台  4个必要字段
            weakVC.selectBrandStr = [weakVC.seletBrandIDArray componentsJoinedByString:@","];
            //直接传给接口 weakVC.selectCategoryIDStr
        }
    };
}

-(void)blackViewTap
{
    self.screeningView.screenBlackView.backgroundColor = [UIColor clearColor];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.screeningView.frame = CGRectMake(Screen_Width, 0, Screen_Width, Screen_Height);
        self.brandsView.frame = CGRectMake(Screen_Width, 0, Screen_Width-40, Screen_Height);
        
    }completion:^(BOOL finished) {
        
        self.screeningView.hidden = YES;
    }];
}

#pragma mark -- 品牌点击
-(void)brandClickAction
{
    [self.screeningView.screenColView reloadData];
}

#pragma mark --  collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section == 0){
        
        return 1;
        
    }else{
        
        NSString *indexStr = [NSString stringWithFormat:@"%ld",section - 1];
        if ([self.selectedHeaderBtnArray containsObject:indexStr]){
            // 展开
            if (section == 1) {
                
                if (self.brandListArray.count > 8) {
                    //显示更多按钮
                    return 9;
                    
                }else if (self.brandListArray.count <= 8){
                    
                    //不显示更多按钮
                    return self.brandListArray.count;
                }
                
            }else if (section == 2){
                
                return self.categoryListArray.count;
                
            }
        }else{
            // 默认显示
            if (section == 1) {
                
                if (self.brandListArray.count <= 6) {
                    return self.brandListArray.count;
                }else if (self.brandListArray.count == 0){
                    return 0;
                }else{
                    return  6;
                }
                
            }else if (section == 2){
                
                if (self.categoryListArray.count <= 6) {
                    return self.categoryListArray.count;
                }else if (self.categoryListArray.count == 0){
                    return 0;
                }else{
                    return  6;
                }
            }
        }
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        // 价格cell
        CollTextFieldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollTextFieldCell" forIndexPath:indexPath];
        
        cell.numberBlock = ^(NSString *min, NSString *max) {
            
            self.mixPrice = min;
            self.maxPrice= max;
            [self.screeningView.screenColView reloadData];
        };
        
        return cell;
        
    }else if(indexPath.section == 1){
        
        CollCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollCell" forIndexPath:indexPath];
        
        // 品牌
        FilterModel *model = self.brandListArray[indexPath.row];
        cell1.nameLabel.text = model.brandName;
        
        NSString *indexStr = [NSString stringWithFormat:@"%ld",indexPath.section - 1];
        if ([self.selectedHeaderBtnArray containsObject:indexStr]){
            //展开
            if (self.brandListArray.count > 8) {
                // 显示更多按钮
                if (indexPath.row == 8) {
                    
                    cell1.nameLabel.hidden = YES;
                    cell1.moreBrandLabel.hidden = NO;
                    cell1.arrowImage.hidden = NO;
                    
                }else{
                    
                    cell1.nameLabel.hidden = NO;
                    cell1.moreBrandLabel.hidden = YES;
                    cell1.arrowImage.hidden = YES;
                }
                
            }else{
                // 不显示 正常展示就行
                cell1.nameLabel.hidden = NO;
                cell1.moreBrandLabel.hidden = YES;
                cell1.arrowImage.hidden = YES;
            }
            
            if ([[self.markBrandArray objectAtIndex:indexPath.row]isEqualToString:@"0"]) {
                
                cell1.layer.borderWidth = 0;
                cell1.nameLabel.textColor = TextColor_Dark;
                cell1.nameLabel.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
                
            }else{
                
                cell1.layer.borderWidth = 0.5;
                cell1.layer.borderColor = Color_Orange.CGColor;
                cell1.nameLabel.textColor = Color_Orange;
                
            }
            return cell1;
            
        }else{
            //未展开
            if ([[self.markBrandArray objectAtIndex:indexPath.row]isEqualToString:@"0"]) {
                
                cell1.layer.borderWidth = 0;
                cell1.nameLabel.textColor = TextColor_Dark;
                cell1.nameLabel.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
                
            }else{
                
                cell1.layer.borderWidth = 0.5;
                cell1.layer.borderColor = Color_Orange.CGColor;
                cell1.nameLabel.textColor = Color_Orange;
                
            }
            
            return cell1;
        }
        
    }else{
        
        CollCell *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollCell" forIndexPath:indexPath];
        cell2.nameLabel.hidden = NO;
        cell2.moreBrandLabel.hidden = YES;
        cell2.arrowImage.hidden = YES;
        
        //分类
        FilterModel *model = self.categoryListArray[indexPath.row];
        cell2.nameLabel.text = model.categoryName;
        
        if (self.selectCategoryIndex == indexPath.row) {
            
            cell2.layer.borderWidth = 0.5;
            cell2.layer.borderColor = Color_Orange.CGColor;
            cell2.nameLabel.textColor = Color_Orange;
            
        }else{
            
            cell2.layer.borderWidth = 0;
            cell2.nameLabel.textColor = TextColor_Dark;
            cell2.nameLabel.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        }
        return cell2;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1){
        
        //展开
        if (self.brandListArray.count > 8) {
            // 显示更多按钮
            if (indexPath.row == 8) {
                
                //跳到品牌
                [UIView animateWithDuration:0.3 animations:^{
                    
                    self.brandsView.frame = CGRectMake(40 , 0, Screen_Width - 40 , Screen_Height);
                }];
                
            }else{
                
                self.isClickMoreBrand = NO;
                FilterModel *model = self.brandListArray[indexPath.row];
                
                if ([[self.markBrandArray objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                    
                    [self.markBrandArray replaceObjectAtIndex:indexPath.row withObject:@"1"];
                    [self.selectBrandsArray addObject:model.brandName];
                    //                        [self.seletBrandIDArray addObject:model.brandID];
                    
                }else{
                    
                    [self.markBrandArray replaceObjectAtIndex:indexPath.row withObject:@"0"];
                    [self.selectBrandsArray removeObject:model.brandName];
                    //                        [self.seletBrandIDArray removeObject:model.brandID];
                }
                
                [self.screeningView.screenColView reloadData];
            }
        }
    }
    if(indexPath.section == 2){
        
        FilterModel *model = self.categoryListArray[indexPath.row];
        
        if (self.selectCategoryIndex == indexPath.row) {
            
            self.selectCategoryIndex = -1;
            self.selectCategoryIDStr = @"";
            
        }else{
            
            self.selectCategoryIndex = indexPath.row;
            self.selectCategoryIDStr = model.categoryID;
        }
        [self.screeningView.screenColView reloadData];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return  CGSizeMake(self.screeningView.screenColView.frame.size.width, 120);
        
    }else{
        
        return  CGSizeMake((self.screeningView.screenColView.frame.size.width-50)/3, 30);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return  UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        return  UIEdgeInsetsMake(15, 15, 15, 15);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return CGSizeMake(0, 0);
        
    }else{
        return CGSizeMake(self.screeningView.screenColView.frame.size.width, 30);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            
            return nil;
            
        }else{
            
            AttributeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AttributeHeadView" forIndexPath:indexPath];
            
            if (headerView) {
                [headerView removeFromSuperview];
            }
            
            headerView.leftLabel.text = self.headerTitleArray[indexPath.section - 1];
            headerView.attributeBtn.tag = indexPath.section + 9;
            headerView.allLabel.hidden = NO;
            
            headerView.btnClickBlock = ^(UIButton *btn){
                
                NSString *string = [NSString stringWithFormat:@"%ld",btn.tag - 10];
                
                if ([self.selectedHeaderBtnArray containsObject:string]){
                    
                    [self.selectedHeaderBtnArray removeObject:string];
                    
                }else{
                    
                    [self.selectedHeaderBtnArray addObject:string];
                }
                
                [self.screeningView.screenColView reloadData];
            };
            
            // 显示选中的品牌
            headerView.selectLabel.text = @"";
            
            if (self.isClickMoreBrand) {
                
                if (self.selectTabBrandsArray.count > 0) {
                    
                    if (indexPath.section == 1) {
                        
                        NSString *selectBrandStr = [self.selectTabBrandsArray componentsJoinedByString:@","];
                        headerView.allLabel.hidden = YES;
                        headerView.selectLabel.text = selectBrandStr;
                        
                    }else{
                        
                        headerView.selectLabel.text = @"";
                    }
                }
                
            }else{
                
                if (self.selectBrandsArray.count > 0) {
                    
                    if (indexPath.section == 1) {
                        
                        NSString *selectBrandStr = [self.selectBrandsArray componentsJoinedByString:@","];
                        headerView.allLabel.hidden = YES;
                        headerView.selectLabel.text = selectBrandStr;
                        
                    }else{
                        
                        headerView.selectLabel.text = @"";
                    }
                }
            }
            //当前是否展开设置图片
            NSString *string = [NSString stringWithFormat:@"%ld",indexPath.section - 1];
            
            if ([self.selectedHeaderBtnArray containsObject:string]) {
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    [headerView.arrowImage setImage:[UIImage imageNamed:@"CV_Fold"]];
                }];
                
            }else{
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    [headerView.arrowImage setImage:[UIImage imageNamed:@"CV_Open"]];
                }];
            }
            
            return headerView;
        }
    }
    return nil;
}

#pragma mark -- tableViewDelagte
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FilterModel *model = self.dataArray[section];
    return model.listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BrandCell"];

    FilterModel *model = self.dataArray[indexPath.section];
    cell.brandNameLabel.text = model.listArray[indexPath.row];
    
    if ([[model.isSelectArray objectAtIndex:indexPath.row]isEqualToString:@"0"]) {
        
        cell.brandNameLabel.textColor = TextColor_Dark;
      
    }else{
        
        cell.brandNameLabel.textColor = Color_Orange;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilterModel *model = self.dataArray[indexPath.section];
    NSString *str = model.listArray [indexPath.row];
    
    if ([[model.isSelectArray objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        
        [model.isSelectArray replaceObjectAtIndex:indexPath.row withObject:@"1"];
        [self.selectTabBrandsArray addObject:str];
        //         [self.selectTabBrandIDArray addObject:model.brandID];
        
    
        
    }else{
        
        [model.isSelectArray replaceObjectAtIndex:indexPath.row withObject:@"0"];
        [self.selectTabBrandsArray removeObject:str];
        //         [self.selectTabBrandIDArray removeObject:model.brandID];
    }
    
    [self.dataArray replaceObjectAtIndex:indexPath.section withObject:model];
    
    [self.brandsView.tableView reloadData];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //自定义Header标题
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
    titleLabel.textColor = [UIColor colorWithHexString:@"33333"];
    
    FilterModel *model = self.dataArray[section];
    titleLabel.text = model.sectionName;
    [myView  addSubview:titleLabel];
    
    return myView;
}

//section （标签）标题显示
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FilterModel *model = self.dataArray[section];
    return model.sectionName;
}
// 设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 22;
}
//添加tableview 右侧索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        
        FilterModel *model = self.dataArray[i];
        [resultArray addObject:model.sectionName];
    }
    
    return resultArray;
}

//点击右侧索引表项时调用
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    return index;
}

#pragma mark -- 筛选点击
- (IBAction)filterBtnClick:(UIButton *)sender {
    
    self.screeningView.hidden = NO;
   
    [UIView animateWithDuration:0.3 animations:^{
    
        self.screeningView.screenBlackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        self.screeningView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
        
    }];
}


@end
