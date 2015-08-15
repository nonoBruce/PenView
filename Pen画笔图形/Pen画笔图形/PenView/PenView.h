//
//  PenView.h
//  Pen画笔图形
//

//

#import <UIKit/UIKit.h>

typedef void (^SelectedBlock)(NSInteger i);
//typedef void (^GBShareFinishBlock)(GBShareType type, BOOL isSuccess);

@interface PenView : UIView

@property(copy, nonatomic) SelectedBlock selectedBlock;

- (void)itenWithArray:(NSArray *)array selectedBlock:(SelectedBlock)block;

- (void)setColor:(UIColor *)color andIndex:(NSInteger )index;
@end
