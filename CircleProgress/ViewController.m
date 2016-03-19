//
//  ViewController.m
//  CircleProgress
//
//  Created by Jerry Bao on 3/17/16.
//  Copyright © 2016 JerryInc. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()
{
    CircleProgressView* m_testView;
    NSTimer* m_timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    m_testView = [[CircleProgressView alloc] initWithFrame:self.view.bounds];
    m_testView.percent = 100;
    [self.view addSubview:m_testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (m_testView.percent > 0) {
        m_testView.percent = m_testView.percent - 1;
        [m_testView setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}

@end
