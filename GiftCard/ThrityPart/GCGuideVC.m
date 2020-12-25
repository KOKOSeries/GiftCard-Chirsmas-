//
//  GCGuideVC.m
//  GiftCard
//
//  Created by KOK on 22/12/2020.
//

#import "GCGuideVC.h"
#import "SDCycleScrollView.h"
#import <Masonry/Masonry.h>

@interface GCGuideVC ()
@property (strong,nonatomic) UIButton *skipButton;
@property (assign,nonatomic) BOOL isCanSkip;
@end

@implementation GCGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self add];
}
- (void)add{
    self.skipButton = [[UIButton alloc]init];
    [self.skipButton setTitle:@"skip" forState:UIControlStateNormal];
    
    NSArray *imageNames = @[@"wishingStone_banner.png",
                            @"dreambigclock.png",
                            @"Forgetworryfruit.png",
                            ];
 
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,80,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-160) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
//    cycleScrollView.titlesGroup = titles;
    [self.view addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    __weak __typeof(self)weakSelf = self;
    cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if (strongSelf.isCanSkip) {
            
        }else{
            return;
        }
        
        if ([strongSelf.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
            [strongSelf.mkDelegate didClickCancel];
        }
    };
    cycleScrollView.itemDidScrollOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"%@",@(currentIndex));
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if (currentIndex == 2) {
            strongSelf.isCanSkip = YES;
        }
    };
    [self.view addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(10));
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@(80));
        make.height.equalTo(@(30));
    }];
    self.skipButton.layer.cornerRadius = 15;
    self.skipButton.layer.masksToBounds = YES;
    self.skipButton.layer.borderColor = [UIColor colorNamed:@"tintColor"].CGColor;
    self.skipButton.layer.borderWidth = 0.5;
    self.isCanSkip = NO;
    [self.skipButton addTarget:self action:@selector(skipHander) forControlEvents:UIControlEventTouchUpInside];
}
- (void)skipHander{
    if ([self.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
        [self.mkDelegate didClickCancel];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.isCanSkip) {
        
    }else{
        return;
    }
    
    if ([self.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
        [self.mkDelegate didClickCancel];
    }
}

@end
