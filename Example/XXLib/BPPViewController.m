//
//  BPPViewController.m
//  XXLib
//
//  Created by baopanpan on 09/05/2018.
//  Copyright (c) 2018 baopanpan. All rights reserved.
//

#import "BPPViewController.h"


@interface BPPViewController () 


@end

@implementation BPPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    
}

- (void)cellDidClick:(NSIndexPath *)indexPath data:(id)obj {
    NSLog(@"%@",obj);
}

- (void)cellHeaderIconDidClick:(NSIndexPath *)indexPath data:(id)obj tag:(NSInteger)tag {
    NSLog(@"%@",obj);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
