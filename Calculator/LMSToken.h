//
//  LMSToken.h
//  Calculator
//
//  Created by Lauren Shapiro on 2/9/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMSToken : NSObject
    @property NSInteger precedence;
    @property NSString* value;
   -(id)initWithValue: (NSString*) value precedence: (NSInteger) p;
@end
