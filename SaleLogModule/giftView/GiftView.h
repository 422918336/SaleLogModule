//
//  GiftView.h
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SaleLogViewController.h"

@interface GiftView : UIView


@property (weak, nonatomic) IBOutlet UIButton *btn_GiftView;

- (IBAction)btn_giftView_Clicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *contentBackView;

@property (weak, nonatomic) IBOutlet UILabel *label_name;

@property (weak, nonatomic) IBOutlet UILabel *labelValue_name;

@property (weak, nonatomic) IBOutlet UILabel *label_money;

@property (weak, nonatomic) IBOutlet UITextField *textfield_money;


@property (copy,nonatomic) void (^ btnGiftViewClickedBlock)(UIView *view ,UIButton *btn);

@property (assign,nonatomic) SaleLog_Title_type saleTitleType;





@end
