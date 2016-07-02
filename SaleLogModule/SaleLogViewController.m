//
//  SaleLogViewController.m
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import "SaleLogViewController.h"

#import "BusinessView.h"
#import "GiftView.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ArrayBusinessCount 11
#define ArrayGiftCount 4

#define CellHeight 40
#define CellHeightTextView (CellHeight+100)

@interface SaleLogViewController ()
{
    NSMutableArray *moduleArray;
    
}

@property (nonatomic,strong) UIScrollView *scrollView_saleLog;
@property (nonatomic,strong) BusinessView *businessView;
@property (nonatomic,strong) GiftView*giftView;
@property (nonatomic,strong) UIView *intercourse2View;

@end

@implementation SaleLogViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createScrollView_saleLog];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    
    [self initBusinessViewWithView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self initGiftViewWithView:_businessView];
    [self initIntercourse2iewWithView:_giftView];
    
    [self setScrollView_ContentOffsize];
}

- (void)createScrollView_saleLog
{
    if (!_scrollView_saleLog) {
        _scrollView_saleLog = [[UIScrollView alloc]init];
    }
    [_scrollView_saleLog setFrame:[[UIScreen mainScreen] bounds]];
    [_scrollView_saleLog setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:_scrollView_saleLog];
    
}

- (void)initBusinessViewWithView:(UIView *)view
{
    if (!_businessView) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"BusinessView" owner:self options:nil];
        _businessView = [nibs objectAtIndex:0];
    }
    
    _businessView.saleTitleType = self.salelogTitleType;
    
    CGRect tmpFRame = CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height, ScreenWidth, ArrayBusinessCount*CellHeight);
    [_businessView setFrame:tmpFRame];
    
    [self.scrollView_saleLog addSubview:_businessView];
    
    
    //下面这样写的原因是： 甲里引用乙，乙里引用甲，就会导致“retain cycle”，即造成“怪圈”的错误.
    //解决方案：创建一个本地变量 指向自己(self)
    __block SaleLogViewController *blockSelf = self;
    __block UIView *blockView = _businessView;
    
    _businessView.btnBusinessClickedBlock = ^(UIView *view,UIButton *btn) {
        if (btn.selected) {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, ArrayBusinessCount*CellHeight)];
        } else {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, CellHeight*2)];
        }
        
        [blockSelf frashViewFrameWithView:blockView];
        
    };
    
    
    if (!moduleArray) {
        moduleArray = [NSMutableArray new];
    } [moduleArray addObject:_businessView];
    
}

- (void)initGiftViewWithView:(UIView *)view
{
    if (!_giftView) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"GiftView" owner:self options:nil];
        _giftView = [nibs objectAtIndex:0];
    }
    
    _giftView.saleTitleType = self.salelogTitleType;
    
    CGRect tmpFRame = CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height, ScreenWidth, ArrayGiftCount*CellHeight);
    [_giftView setFrame:tmpFRame];
    [self.scrollView_saleLog addSubview:_giftView];
    
    
    __block SaleLogViewController *blockSelf = self;
    __block UIView *blockView = _giftView;
    
    _giftView.btnGiftViewClickedBlock = ^(UIView *view,UIButton *btn) {
        if (btn.selected) {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, ArrayGiftCount*CellHeight)];
        } else {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, CellHeight)];
        }
        [blockSelf frashViewFrameWithView:blockView];
    };
    
    if (!moduleArray) {
        moduleArray = [NSMutableArray new];
    } [moduleArray addObject:_giftView];
    
}

- (void)initIntercourse2iewWithView:(UIView *)view //应酬2
{
    if (!_intercourse2View) {
//        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"GiftView" owner:self options:nil];
//        _intercourse2View = [nibs objectAtIndex:0];
    }
    _intercourse2View = [[UIView alloc]init];
    [_intercourse2View setBackgroundColor:[UIColor magentaColor]];
    
    //    CGRect tmpFRame = CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height, ScreenWidth, ArrayGiftCount*CellHeight);
    CGRect tmpFRame = CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height, ScreenWidth, 195);
    
    [_intercourse2View setFrame:tmpFRame];
    [self.scrollView_saleLog addSubview:_intercourse2View];
    
//    _giftView.btnGiftViewClickedBlock = ^(UIView *view,UIButton *btn) {
//        if (btn.selected) {
//            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, ArrayGiftCount*CellHeight)];
//        } else {
//            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, CellHeight*2)];
//        }
//    [self frashViewFrameWithView:_intercourse2View];
//    };
    
    if (!moduleArray) {
        moduleArray = [NSMutableArray new];
    } [moduleArray addObject:_intercourse2View];
    
    

}


- (void)frashViewFrameWithView:(UIView *)view
{
    
    NSInteger index;
    if ([moduleArray containsObject:view]) {
        index = [moduleArray indexOfObject:view];
    }
    
    NSLog(@"count:%ld",index);
    
    while (++index<moduleArray.count) {
        
        UIView *nextView = [moduleArray objectAtIndex:index];
        UIView *frontView = [moduleArray objectAtIndex:index-1];
        [nextView setFrame:CGRectMake(nextView.frame.origin.x, frontView.frame.origin.y+frontView.frame.size.height, nextView.frame.size.width, nextView.frame.size.height)];
    } ;
    
}


- (void)setScrollView_ContentOffsize
{
    UIView *lastView = [moduleArray lastObject];
    if (lastView != nil) {
        [_scrollView_saleLog setContentSize:CGSizeMake(ScreenWidth, lastView.frame.origin.y+lastView.frame.size.height+320)];
    }
}
















































































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
