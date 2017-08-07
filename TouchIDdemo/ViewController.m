//
//  ViewController.m
//  TouchIDdemo
//
//  Created by 白石洲霍华德 on 2017/8/7.
//  Copyright © 2017年 景文浩. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


#import "TouchIDTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2-30/2, self.view.frame.size.width, 30)];
    [button setTitle:@"Touch ID测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickTouchID) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    
}

- (void)clickTouchID
{
    
    [[TouchIDTool shareInstance] evaluatePolicy:@"指纹支付" fallbackTitle:nil SuccesResult:^{
        
        NSLog(@"打印成功");
        
    } FailureResult:^(LAError result) {
        
        
        switch (result) {
            case LAErrorSystemCancel:
            {
                NSLog(@"切换到其他APP");
                break;
            }
            case LAErrorUserCancel:
            {
                NSLog(@"用户取消验证Touch ID");
                
                break;
            }
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorUserFallback:
            {
                
                NSLog(@"用户选择输入密码");
                
                break;
            }
            default:
            {
                
                NSLog(@"其他情况");
                
                break;
            }
                
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
