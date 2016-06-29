//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by Colin Walsh on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@end

@implementation FISPrimeTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfPrimes = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //[self primeNumber:5];
    //    [self primeNumber:386];
       [self primeNumber:2001];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)primeNumber:(NSInteger)prime{
    
    
    NSUInteger primeNumberCount = 0;
    NSUInteger numberCompare = 0;
    NSUInteger multiple = 2;
    
    while (primeNumberCount < prime) {
        numberCompare++;
        if (numberCompare == 1) {
            continue;
        }
        
        else if (numberCompare == multiple) {
            primeNumberCount++;
            [self.arrayOfPrimes addObject:[NSNumber numberWithInt:(int)numberCompare]];
        }
        
        else if (numberCompare % multiple != 0) {
            
            BOOL isPrime = NO;
            
            for (NSNumber* primeCount in self.arrayOfPrimes) {
                NSInteger primeCountToInteger = [primeCount integerValue];
                
                if (numberCompare % primeCountToInteger != 0) {
                    isPrime = YES;
                    continue;
                }
                else if (numberCompare % primeCountToInteger == 0) {
                    isPrime = NO;
                    break;}
            }
            
            if (isPrime == YES) {
                primeNumberCount++;
                [self.arrayOfPrimes addObject:[NSNumber numberWithInt:(int)numberCompare]];
            }
         
        }
        
    }
    
    //NSLog(@"%@", self.arrayOfPrimes);
    
    NSNumber* numberFromArray = self.arrayOfPrimes[prime - 1];
    
    NSInteger numberToInt = [numberFromArray intValue];
    
    NSLog(@"%li", numberToInt);
    return numberToInt;}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayOfPrimes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
    
    NSString* primeOutput = [NSString stringWithFormat:@"%@", self.arrayOfPrimes[indexPath.row]];
    
    cell.textLabel.text = [NSString stringWithString:primeOutput];
    
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%li", [self primeNumber:indexPath.row]];
    // Configure the cell...
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
