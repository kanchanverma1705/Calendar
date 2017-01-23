//
//  ViewController.h
//  EMS
//
//  Created by ankit on 1/13/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalenderCVCell.h"
#import "CalendarSetting.h"
#import "AppDelegate.h"
@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic)NSDate *date;
@property (strong, nonatomic) IBOutlet UICollectionView *CalendarView;
@property(strong,nonatomic)NSArray *months;
//@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sidePnl_left;

- (IBAction)nextMonth:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextMonthOut;
//@property(strong,nonatomic)CalendarSetting* currentcal;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *prevMonth;
- (IBAction)prevMonthact:(id)sender;

@end

