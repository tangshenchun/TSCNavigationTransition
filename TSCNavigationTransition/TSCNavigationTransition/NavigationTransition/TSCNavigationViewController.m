//
//  TSCNavigationViewController.m
//  UIDemo
//
//  Created by tangshenchun on 2017/8/2.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "TSCNavigationViewController.h"
#import "ViewController.h"
#import "NextViewController.h"
#import "NavigationTransition.h"

@interface TSCNavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation TSCNavigationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.delegate = self;
}



-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return nil;
}


#pragma mark - UINavigationControllerDelegate
//区分push或pop操作
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{

    switch (operation) {
        case UINavigationControllerOperationPush:
            
            return [NavigationTransition transitionWithType:NavigationTransitionTypePush];
            break;
        case UINavigationControllerOperationPop:
            
            return [NavigationTransition transitionWithType:NavigationTransitionTypePop];
            break;
        default:
            return nil;
    }
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
