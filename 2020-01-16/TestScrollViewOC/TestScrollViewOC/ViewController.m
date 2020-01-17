//
//  ViewController.m
//  TestScrollViewOC
//
//  Created by 吉腾蛟 on 2020/1/16.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIScrollView *scroll_view;
@property(nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scroll_view=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroll_view.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    self.scroll_view.scrollEnabled=YES;
    self.scroll_view.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:self.scroll_view];
    
    self.label=[[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    self.label.backgroundColor=[UIColor redColor];
    
    [self.scroll_view addSubview:self.label];
}


@end
