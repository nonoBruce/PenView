//
//  BezierView.m
//  Pen画笔图形
//
//

#import "BezierView.h"

@interface BezierView() {
    UIColor *_color;
}


@end

@implementation BezierView

- (instancetype)init{
    if(self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
    
    [_color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(8.5, 0.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(0.8, 32.0)];
    [aPath addLineToPoint:CGPointMake(0.8, 56)];
    [aPath addLineToPoint:CGPointMake(19.0, 56)];
    [aPath addLineToPoint:CGPointMake(19.0, 32)];
    [aPath addLineToPoint:CGPointMake(10.5, 0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
//    [aPath stroke];//Draws line 根据坐标点连线
    [aPath fill];
}

- (void)setColor:(UIColor *)color {
    self.backgroundColor = [UIColor clearColor];
    _color = color;
    [self setNeedsDisplay];
    
}

//drow the button
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, 26 , 56);
}

@end
