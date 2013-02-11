//
//  LMSToken.m
//  Calculator
//
//  Created by Lauren Shapiro on 2/9/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSToken.h"

@implementation LMSToken
-(id)initWithValue: (NSString*) val
        precedence: (NSInteger) p
    {
        self = [super init];
        if (self) {
            self.precedence = p;
            self.value = val;
        }
        return self;
    }
@end
