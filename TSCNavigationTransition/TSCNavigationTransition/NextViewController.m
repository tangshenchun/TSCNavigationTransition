//
//  NextViewController.m
//  UIDemo
//
//  Created by tangshenchun on 2017/8/2.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIImageView *animatingView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height)];
    animatingView.backgroundColor = [UIColor purpleColor];
    animatingView.image = [UIImage imageNamed:@"1.png"];
    animatingView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:animatingView];
    self.animatingView = animatingView;
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageViewTap:)];
    [self.view addGestureRecognizer:tap];

}

- (void)onImageViewTap:(UITapGestureRecognizer *)tap {
   
    [self.navigationController popViewControllerAnimated:true];
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
