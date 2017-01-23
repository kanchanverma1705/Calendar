//
//  AppDelegate.h
//  EMS
//
//  Created by ankit on 1/13/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarSetting.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)CalendarSetting* currentcal;

@end

