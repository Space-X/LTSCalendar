//
//  LTSCalendarManager.m
//  LTSCalendar
//
//  Created by 李棠松 on 2018/1/13.
//  Copyright © 2018年 leetangsong. All rights reserved.
//

#import "LTSCalendarManager.h"

@implementation LTSCalendarManager
- (void)setCalenderScrollView:(LTSCalendarScrollView *)calenderScrollView{
    _calenderScrollView = calenderScrollView;
    calenderScrollView.calendarView.eventSource = self.eventSource;

}
- (void)setEventSource:(id<LTSCalendarEventSource>)eventSource{
    _eventSource = eventSource;
    self.calenderScrollView.calendarView.eventSource = self.eventSource;
   
}

- (void)goToDate:(NSDate *)date{
    [LTSCalendarAppearance share].defaultDate = date;
    [self.calenderScrollView.calendarView reloadDefaultDate];
    [self.calenderScrollView.calendarView reloadAppearance];
//    if ([LTSCalendarAppearance share].isShowSingleWeek) {
//        [self.calenderScrollView scrollToSingleWeek];
//    }
    
}
/// 重新加载外观和数据
- (void)reloadAppearanceAndData{
    [self.weekDayView reloadAppearance];
    [self.calenderScrollView.calendarView reloadAppearance];
}

- (void)showSingleWeek{
    [self.calenderScrollView scrollToSingleWeek];
}
- (void)showAllWeek{
    [self.calenderScrollView scrollToAllWeek];
}

///  前一页。上个月
- (void)loadPreviousPage{
    [self.calenderScrollView.calendarView loadPreviousPage];
}
///   下一页 下一个月

- (void)loadNextPage{
    [self.calenderScrollView.calendarView loadNextPage];
}
- (NSDate *)currentSelectedDate{
    return self.calenderScrollView.calendarView.currentDate;
}

@end
