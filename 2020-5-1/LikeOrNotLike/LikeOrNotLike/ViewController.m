//
//  ViewController.m
//  LikeOrNotLike
//
//  Created by JY on 2020/5/1.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self presentViewController:[moreViewController new] animated:YES completion:nil];
}


@end

