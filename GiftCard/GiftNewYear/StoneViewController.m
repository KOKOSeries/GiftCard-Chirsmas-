//
//  StoneViewController.m
//  GiftCard
//
//  Created by KOK on 22/12/2020.
//

#import "StoneViewController.h"

@interface StoneViewController ()
@property (weak, nonatomic) IBOutlet UIView *descView;

@end

@implementation StoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)backHander:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)closeDescHander:(UIButton *)sender {
   self.descView.hidden = YES;
}
- (IBAction)displayDeschander:(UIButton *)sender {
   self.descView.hidden = NO;
}
- (IBAction)usersDream:(UIButton *)sender {
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Waiting for user feedback" message:@"Waiting for user feedback, the mailbox will receive the feedback, it will be sorted out and placed in the App, please wait" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:action];
    [self presentViewController:vc animated:YES completion:^{
            
    }];
}


@end
