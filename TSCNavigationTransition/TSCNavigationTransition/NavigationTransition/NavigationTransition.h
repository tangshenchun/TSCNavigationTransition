//
//  NavigationPushTransition.h
//  UIDemo
//
//  Created by tangshenchun on 2017/8/2.
//  Copyright © 2017年 tangshenchun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  动画过渡代理管理的是push还是pop
 */
typedef NS_ENUM(NSUInteger ,NavigationTransitionType){
    NavigationTransitionTypePush = 0,
    NavigationTransitionTypePop
};


@interface NavigationTransition : NSObject<UIViewControllerAnimatedTransitioning>

/**
 *  动画过渡代理管理的是push还是pop
 */
@property(nonatomic,assign) NavigationTransitionType type;



/**
 *  初始化动画过渡代理
 */
+ (instancetype)transitionWithType:(NavigationTransitionType)type;
- (instancetype)initWithTransitionType:(NavigationTransitionType)type;

@end
