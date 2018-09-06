//
//  ELKeyframeController.m
//  AnimationDemo
//
//  Created by enli on 2018/9/4.
//  Copyright © 2018年 enli. All rights reserved.
//

#import "ELKeyframeController.h"

@interface ELKeyframeController ()

@end

@implementation ELKeyframeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *tmpView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithOvalInRect:tmpView.frame];
    UIView *aniView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 70, 80)];
    aniView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aniView];
    
    CAKeyframeAnimation *ani = [[CAKeyframeAnimation alloc]init];
    ani.keyPath = @"position";
    ani.duration = 5;
    ani.path = bezierPath.CGPath;
    ani.calculationMode = kCAAnimationPaced;
    ani.fillMode = kCAFillModeForwards;
    ani.repeatCount = NSIntegerMax;
    ani.rotationMode = kCAAnimationRotateAutoReverse;
    [aniView.layer addAnimation:ani forKey:@"orbitAnim"];
    
    /**------------------------画轨迹-------------------------------------*/
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
