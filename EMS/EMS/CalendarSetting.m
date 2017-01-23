//
//  CalendarSetting.m
//  EMS
//
//  Created by ankit on 1/16/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import "CalendarSetting.h"

@implementation CalendarSetting
@synthesize format;

+ (instancetype)sharedInstance {
    static CalendarSetting *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if(sharedInstance==nil){
        sharedInstance = [[CalendarSetting alloc] init];
            
        }
        //_cal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    });
    return sharedInstance;
}




-(void)set_member_var:(NSDate *)fordate {
    format=[[NSDateFormatter alloc]init];
    _currentDate=fordate;
    _weekdays=[NSArray arrayWithObjects:@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat",@"Sun", nil];
    _cal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      _prevMax=_maxdays;
    if(!_prevMax){
         NSDate *someDate = [_cal dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:_currentDate options:0];
        _prevMax=[_cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:someDate].length;
    }
  
    _maxdays=[_cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:fordate].length;
    _currentdt=[_cal component:NSCalendarUnitDay fromDate:fordate];
    format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"E"];
    NSDate *someDate = [_cal dateByAddingUnit:NSCalendarUnitDay value:-(_currentdt-1) toDate:_currentDate options:0];
    NSLog(@"for current month %@", [format stringFromDate:someDate]);
    _presentMFD=[_weekdays indexOfObject:[format stringFromDate:someDate]];
    NSLog(@" index number for current month %lu",_presentMFD);
}
-(NSString *)setTitle{
    
   format = [[NSDateFormatter alloc] init];
    [format setTimeZone:[NSTimeZone localTimeZone]];
    [format setDateFormat:@"MMM YYYY"];
 NSLog(@"Title for view---%@",[format stringFromDate:_currentDate]);
return  [format stringFromDate:_currentDate];

}

//-(void)NextMonthSettings:(NSString *)withmode{
//    if([withmode isEqualToString:@"setup"]){
//          _cal = [NSCalendar currentCalendar];
//            NSDate *someDate = [_cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:_currentDate options:0];
//            format=[[NSDateFormatter alloc]init];
//            [format setDateFormat:@"EEE"];
//            NSLog(@" for next month %@", [format stringFromDate:someDate]);
//        _nextMFD=[_weekdays indexOfObject:[format stringFromDate:someDate]];
//        //someDate=[_cal ]
//    }
//}
@end
