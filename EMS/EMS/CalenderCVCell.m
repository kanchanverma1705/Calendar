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
NSInteger current;
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
    current=date;
}


-(UIView*)setTxtforCell:(NSIndexPath *)index withinst:(CalendarSetting *)instan{
   //current=[CalendarSetting cu]
   
    UIView *vw=[[UIView alloc]initWithFrame:self.contentView.frame];
    if([vw subviews].count>0){
        for(UILabel *l in [vw subviews]){
            [l removeFromSuperview];
        }
    }
    [vw addSubview:date_label];
    current=instan.currentdt;
    NSString *text1;
    int que=index.row/7;
    if(que==0 ){
        
        text1=[instan.weekdays objectAtIndex:(index.row)];
        [date_label setTextColor:[UIColor redColor]];
        [date_label setText:text1];
    }
    if(index.row<=(instan.presentMFD+6) && que>0 ){
        text1=[[NSString alloc]initWithFormat:@"%ld",(instan.prevMax-instan.presentMFD+1)+(index.row%7)];
         [date_label setText:text1];
        [date_label setTextColor:[UIColor grayColor]];
    }
    if(index.row>(instan.presentMFD+6) && index.row<(instan.maxdays+7+instan.presentMFD) && que>0){ //set start index by index.row>[starting index] and end by (index.row<[_maxdays+7+(start index)])
        //NSLog()
        
        text1=[[NSString alloc]initWithFormat:@"%ld",(unsigned)index.row-6-instan.presentMFD];
          [date_label setText:text1];
        if((current+instan.presentMFD)==index.row-6){
            [date_label setTextColor:[UIColor orangeColor]];
        }else{
            [date_label setTextColor:[UIColor blueColor]];
        }
        NSLog(@"index path %@",text1);
      
    }

    if(index.row>(instan.maxdays+instan.presentMFD+6) && que>0){
        text1=[[NSString alloc]initWithFormat:@"%ld",((index.row-instan.maxdays-instan.presentMFD)-6)];
        [date_label setText:text1];
        [date_label setTextColor:[UIColor grayColor]];
      //  [da]
    }
    date_label.textAlignment=NSTextAlignmentCenter;
    return vw;
}




@end
