//
//  ViewController.m
//  segmentController
//
//  Created by mac on 17/3/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"

#import "XYYSegmentControl.h"

#define RED        ( arc4random() % 255 / 255.0 ) //0.0 to 1.0
#define GREEN  ( arc4random() % 255 / 255.0 )  // 0.5 to 1.0,away from white
#define BLUE ( arc4random() % 255 / 255.0 )  //0.5 to 1.0,away from black

#define EDTRandColor [UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:1]

@interface ViewController ()<XYYSegmentControlDelegate>
@property (nonatomic, strong) XYYSegmentControl *slideSwitchView;
@property (nonatomic,strong)  NSArray    *itemArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self buildSegment];
}

-(void) buildSegment
{
    self.itemArray = @[@"全部",@"教育",@"娱乐",@"记录",@"新闻",@"动画",@"合辑",@"战争",@"警匪",@"武侠"];
    self.slideSwitchView = [[XYYSegmentControl alloc]initWithFrame:CGRectMake(0 , 60 , self.view.frame.size.width, self.view.frame.size.height) channelName:_itemArray source:self];
    [self.slideSwitchView setUserInteractionEnabled:YES];
    //XYYSegmentControl代理
    self.slideSwitchView.segmentControlDelegate = self;
    ///被注释的代码可以调整整个segment 样式颜色值。
    //    //设置tab 颜色(可选)
    //    self.slideSwitchView.tabItemNormalColor = [UIColor blueColor];
    //    //设置tab 被选中的颜色(可选)
    //    self.slideSwitchView.tabItemSelectedColor = [UIColor redColor];
    //    //设置tab 背景颜色(可选)
    //    self.slideSwitchView.tabItemNormalBackgroundColor = [UIColor lightGrayColor];
    //    //设置tab 被选中的标识的颜色(可选)
    //    self.slideSwitchView.tabItemSelectionIndicatorColor = [UIColor orangeColor];
    [self.view addSubview:self.slideSwitchView];
}

-(NSUInteger)numberOfTab:(XYYSegmentControl *)view
{
    return [self.itemArray count];//items决定
}

///待加载的控制器
-(UIViewController *)slideSwitchView:(XYYSegmentControl *)view viewOfTab:(NSUInteger)number
{
    
    UIViewController *controller =[[UIViewController alloc] init];
    controller.title = self.itemArray[number];
    return controller;
    
}

- (void)slideSwitchView:(XYYSegmentControl *)view didselectTab:(NSUInteger)number
{
    UIViewController *vodVC = view.viewArray[number];
    vodVC.view.backgroundColor =EDTRandColor;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
