//
//  ViewController.m
//  Running
//
//  Created by student on 9/26/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin; //> ball radius
    int _numberOfBall;
    int _m;
    CGFloat _space; //>balldiameter
    CGFloat _ballDiameter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _margin =40.0;
    _ballDiameter=29.0;
    [self checkSizeOfApp];
    [self numberOfBallvsSpace];
    [self drawRowOfBalls:7];
}
-(void) placeGrayBallAtX: (CGFloat) x
                    andY: (CGFloat) y
                 withTag:(int)tag

{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gray"]];
    ball.center =CGPointMake(x, y);
    ball.tag =tag;
    [self.view addSubview:ball];
    NSLog(@"w=%3.0f, h=%3.0f", ball.bounds.size.width, ball.bounds.size.height);
}
-(CGFloat) spaceBetweenBallCenterWhenNumberBallIsKnown: (int) n{
    return(self.view.bounds.size.width - 2 * _margin) /(n-1);
    
}

-(void) numberOfBallvsSpace {
    bool stop = false;
    int n = 2;
    while (!stop){
        CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown: n];
        if (space < _ballDiameter){
            stop =true;
        } else {
            NSLog(@"Number of ball:%d, space between ball center:%3.0f", n, space);
        }n++;
    }
}

-(void) drawRowOfBalls: (int) numberBalls {
    CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown:numberBalls];
    for(int j =1; j < 667/space-2; j++)
        for(int i =0; i < numberBalls; i++)
        {
            [self placeGrayBallAtX:_margin +i * space
                              andY:_margin + j* space
                           withTag: i+100];
            
        }
}

-(void) checkSizeOfApp {
    CGSize size = self.view.bounds.size;
    NSLog(@"width = %3.0f, height = %3.0f", size.width, size.height);
}
@end
