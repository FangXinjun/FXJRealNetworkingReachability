# FXJRealNetworkingReachability
检查网络连接状态,监控网络变化,判断是否能够连接互联网

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
