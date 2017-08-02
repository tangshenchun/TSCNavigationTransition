//
//  NavigationTransition.m
//  UIDemo
//
//  Created by tangshenchun on 2017/8/2.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import "NavigationTransition.h"
#import "ViewController.h"
#import "NextViewController.h"


@interface NavigationTransition ()


@end


@implementation NavigationTransition


+(instancetype)transitionWithType:(NavigationTransitionType)type {

    return [[self alloc] initWithTransitionType:type];
}


-(instancetype)initWithTransitionType:(NavigationTransitionType)type {

    self = [super init];
    if (self) {
        
        _type = type;
    }
    return self;
}


/**
 *  动画时长
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}


/**
 *  如何执行过渡动画
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case NavigationTransitionTypePush:
            [self doPushAnimation:transitionContext];
            break;
            
        case NavigationTransitionTypePop:
            [self doPopAnimation:transitionContext];
            break;
    }
}


/**
 *  执行push过渡动画
 */
- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    ViewController *fromVC = (ViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    NextViewController *toVC = (NextViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIImageView *fromView = fromVC.animatingView;
    UIImageView *toView = toVC.animatingView;
    
    //    [containerView addSubview:fromVC.view];
    fromView.hidden = YES;
    UIView *fromSnapView = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    [containerView addSubview:fromSnapView];
    
    UIImageView *animatingView = [[UIImageView alloc]initWithFrame:fromView.frame];
    animatingView.backgroundColor = [UIColor lightGrayColor];
    animatingView.image = fromView.image;
    [containerView addSubview:animatingView];
    animatingView.contentMode = UIViewContentModeScaleAspectFill;
    [containerView addSubview:toVC.view];
    
    //设置动画前的各个控件的状态
    toVC.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        animatingView.frame = toView.frame;
    }completion:^(BOOL finished) {
        [animatingView removeFromSuperview];
        toVC.view.alpha = 1;
        [fromSnapView removeFromSuperview];
        fromView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}


/**
 *  执行pop过渡动画
 */
- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    NextViewController *fromVC = (NextViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
 
    UIView *containerView = [transitionContext containerView];
    
    UIImageView *fromView = fromVC.animatingView;
    UIImageView *toView = toVC.animatingView;
    
    [containerView addSubview:fromVC.view];
    
    UIImageView *animatingView = [[UIImageView alloc]initWithFrame:fromView.frame];
    animatingView.backgroundColor = [UIColor redColor];
    animatingView.image = fromView.image;
    animatingView.contentMode = UIViewContentModeScaleAspectFill;
    [containerView addSubview:animatingView];
    
    [containerView addSubview:toVC.view];
    
    //设置动画前的各个控件的状态
    toVC.view.alpha = 0;
    fromView.hidden = YES;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        animatingView.frame = toView.frame;
    }completion:^(BOOL finished) {
        [animatingView removeFromSuperview];
        toVC.view.alpha = 1;
        [fromVC.view removeFromSuperview];
        fromView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}




@end
