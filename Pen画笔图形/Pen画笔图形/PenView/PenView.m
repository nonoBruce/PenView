//
//  PenView.m
//  Pen画笔图形
//
//  Created by ELING on 15/8/5.
//  Copyright (c) 2015年 ELING. All rights reserved.
//

#import "PenView.h"
#import "BezierView.h"
#define ITEMWIDTH   26
#define ITEMHIGHT   56
@interface PenView()

@property(nonatomic, strong) NSMutableArray *butonArray;
@property(nonatomic, assign) NSInteger selectedIndex;

@end

@implementation PenView

- (instancetype)init {
    if(self = [super init]) {
//        self.backgroundColor = [UIColor redColor];
        self.selectedIndex = 2;
    }
    return self;
}

- (void)itenWithArray:(NSArray *)array selectedBlock:(SelectedBlock)block{
    
    self.butonArray = [[NSMutableArray alloc] initWithCapacity:5];
    self.selectedBlock = block;
    self.selectedIndex = (array.count-1)/2;
    
    NSInteger space = (self.frame.size.width - array.count*ITEMWIDTH)/(array.count-1);
    NSInteger x = ITEMWIDTH/2;
    NSInteger y = ITEMHIGHT/2 + self.frame.size.height-ITEMHIGHT;
    for (int i=0; i<array.count; i++) {
        BezierView *bezier = [[BezierView alloc] init];
        bezier.frame = CGRectMake(0, 0, 26, 56);
        [bezier setImage:[UIImage imageNamed:@"penTop"] forState:UIControlStateNormal];
        [bezier setBackgroundImage:[UIImage imageNamed:@"penBottom"] forState:UIControlStateNormal];
        bezier.adjustsImageWhenHighlighted = NO;//取消点击效果
        [bezier addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        bezier.tag = i;
        [self addSubview:bezier];
        
        x = ITEMWIDTH/2 +  (ITEMWIDTH +space)*i;
        bezier.center =  CGPointMake(x, y);
        [self.butonArray addObject:bezier];
    }
    UIButton *btn = [self.butonArray objectAtIndex:self.selectedIndex];
    CGRect oldRect = btn.frame;
    oldRect.origin.y -= 20;
    btn.frame = oldRect;
}

- (void)setColor:(UIColor *)color andIndex:(NSInteger )index {
    
}

- (void)btnAction:(BezierView *)btn {
    self.selectedBlock(btn.tag);
    if(self.selectedIndex == btn.tag){
        return;
    }
    UIButton *button = [self.butonArray objectAtIndex:self.selectedIndex];
    [UIView animateKeyframesWithDuration:0.1 delay:0 options:
     UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
         //
         CGRect oldRect = button.frame;
         oldRect.origin.y += 20;
         button.frame = oldRect;
         //
         CGRect rect = btn.frame;
         rect.origin.y -= 20;
         btn.frame = rect;
         
         self.selectedIndex = btn.tag;
    } completion:^(BOOL finished) {
        //
    }];
}
@end
