//
//  ViewController.m
//  UIDemo
//
//  Created by tangshenchun on 2017/7/26.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *animatingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    animatingView.frame = CGRectMake(0, 0, 200, 100);
    animatingView.backgroundColor = [UIColor redColor];
    animatingView.contentMode = UIViewContentModeScaleAspectFill;
    animatingView.center = self.view.center;
    [self.view addSubview:animatingView];
    
    self.animatingView = animatingView;
    
    animatingView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageViewTap:)];
    [animatingView addGestureRecognizer:tap];
}


- (void)onImageViewTap:(UITapGestureRecognizer *)tap {
    
    NextViewController * next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
