//
//  SceneDelegate.h
//  GiftCard
//
//  Created by KOK on 17/12/2020.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic)  UIWindowScene *windowScene;

+(instancetype)sharedInstance;

@end

