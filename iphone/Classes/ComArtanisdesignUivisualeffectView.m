/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2014 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ComArtanisdesignUivisualeffectView.h"
#import "TiUtils.h"
#import "TiUIView.h"
#import "TiBase.h"
#import "TiViewProxy.h"

@implementation ComArtanisdesignUivisualeffectView


-(void)dealloc
{
    RELEASE_TO_NIL(blurView);
    RELEASE_TO_NIL(vibrancyView);
    RELEASE_TO_NIL(_contentView);
    
    [super dealloc];
}

-(void)initializeState
{
    
    NSString * effect = [self.proxy valueForKey:@"effect"];
   
    NSLog(@"INITIALIZING VIEW, %@",effect );
    
    UIBlurEffectStyle *style;

    if([effect isEqualToString: @"dark"]){
        style = UIBlurEffectStyleDark;
    }else if([effect isEqualToString: @"extralight"]){
        style = UIBlurEffectStyleExtraLight;
    } else {
        style = UIBlurEffectStyleLight;
    }

    [self blurView:style];

    [super initializeState];
}

-(UIView*)blurView:(UIBlurEffectStyle)style
{
    if (blurView == nil)
    {
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:style];
        
        blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
        blurView.frame = self.frame;
        
    
        if([TiUtils boolValue:[self.proxy valueForKey:@"vibrancyEffect"] def:NO]){
            NSLog(@" vibrant true");
            //add vibrancy effect view
            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:effect];
            vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
            vibrancyView.frame = self.frame;

            [[blurView contentView] addSubview:vibrancyView];
         }
        
        _contentView = [[UIView alloc] initWithFrame:self.frame];
        
        if(vibrancyView == nil){
            [[blurView contentView] addSubview:_contentView];
        }else {
            [[vibrancyView contentView] addSubview:_contentView];                       
        }
        
        [self addSubview:blurView];
        
        
    }
    
    return blurView;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    NSLog(@"[VIEW LIFECYCLE EVENT] frameSizeChanged");
    
    if (blurView != nil)
    {
        [TiUtils setView:blurView positionRect:bounds];
        
    }
}

/*
-(void)setContentView_:(id)viewProxy
{
    NSLog(@"setContentView");
    
    ENSURE_SINGLE_ARG(viewProxy, TiViewProxy);
    
    _contentView = viewProxy;
    TiUIView *view =[_contentView view];
    
    if(vibrancyView == nil){
        [[blurView contentView] addSubview:view];
    }else {
        [[vibrancyView contentView] addSubview:view];
    }
   
 
}
*/



@end
