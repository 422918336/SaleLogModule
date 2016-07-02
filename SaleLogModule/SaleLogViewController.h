//
//  SaleLogViewController.h
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SaleLogType) {
    SaleLogTypeNew = -1,    //新建
    SaleLogTypeEditing,     //编辑
    SaleLogTypeDetailes     //详情
    
};


typedef NS_ENUM(NSInteger,SaleLog_Title_type) {
    
    SaleVC_TitleTypeBusiness = 0,   //商业意向
    SaleVC_TitleTypeIntercourse1,   //应酬1
    SaleVC_TitleTypeIntercourse2,   //应酬2
    SaleVC_TitleTypeProposal,       //提案
    SaleVC_TitleTypeSolve,          //解决问题
    SaleVC_TitleTypeVisit,          //常规拜访
    
};




@interface SaleLogViewController : UIViewController


@property (nonatomic,assign) SaleLog_Title_type salelogTitleType;
@property (nonatomic,assign) SaleLogType saleLogType;


@end
