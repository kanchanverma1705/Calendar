//
//  CalendarSetting.h
//  EMS
//
//  Created by ankit on 1/16/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol calendarDel <NSObject>
//
//-(void)getValues;
//
//@end


@interface CalendarSetting : NSObject
@property(nonatomic)id delegate;
@property(strong,nonatomic)NSDate *currentDate;
@property(strong,nonatomic)NSArray<NSString *> *weekdays;
@property(nonatomic)NSInteger maxdays;
@property(nonatomic)NSInteger currentdt;
@property(nonatomic,strong)NSCalendar *cal;
@property(nonatomic,strong)NSDateFormatter *format;
-(NSString*)setTitle;
//+(NSString*)setNext;
//+(NSString*)setPrev;
-(void)set_member_var:(NSDate*)fordate ;
+(instancetype)sharedInstance;
//-(void)NextMonthSettings:(NSString*)withmode;

@property(nonatomic)NSInteger prevMax;
@property(nonatomic)NSInteger presentMFD;
@end
