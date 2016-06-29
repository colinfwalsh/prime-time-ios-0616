//
//  FISPrimeTimeTableViewController.h
//  PrimeTime
//
//  Created by Colin Walsh on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISPrimeTimeTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* arrayOfPrimes;

-(NSInteger)primeNumber:(NSInteger)prime;

@end
