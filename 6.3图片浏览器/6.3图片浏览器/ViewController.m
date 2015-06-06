//
//  ViewController.m
//  6.3图片浏览器
//
//  Created by 徐颖玲 on 15/6/5.
//  Copyright (c) 2015年 yjm. All rights reserved.
//

#define kIconKey @"icon"
#define kDescKey @"desc"

#import "ViewController.h"

@interface ViewController ()

- (IBAction)previous;
- (IBAction)next;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *noLable;
@property (weak, nonatomic) IBOutlet UILabel *describeLable;

@property (nonatomic, assign) int index;

//用NSArray来保存需要的图片集合
@property (nonatomic, strong) NSArray *imageData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.index = 1;
    [self changeData];
}

- (NSArray *)imageData
{
    if (_imageData == nil) { // 从未初始化
        
        // 初始化数据：用变量来表示需要变更的数据，提高代码到复用性
        // File : 全路径
        // NSBundle : 一个NSBundle代表一个文件夹
        
        // 利用mainBundle就可以访问软件资源包中的任何资源
        NSBundle *bundle = [NSBundle mainBundle];
        
        //  获得imageData.plist的全路径
        NSString *path = [bundle pathForResource:@"imageData" ofType:@"plist"];
        
        _imageData = [NSArray arrayWithContentsOfFile:path];
        
        
        /*
        // 初始化数据
        NSMutableDictionary *image1 = [NSMutableDictionary dictionary];
        image1[kIconKey] = @"biaoqingdi";
        image1[kDescKey] = @"在他面前，其他神马表情都弱爆了！";
        
        NSMutableDictionary *image2 = [NSMutableDictionary dictionary];
        image2[kIconKey] = @"wangba";
        image2[kDescKey] = @"哥们为什么选八号呢";
        
        NSMutableDictionary *image3 = [NSMutableDictionary dictionary];
        image3[kIconKey] = @"bingli";
        image3[kDescKey] = @"这也忒狠了";
         
        _imageData = @[image1, image2, image3];*/
    }
    return _imageData;

}

- (void)changeData
{
     // 1.改变数据
    self.noLable.text = [NSString stringWithFormat:@"%d/%lu",self.index+1, (unsigned long)self.imageData.count];
    
    // 2.取出index对应的字典数据;字典保存的image和text信息
    NSDictionary *imageDict = self.imageData[self.index];
    
    // 3.设置图片
    self.iconView.image = [UIImage imageNamed:imageDict[kIconKey]];
    
    // 4.设置描述
    self.describeLable.text = imageDict[kDescKey];
    
    self.leftBtn.enabled = (self.index!=0);
    self.rightBtn.enabled = (self.index != self.imageData.count-1);
}


- (void)previous
{
    self.index--;
    [self changeData];
}

- (IBAction)next
{
    self.index++;
    [self changeData];
}
@end
