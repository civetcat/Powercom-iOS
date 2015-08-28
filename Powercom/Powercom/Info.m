//
//  Info.m
//  Powercom
//
//  Created by daniel on 2015/8/12.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "Info.h"
#import "PACBlurryScrollView.h"
#import "UIImageView+LBBlurredImage.h"

@interface Info ()

@end

@implementation Info

- (void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"View will Appear");
//    [self.background_img setImageToBlur:[UIImage imageNamed:@"bg2.jpg"]
//                  blurRadius:kLBBlurredImageDefaultBlurRadius
//             completionBlock:^(NSError *error){
//                 NSLog(@"The blurred image has been setted");
//             }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
