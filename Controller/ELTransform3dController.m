//
//  ELTransform3dController.m
//  AnimationDemo
//
//  Created by enli on 2018/9/5.
//  Copyright © 2018年 enli. All rights reserved.
//

#import "ELTransform3dController.h"

@interface ELTransform3dController ()

@end

@implementation ELTransform3dController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createBasicAnimation];
}

-(void)createBasicAnimation {
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 70)];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    lb.text = @"上上上上人人人人";
    [v addSubview:lb];
    //    anchorPoint称为“定位点”、“锚点”
    //    决定着CALayer身上的哪个点会在position属性所指的位置
    //    以自己的左上角为原点(0, 0)
    //    它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
    v.layer.anchorPoint = CGPointMake(0.5, 0);
    v.layer.transform = [self transform3d];
    v.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:v];
    v.backgroundColor = [UIColor blueColor];
    CABasicAnimation *ani = [[CABasicAnimation alloc]init];
    ani.keyPath = @"transform.rotation.x";
    ani.beginTime = 0.0;
    ani.fromValue =[NSNumber numberWithFloat: M_PI  ];
    ani.toValue = [NSNumber numberWithFloat: 0.0];
    ani.duration = 1.5;
    ani.repeatCount = 100;
    ani.delegate = self;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [v.layer addAnimation:ani forKey:@"rotation.x"];
}

- (void)animationDidStart:(CAAnimation *)anim{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}

- (CATransform3D)transform3d{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 2.5 / -2000;
    return transform;
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
