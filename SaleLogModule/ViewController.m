//
//  ViewController.m
//  SaleLogModule
//
//  Created by QianjinLiu on 16/6/29.
//  Copyright © 2016年 QJ. All rights reserved.
//

#import "ViewController.h"

#import "SaleLogViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor yellowColor]];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(50, 80, 100, 30)];
    [btn setTitle:@"点击进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClicked:(UIButton *)sender
{
    SaleLogViewController *saleLOgVC = [[SaleLogViewController alloc]init];
    saleLOgVC.salelogTitleType = SaleVC_TitleTypeBusiness;
    [self.navigationController pushViewController:saleLOgVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
