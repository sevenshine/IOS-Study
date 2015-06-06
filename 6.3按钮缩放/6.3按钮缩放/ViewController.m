//
//  ViewController.m
//  6.3按钮缩放
//
//  Created by 徐颖玲 on 15/6/3.
//  Copyright (c) 2015年 yjm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)moveAndBig;
- (IBAction)move:(UIButton *)btn;
- (IBAction)big;
- (IBAction)small;


@property (weak, nonatomic) IBOutlet UIButton *head;


@end

@implementation ViewController

- (void)moveAndBig
{
    
    NSLog(@"yes");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    
    CGRect temp = self.head.frame;
    temp.origin.y += 50;
    temp.size.height += 20;
    temp.size.width += 20;
    
    self.head.frame  = temp;
    
    
    [UIView commitAnimations];
    
    
}

//修改：关键三步
- (void)move:(UIButton *)btn
{
    /** 4.需要执行动画的代码 **/
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:1.0]; //默认0.25秒
    
    // 1.取出原来的属性
    CGRect tempF = self.head.frame;
    
    CGFloat delta = 10;
    //button通过tag来标志
    switch (btn.tag) {
        case 10://上
            tempF.origin.y -= delta;
            break;
        case 20:
            tempF.origin.y += delta;
            break;
        case 30:
            tempF.origin.x -= delta;
            break;
        case 40:
            tempF.origin.x += delta;
            break;
            
        default:
            break;
    }
    
    // 3.重新赋值
    self.head.frame = tempF;
    
    //[UIView commitAnimations];
    
}

- (void)big
{
    //CGRect 临时变量来修改frame
    CGRect tempFrame = self.head.frame;
    
    tempFrame.size.width += 20;
    tempFrame.size.height += 20;
    
    self.head.frame = tempFrame;
}

- (void)small
{
    CGRect tempFrame = self.head.frame;
    
    tempFrame.size.width -= 20;
    tempFrame.size.height -= 20;
    
    self.head.frame = tempFrame;
}

@end
