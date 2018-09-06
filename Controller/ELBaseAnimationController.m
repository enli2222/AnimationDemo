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
    self.view.backgroundColor = [UIColor whiteColor];
    /**------------------------旋转动画-------------------------------------*/
    [self createBasicAnimation:@"transform.rotation.x" from:[NSNumber numberWithFloat:0.0] to:[NSNumber numberWithFloat:2*M_PI] target:[self createView:CGRectMake(20, 100, 70, 70)]];
    [self createBasicAnimation:@"transform.rotation.y" from:[NSNumber numberWithFloat:0.0] to:[NSNumber numberWithFloat:2*M_PI] target:[self createView:CGRectMake(150, 100, 70, 70)]];
    [self createBasicAnimation:@"transform.rotation.z" from:[NSNumber numberWithFloat:0.0] to:[NSNumber numberWithFloat:2*M_PI] target:[self createView:CGRectMake(280, 100, 70, 70)]];
    
    /**------------------------移动动画-------------------------------------*/
    [self createBasicAnimation:@"position" from:[NSValue valueWithCGPoint:CGPointMake(40, 240)] to:[NSValue valueWithCGPoint:CGPointMake(300, 240)]  target:[self createView:CGRectMake(280, 100, 70, 70)]];
    
    /**------------------------背景颜色变化动画-------------------------------------*/
    [self createBasicAnimation:@"backgroundColor" from:(id)[UIColor redColor].CGColor to:(id)[UIColor greenColor].CGColor  target:[self createView:CGRectMake(20, 310, 70, 70)]];

    /**------------------------内容变化动画-------------------------------------*/
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"from"]];
    img.frame = CGRectMake(150, 310, 70, 70);
    [self.view addSubview:img];
    [self createBasicAnimation:@"contents" from:nil to:(id)[UIImage imageNamed:@"to"].CGImage target:img];
    
    /**------------------------圆角变化动画-------------------------------------*/
    UIView *radiuView = [self createView:CGRectMake(280, 310, 70, 60)];
    radiuView.layer.masksToBounds = YES;
    [self createBasicAnimation:@"cornerRadius" from:nil to:[NSNumber numberWithInteger:35] target:radiuView];
    
    /**------------------------比例缩放动画-------------------------------------*/
    [self createBasicAnimation:@"transform.scale" from:[NSNumber numberWithFloat:0.3] to:[NSNumber numberWithFloat:1.3]   target:[self createView:CGRectMake(20, 410, 70, 70)]];

    [self createBasicAnimation:@"transform.scale.x" from:[NSNumber numberWithFloat:0.3] to:[NSNumber numberWithFloat:1.3]   target:[self createView:CGRectMake(150, 410, 70, 70)]];
    
    [self createBasicAnimation:@"transform.scale.y" from:[NSNumber numberWithFloat:0.3] to:[NSNumber numberWithFloat:1.3]   target:[self createView:CGRectMake(280, 410, 70, 70)]];
    
    /**------------------------指定大小缩放-------------------------------------*/
     [self createBasicAnimation:@"bounds" from:nil to:[NSValue valueWithCGRect:CGRectMake(800, 500, 90, 30)]   target:[self createView:CGRectMake(40, 520, 20, 80)]];
    
    /**------------------------透明动画-------------------------------------*/
    [self createBasicAnimation:@"opacity" from:[NSNumber numberWithFloat:0.3] to:[NSNumber numberWithFloat:1.3]   target:[self createView:CGRectMake(150, 520, 70, 70)]];
    
}

-(CABasicAnimation *)createBasicAnimation:(NSString *)keyPath from:(id)from to:(id)to target:(UIView *)target{
    CABasicAnimation *ani = [[CABasicAnimation alloc]init];
    ani.keyPath = keyPath;
    ani.beginTime = 0.0;
    if (from) {
        ani.fromValue = from;
    }
    if (to) {
        ani.toValue = to;
    }
    
    ani.duration = 1.5;
    ani.repeatCount = NSIntegerMax;
    ani.delegate = self;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ani.autoreverses = YES;
    [target.layer addAnimation:ani forKey:keyPath];
    return ani;
}

-(UIView *)createView:(CGRect)frame{
    UIView * v= [[UIView alloc]initWithFrame:frame];
//    v.center = CGPointMake(40, 200);
    v.backgroundColor = [UIColor redColor];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    lb.text = @"上下";
    lb.textColor = [UIColor whiteColor];
    [v addSubview:lb];
    [self.view addSubview:v];
    return v;
}

//-(void)createBasicAnimation {
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 70)];
//    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
//    lb.text = @"阿斯顿发送到发送的";
//    [v addSubview:lb];
////    anchorPoint称为“定位点”、“锚点”
////    决定着CALayer身上的哪个点会在position属性所指的位置
////    以自己的左上角为原点(0, 0)
////    它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
//    v.layer.anchorPoint = CGPointMake(0.5, 0);
//    v.layer.transform = [self transform3d];
//    v.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:v];
//    v.backgroundColor = [UIColor blueColor];
//    CABasicAnimation *ani = [[CABasicAnimation alloc]init];
//    ani.keyPath = @"transform.rotation.x";
//    ani.beginTime = 0.0;
//    ani.fromValue =[NSNumber numberWithFloat: M_PI  ];
//    ani.toValue = [NSNumber numberWithFloat: 0.0];
//    ani.duration = 1.5;
//    ani.repeatCount = 100;
//    ani.delegate = self;
//    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [v.layer addAnimation:ani forKey:@"rotation.x"];
//}

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
