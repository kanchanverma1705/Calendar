//
//  CalenderCVCell.h
//  EMS
//
//  Created by ankit on 1/13/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarSetting.h"
#import "AppDelegate.h"
@interface CalenderCVCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *date_label;
-(UIView*)setTxtforCell:(NSIndexPath*)index withinst:(CalendarSetting*)instan;
@property(strong,nonatomic) NSArray<NSString*> *days;
-(void)setbase:(NSInteger)num_days currentdt:(NSInteger)date;
//@property(strong,nonatomic) NSArray *days;
@property(nonatomic)NSInteger maxdays;

@end
