//
//  GCGuideVC.h
//  GiftCard
//
//  Created by KOK on 22/12/2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GCGuideVCDelegate <NSObject>

- (void)didClickCancel;

@end

@interface GCGuideVC : UIViewController
@property (weak,nonatomic) id<GCGuideVCDelegate> mkDelegate;

@end

NS_ASSUME_NONNULL_END
