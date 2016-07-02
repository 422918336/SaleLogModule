//
//  BusinessView.h
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SaleLogViewController.h"

@interface BusinessView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btn_Business; //商业意向 按钮
- (IBAction)btn_business_clicked:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *contentBackView;


@property (weak, nonatomic) IBOutlet UILabel *label_followUp;//跟进意向
@property (weak, nonatomic) IBOutlet UILabel *labelValue_followUp;

@property (weak, nonatomic) IBOutlet UILabel *label_plan;//计划
@property (weak, nonatomic) IBOutlet UITextField *textfield_plan;

@property (copy,nonatomic) void (^ btnBusinessClickedBlock)(UIView *selfView,UIButton *btn);

@property (assign,nonatomic) SaleLog_Title_type saleTitleType;


@end
