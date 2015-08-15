//
//  PenView.h
//  Pen画笔图形
//
//  Created by ELING on 15/8/5.
//  Copyright (c) 2015年 ELING. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectedBlock)(NSInteger i);
//typedef void (^GBShareFinishBlock)(GBShareType type, BOOL isSuccess);

@interface PenView : UIView

@property(copy, nonatomic) SelectedBlock selectedBlock;

- (void)itenWithArray:(NSArray *)array selectedBlock:(SelectedBlock)block;

- (void)setColor:(UIColor *)color andIndex:(NSInteger )index;
@end
