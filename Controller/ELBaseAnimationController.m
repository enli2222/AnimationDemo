//
//  ELBaseAnimationController.m
//  AnimationDemo
//
//  Created by enli on 2018/9/4.
//  Copyright © 2018年 enli. All rights reserved.
//

#import "ELBaseAnimationController.h"

@interface ELBaseAnimationController ()

@end

@implementation ELBaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self createBasicAnimation];
}

-(void)createBasicAnimation {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 70, 70)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor blueColor];
    CABasicAnimation *ani = [[CABasicAnimation alloc]init];
    ani.keyPath = @"transform.rotation.x";
    ani.beginTime = 0.0;
    ani.fromValue =[NSNumber numberWithFloat: 0.0 ];
    ani.toValue = [NSNumber numberWithFloat: M_PI_2 ];
    ani.duration = 1.5;
    ani.repeatCount = 100;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [v.layer addAnimation:ani forKey:@"rotation.x"];
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
