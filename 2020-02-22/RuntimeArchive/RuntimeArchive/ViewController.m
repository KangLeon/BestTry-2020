//
//  ViewController.m
//  RuntimeArchive
//
//  Created by 吉腾蛟 on 2020/2/22.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1.归档
    PersonModel *model=[[PersonModel alloc] init];
    model.name=@"JY";
    model.age=@(25);
    
    NSString *file=[[NSBundle mainBundle] pathForResource:@"person" ofType:@""];
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:model requiringSecureCoding:YES error:nil];
    [data writeToFile:file atomically:YES];
    //解档
    NSData *data2=[NSData dataWithContentsOfFile:file];
    NSError *error=nil;
    PersonModel *model2=[NSKeyedUnarchiver unarchivedObjectOfClass:[PersonModel class] fromData:data2 error:&error];
    NSLog(@"name=%@,age=%@",model2.name,model2.age);
    
}


@end
