//
//  ViewController.m
//  类似IPhone_AssitiveTouch圆点
//
//  Created by 陈绪混 on 16/3/2.
//  Copyright © 2016年 Chenxuhun. All rights reserved.
//

#import "ViewController.h"
#import "DTouchButton.h"
@interface ViewController () <touchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.337 green:0.698 blue:0.784 alpha:1.000];
    
    DTouchButton *touchBtn = [[DTouchButton alloc] initWithFrame:CGRectMake(0, 100, 58, 58)];
    touchBtn.delegate = self;
    touchBtn.userInteractionEnabled_DT = YES;
    [self.view addSubview:touchBtn];
   
}

-(void) touchDownDTButton
{
    NSLog(@"点击到AsstisTouchBtn");
}

@end
