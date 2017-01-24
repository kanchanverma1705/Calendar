//
//  CalenderCVCell.m
//  EMS
//
//  Created by ankit on 1/13/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import "CalenderCVCell.h"



@implementation CalenderCVCell{
    AppDelegate *app;
}
//NSInteger current;
NSInteger next_mon_fd;
@synthesize date_label;
@synthesize days;

//-(void)setbase{
//    days=[NSArray arrayWithObjects:@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa", nil];
//}
-(void)setbase:(NSInteger)num_days currentdt:(NSInteger)date{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    days=[format shortWeekdaySymbols];
    _maxdays=num_days;
   // current=date;
}

-(UIView *)setTxtforCell:(NSIndexPath *)index withText:(NSString *)dateValue andcolor:(UIColor *)DateColor{
     //  UIView *vw=[[UIView alloc]initWithFrame:self.contentView.frame];
    CGFloat cellw=self.contentView.frame.size.width;
    CGFloat cellh=self.contentView.frame.size.height;
    UIView *vw=[[UIView alloc] initWithFrame:CGRectMake(cellw*0.1, cellh*0.2, cellw*0.8, cellh*0.6)];
            if([vw subviews].count>0){
                for(UILabel *l in [vw subviews]){
                    [l removeFromSuperview];
                }
            }
            [vw addSubview:date_label];
        [date_label setTextColor:DateColor];
              [date_label setText:dateValue];
        
        return vw;

}







@end
