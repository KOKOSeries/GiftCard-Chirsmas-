//
//  GCGuide.h
//  GiftCard
//
//  Created by KOK on 22/12/2020.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCGuide : NSObject
+ (GCGuide *)share;
-(void)scene:(UIWindowScene *)scene;
@end

NS_ASSUME_NONNULL_END
