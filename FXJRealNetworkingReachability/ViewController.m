//
//  ViewController.m
//  FXJRealNetworkingReachability
//
//  Created by myApplePro01 on 16/4/19.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@property (nonatomic) Reachability *hostReachability;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    NSString *remoteHostName = @"www.baidu.com";
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
}

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    if (curReach == self.hostReachability)
    {
        NetworkStatus netStatus = [curReach currentReachabilityStatus];
        if (netStatus) {
            NetworkStatus netStatus = [curReach currentReachabilityStatus];
            switch (netStatus) {
                case 1:
                    NSLog(@"WiFi");
                    break;
                case 2:
                    NSLog(@"WWAN");
                    break;
                default:
                    break;
            }
        }else{
            NSLog(@"Unable to connect to the Internet");
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
