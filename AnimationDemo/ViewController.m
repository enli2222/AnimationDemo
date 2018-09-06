//
//  ViewController.m
//  AnimationDemo
//
//  Created by enli on 2018/9/4.
//  Copyright © 2018年 enli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UITableView *tblist;
    NSArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    data = @[
  @{@"className":@"ELUIViewController",@"title":@"UIView普通动画"},
  @{@"className":@"ELUIViewBlockController",@"title":@"UIView Block 动画"},
  @{@"className":@"ELBaseAnimationController",@"title":@"CABasicAnimation基础动画"},
  @{@"className":@"ELKeyframeController",@"title":@"CAKeyframeAnimation基础动画"},
  @{@"className":@"ELTransform3dController",@"title":@"3D翻转动画"}
  
  ];
    
    tblist = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tblist.delegate =self;
    tblist.dataSource = self;
    tblist.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:tblist];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    NSDictionary *dic = [data objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = [data objectAtIndex:indexPath.row];
    NSString *cls = [dic objectForKey:@"className"];
    UIViewController *vc = [[NSClassFromString(cls) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
