//
//  ViewController.m
//  Pen画笔图形
//

#import "ViewController.h"
#import "BezierView.h"

#import "PenView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet BezierView *containView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.containView setColor:nil];
    PenView *pens = [[PenView alloc] init];
    pens.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width-0, 80);
    NSArray *arr = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];
    
    
    
    [pens itenWithArray: arr selectedBlock:^(NSInteger i) {
        
    }];
    [self.view addSubview:pens];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
