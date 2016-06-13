//
//  ColorDescription.m
//  Colorboard
//
//  Created by Ernald on 6/7/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "ColorDescription.h"

@implementation ColorDescription

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
        _name = @"Blue";
    }
    
    return self;
}

@end
