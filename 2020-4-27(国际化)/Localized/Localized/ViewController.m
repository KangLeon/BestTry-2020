//
//  ViewController.m
//  Localized
//
//  Created by JY on 2020/4/26.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label=[[UILabel alloc] initWithFrame:CGRectMake(40, 200, 200, 50)];
    self.label.text=NSLocalizedString(@"next", nil);
    [self.view addSubview:self.label];
}


@end
