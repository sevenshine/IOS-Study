//
//  ViewController.m
//  6.2计算器
//
//  Created by 徐颖玲 on 15/6/2.
//  Copyright (c) 2015年 yjm. All rights reserved.
//

#import "ViewController.h"


//类扩展（私有扩展）
@interface ViewController ()

//点击button调用compute方法
//监听事件用方法
- (IBAction)compute;

@property (weak, nonatomic) IBOutlet UITextField *num1;
@property (weak, nonatomic) IBOutlet UITextField *num2;
@property (weak, nonatomic) IBOutlet UILabel *result;


@end

@implementation ViewController



- (void)compute
{
    //intValue NSString方法，转化为int实现相加功能；
    int n1 = [self.num1.text intValue];
    int n2 = [self.num2.text intValue];
    
    //int 转化成NSString型
    self.result.text = [NSString stringWithFormat:@"%d", n1 + n2];
    NSLog(@"yes it is ");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
