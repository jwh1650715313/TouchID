//
//  TouchIDTool.h
//  TouchIDdemo
//
//  Created by 白石洲霍华德 on 2017/8/7.
//  Copyright © 2017年 景文浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface TouchIDTool : NSObject


typedef void(^TouchIdIDFailureBack)(LAError result);

+(instancetype)shareInstance;


/**
 *  TouchId 验证
 *
 *  @param localizedReason TouchId信息
 *  @param title           验证错误按钮title
 *  @param backSucces      成功返回Block
 *  @param backFailure     失败返回Block
 */


- (void)evaluatePolicy:(NSString *)localizedReason
         fallbackTitle:(NSString *)title
          SuccesResult:(void(^)())backSucces
         FailureResult:(TouchIdIDFailureBack)backFailure;


@end
