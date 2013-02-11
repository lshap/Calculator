//
//  LMSViewController.m
//  Calculator
//
//  Created by Lauren Shapiro on 1/18/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSViewController.h"

@interface LMSViewController ()
+(NSString*) evaluate:(NSString*)input;
+(BOOL) is_Infix: (int) c;
+(int) precedence: (int) operator;
+(NSMutableArray*) applyOperator:(int) o args: (NSMutableArray*) a binary:(BOOL) b;
+ (NSMutableArray*) parse_input:(NSString*)input;
@property (weak, nonatomic) IBOutlet UILabel *display;
@property BOOL pressed_eq;
@end

@implementation LMSViewController

- (IBAction)button_7:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"7"];
    self.display.text = temp;    
}
- (IBAction)button_8:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"8"];
    self.display.text = temp;
}
- (IBAction)button_9:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"9"];
    self.display.text = temp;
}
- (IBAction)button_4:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"4"];
    self.display.text = temp;
}
- (IBAction)button_5:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"5"];
    self.display.text = temp;
}
- (IBAction)button_6:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"6"];
    self.display.text = temp;
}
- (IBAction)button_1:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"1"];
    self.display.text = temp;
}
- (IBAction)button_2:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"2"];
    self.display.text = temp;
}
- (IBAction)button_3:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"3"];
    self.display.text = temp;
}
- (IBAction)button_0:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"0"];
    self.display.text = temp;
}
- (IBAction)button_dec:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"."];
    self.display.text = temp;
}
- (IBAction)button_pi:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"pi"];
    self.display.text = temp;
}
- (IBAction)button_exp:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"^"];
    self.display.text = temp;
}
- (IBAction)button_sqrt:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"sqrt"];
    self.display.text = temp;
}
- (IBAction)button_log:(UIButton *)sender {
    if (self.pressed_eq)
    {
        self.display.text = @"";
        self.pressed_eq = NO;
    }
    
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"log"];
    self.display.text = temp;
}
- (IBAction)button_times:(UIButton *)sender {
    self.pressed_eq = false;
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"x"];
    self.display.text = temp;
}
- (IBAction)button_div:(UIButton *)sender {
    self.pressed_eq = false;
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"/"];
    self.display.text = temp;
}
- (IBAction)button_plus:(UIButton *)sender {
    self.pressed_eq = false;
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    [temp appendString: @"+"];
    self.display.text = temp;
}
- (IBAction)button_minus:(UIButton *)sender {
    self.pressed_eq = false;
    NSMutableString* temp = [[NSMutableString alloc] initWithString: self.display.text];
    NSString* teststr = [[NSString alloc]init];
    [temp appendString: @"-"];
    self.display.text = temp;
}

