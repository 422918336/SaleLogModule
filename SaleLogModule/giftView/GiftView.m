//
//  GiftView.m
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import "GiftView.h"

@implementation GiftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    
    [self.contentBackView setClipsToBounds:YES];
    
    if (self.saleTitleType == SaleVC_TitleTypeBusiness) {
        for (UIView *subViewSelf in self.subviews) {
            if (subViewSelf != self.btn_GiftView) {
                [subViewSelf setFrame:CGRectMake(subViewSelf.frame.origin.x, subViewSelf.frame.origin.y-self.btn_GiftView.frame.size.height, subViewSelf.frame.size.width, subViewSelf.frame.size.height)];
            }
        }
        
        [self.btn_GiftView setFrame:CGRectMake(0, 0, 0, 0)];
        
    }
    
}

- (IBAction)btn_giftView_Clicked:(id)sender {
    
    if (_btn_GiftView.selected ) {
        _btn_GiftView.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            [self.contentBackView setFrame:CGRectMake(self.contentBackView.frame.origin.x, self.contentBackView.frame.origin.y, self.contentBackView.frame.size.width, 20)];
            
            if (self.btnGiftViewClickedBlock) {
                self.btnGiftViewClickedBlock(self,self.btn_GiftView);
            }
            
        }];
        
        //        [self.contentBackView setHidden:YES];
        
    } else {
        
        _btn_GiftView.selected = YES;
        [UIView animateWithDuration:0.3 animations:^{
            [self.contentBackView setFrame:CGRectMake(self.contentBackView.frame.origin.x, self.contentBackView.frame.origin.y, self.contentBackView.frame.size.width, self.frame.size.height-_btn_GiftView.frame.size.height)];
            
            if (self.btnGiftViewClickedBlock) {
                self.btnGiftViewClickedBlock(self,self.btn_GiftView);
            }
            
        }];
        
        //        [self.contentBackView setHidden:NO];
    }
    
}





@end
