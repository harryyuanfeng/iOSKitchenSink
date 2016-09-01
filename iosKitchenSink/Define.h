//
//  Define.h
//  校友圈
//
//  Created by Vk on 16/3/12.
//  Copyright © 2016年 harryfeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef Define_h
#define Define_h



#define SCREEN_WIDTH        ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT       ([UIScreen mainScreen].bounds.size.height)
#define kHomeLeftTopViewHeight 35 //首页左上角选择城市视图高度
#define kHomeLeftTopViewMaxWidth SCREEN_WIDTH*0.3 //首页左上角选择城市视图最大宽度

#define RGB(r,g,b)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define COLORFROMRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define SCALE_WIDTH SCREEN_WIDTH / 375
#define SCALE_HEIGHT SCREEN_HEIGHT / 667

#define RectMake(x,y,w,h) CGRectMake(x*SCALE_WIDTH, y*SCALE_HEIGHT, w*SCALE_WIDTH, h*SCALE_HEIGHT)

#define RectMakeXCenter(y,w,h) CGRectMake((SCREEN_WIDTH - w*SCALE_WIDTH)/2, y*SCALE_HEIGHT, w*SCALE_WIDTH, h*SCALE_HEIGHT)
#define textColer  RGB(153,154,155)
#define BtnClickColer  RGB(53,171,193)
#define bgViewColer  RGB(237,238,239)
#define navConterColer  RGB(46,164,179)
#endif /* Define_h */
// 320*568
// 375*667
// 414*736