+(NSMutableArray*) applyOperator:(int) o args: (NSMutableArray*) a binary:(BOOL) b
  {
    NSMutableArray* newinput = a;
    float result;
      
    NSNumberFormatter* f = [[NSNumberFormatter alloc]init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    if (b)
    {
        // pop args off stack
        NSString* a1 = [a objectAtIndex:0];
        [newinput removeObjectAtIndex:0];
       
        NSString* a2 = [a objectAtIndex:0];
        [newinput removeObjectAtIndex:0];
        
        // format args into numbers
        NSNumber* n1 = [f numberFromString:a1];
        NSNumber* n2 = [f numberFromString:a2];
        
        if (o =='+') {
            result = [n1 floatValue] + [n2 floatValue];
        }
        else if (o =='-') {
            result = [n2 floatValue] - [n1 floatValue];
        }
        else if (o =='/') {
            result = [n2 floatValue] / [n1 floatValue];
        }
        else if (o =='x') {
           result = [n1 floatValue]*[n2 floatValue];
        }
        else if (o == '^') {
            result = powf([n2 floatValue],[n1 floatValue]);
        }
     }
      
    else
      {
          // pop args off stack
          NSString* a1 = [a objectAtIndex:0];
         [newinput removeObjectAtIndex:0];
          
          // format args into numbers
          NSNumber* n1 = [f numberFromString:a1];
          
         if (o == 'l') {
             result = log10f([n1 floatValue]);
        }
         else if (o == 's') {
              result = sqrtf([n1 floatValue]);
        }
      }
      
      [newinput insertObject: [NSString stringWithFormat:@"%.03f", result] atIndex:0];
      return newinput;
  }


+(BOOL) is_Infix:(int) c
{
    if (c=='+' || c=='-' || c=='/' || c=='x' || c=='^')
        return YES;
    else
        return NO;
 }

+(BOOL) is_SpecialOp:(int) c
{
    if (c=='s' || c=='l')
        return YES;
    else
        return NO;
}

+(int) precedence: (int) operator
 {
     if ( operator =='+' ||  operator =='-') return 0;
     else if ( operator =='/' ||  operator =='x') return 1;
     else if (operator == 's' || operator =='l' || operator =='^') return 2;
     else if (isdigit(operator) || operator == '.' || operator == 'p') return -1;
 } 

+ (NSMutableArray*) parse_input:(NSString*)input
{
    NSMutableArray* parsed_input = [[NSMutableArray alloc]init];;
    NSMutableString* newop = [[NSMutableString alloc] init];
    int start = 0;
    int end = 0;
    int s2 = 0;
    int e2 = 0;
    int curr;
    int lastchar = -1;
    
    // find operands
    while (start < [input length]) {
        while (end < [input length]){
            curr = [input characterAtIndex:end];
            if ((isdigit(curr)|| curr == '.')) {
                end++;
                lastchar = curr;
            }
            else if (curr == 'p') // found pi
            {
                end+=2;
                lastchar = curr;
            }
            else if (curr == '-' && ([LMSViewController is_Infix:lastchar]
                                     || [LMSViewController is_SpecialOp:lastchar] || lastchar == -1)) // handle negation
            {
                end++;
            }
            else if ([LMSViewController is_Infix:curr] ||
                     [LMSViewController is_SpecialOp:curr]){
                s2 = end;
                e2 = end + 1;
                lastchar = curr;
                break;
            }
            else break;
        }
        if (end > start)
        {
            NSRange op_range = NSMakeRange(start, (end-start));
            newop = [input substringWithRange: op_range];
            if ([newop isEqualToString: @"pi"])
                newop = @"3.14159265358979";

            [parsed_input addObject: newop];
        }
        if (e2 > s2)
        {
            NSRange op_range = NSMakeRange(s2, (e2-s2));
            newop = [input substringWithRange: op_range];
            
            // jump ahead in the input if we see sqrt or log
            if ([newop isEqualToString:@"s"])
                end+=3;
            else if ([newop isEqualToString:@"l"])
                end+=2;
            
            [parsed_input addObject: newop];
            e2= 0;
            s2 = 0;
        }
        
        end++;
        newop = @"";
        start = end;
    }
    
    return parsed_input;
}


+ (NSString*) evaluate:(NSString*)input
{
    // parse operands from input
    NSMutableArray* parsed_input = [LMSViewController parse_input:input];
    NSMutableArray* operator_stack = [[NSMutableArray alloc]init];
    NSMutableArray* operand_stack = [[NSMutableArray alloc]init];
    for (int i = 0; i < [parsed_input count]; i++)
    { 
        NSString* currstring = [parsed_input objectAtIndex:i];
        int currchar = [currstring characterAtIndex:0];
        
        // push numbers onto operand stack
        if ([LMSViewController precedence: currchar] < 0 ||(currchar == '-' && [currstring length] > 1))
        {
            [operand_stack insertObject:currstring atIndex: 0];
        }
        else
        {
            while ([operator_stack count] > 0) {
                int pcurr = [LMSViewController precedence: currchar]; // precedence of current operator
                int stacktop = [[operator_stack objectAtIndex:0] characterAtIndex:0]; // op at top of stack
                int ptop = [LMSViewController precedence: stacktop]; //precedence of stacktop
                
                if (pcurr < ptop)
                {
                    operand_stack = [LMSViewController applyOperator:stacktop args:
                                     operand_stack binary:[LMSViewController is_Infix:stacktop]];
                    [operator_stack removeObjectAtIndex:0];
                }
                else break;
            }
            
            NSRange op_range = NSMakeRange(0, 1);
            NSString* newop = [currstring substringWithRange: op_range];
            [operator_stack insertObject: newop atIndex:0];
           }
        }
    while ([operator_stack count] > 0)
    {
        NSString* currstring = [operator_stack objectAtIndex:0];
        int o = [currstring characterAtIndex:0];
        // return empty string if input is not well formed
        if (([operand_stack count] < 1 && [LMSViewController is_SpecialOp:o]) ||
            ([operand_stack count] < 2 && [LMSViewController is_Infix:o]) )
        {
            return @"";
        }
        
        // apply remaining operators
        operand_stack = [LMSViewController applyOperator:o args:operand_stack binary:
                         [LMSViewController is_Infix:o]];
        [operator_stack removeObjectAtIndex:0];
        }
    
        return [operand_stack objectAtIndex:0];
}

- (IBAction)button_eq:(UIButton *)sender {    
    NSString* answer = [LMSViewController evaluate: self.display.text] ;
    self.display.text = answer;
    self.pressed_eq = YES;
    }

- (IBAction)button_clr:(UIButton *)sender {
    self.display.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
