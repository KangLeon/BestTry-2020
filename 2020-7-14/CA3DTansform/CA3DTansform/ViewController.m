//
//  ViewController.m
//  CA3DTansform
//
//  Created by JY on 2020/6/13.
//  Copyright © 2020 JY. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
    
    CATransform3D perspective = CATransform3DIdentity;
       perspective.m34 = -1.0/500.0;
       perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
       perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
       self.view.layer.sublayerTransform = perspective;
       
       //加入第一个
       CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
       [self addFace:0 withTransform:transform];
       
       //加入第二个
       CATransform3D transform2 = CATransform3DMakeTranslation(100, 0, 0);
       transform2 = CATransform3DRotate(transform2, M_PI_2, 0, 1, 0);
       [self addFace:1 withTransform:transform2];
       
       //加入第三个
       CATransform3D transform3 = CATransform3DMakeTranslation(0, -100, 0);
       transform3 = CATransform3DRotate(transform3, M_PI_2, 1, 0, 0);
       [self addFace:2 withTransform:transform3];
       
       //加入第四个
       CATransform3D transform4 = CATransform3DMakeTranslation(0, 100, 0);
       transform4 = CATransform3DRotate(transform4, -M_PI_2, 1, 0, 0);
       [self addFace:3 withTransform:transform4];
       
       //加入第五个
       CATransform3D transform5 = CATransform3DMakeTranslation(-100, 0, 0);
       transform5 = CATransform3DRotate(transform5, -M_PI_2, 0, 1, 0);
       [self addFace:4 withTransform:transform5];
       
       //加入第六个
       CATransform3D transform6 = CATransform3DMakeTranslation(0, 0, -100);
       transform6 = CATransform3DRotate(transform6, -M_PI_2, 0, 0, 1);
       [self addFace:5 withTransform:transform6];
}
- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    face.backgroundColor=[UIColor whiteColor];
    face.layer.borderColor=[UIColor grayColor].CGColor;
    face.layer.borderWidth=1.0;
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    label.text=@"1";
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:35.0 weight:UIFontWeightBold];
    label.textAlignment=NSTextAlignmentCenter;
    [face addSubview:label];
    label.center=face.center;
    
    [self.view addSubview:face];
    
    //center the face view within the container
    CGSize containerSize = self.view.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
}


@end
