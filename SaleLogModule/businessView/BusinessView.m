//
//  BusinessView.m
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import "BusinessView.h"

@implementation BusinessView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews ];
    
    //当前view超出内容的部分全部剪切掉
    self.contentBackView.clipsToBounds = YES;
    
    self.backgroundColor =[UIColor redColor];
    
    if (!(self.saleTitleType == SaleVC_TitleTypeBusiness)) {
        [self reSetSubViews];
    }
    
}

- (void)reSetSubViews
{
    
}

- (IBAction)btn_business_clicked:(id)sender {
    if (!_btn_Business.selected ) {
        _btn_Business.selected = YES;
        [UIView animateWithDuration:0.3 animations:^{
            [self.contentBackView setFrame:CGRectMake(self.contentBackView.frame.origin.x, self.contentBackView.frame.origin.y, self.contentBackView.frame.size.width, self.frame.size.height-_btn_Business.frame.size.height)];
            
            if (self.btnBusinessClickedBlock) {
                self.btnBusinessClickedBlock(self,self.btn_Business);
            }
            
        }];
        
    } else {
        
        _btn_Business.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            [self.contentBackView setFrame:CGRectMake(self.contentBackView.frame.origin.x, self.contentBackView.frame.origin.y, self.contentBackView.frame.size.width, 20)];
            
            if (self.btnBusinessClickedBlock) {
                self.btnBusinessClickedBlock(self,self.btn_Business);
            }
            
        }];
        
    }
    
}





- (void)setLabel_followUp:(UILabel *)label_followUp
{
    [self setMutableAttributedStringWithLabel:label_followUp];
}


- (void)setLabel_plan:(UILabel *)label_plan
{
    [self setMutableAttributedStringWithLabel:label_plan];
}


- (void)setMutableAttributedStringWithLabel:(UILabel *)sender
{
    //将某些字体颜色变成自定义颜色
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:sender.text];
    NSRange range = [sender.text rangeOfString:@"*"];
    if(range.length > 0){
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
        [str addAttribute:NSFontAttributeName value:sender.font range:NSMakeRange(0, 1)];
    }
    sender.attributedText = str;
}

@end
