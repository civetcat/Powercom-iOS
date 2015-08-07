//
//  Setting.m
//  Powercom
//
//  Created by daniel on 2015/7/24.
//  Copyright (c) 2015年 daniel. All rights reserved.
//

#import "Setting.h"
#import "Cell.h"

@interface Setting ()
{
    NSArray *recipes;
}
@end

@implementation Setting

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize table data
    list_connect = [[NSMutableArray alloc] init];
    [list_connect addObject:@"IP now"];
    [list_connect addObject:@"Connect"];
    
    list_test= [[NSMutableArray alloc] init];
    [list_test addObject:@"UPS Quick Test"];
    [list_test addObject:@"UPS Deep Test"];
    [list_test addObject:@"Cancel Deep Test"];
    
    list_language = [[NSMutableArray alloc] init];
    [list_language addObject:@"中文"];
    [list_language addObject:@"English"];
    [list_language addObject:@"ру́сский язы́к"];
    [list_language addObject:@"العَرَبِيَّة‎‎‎ "];
    [list_language addObject:@"Español"];
    [list_language addObject:@"Italiano"];
    [list_language addObject:@"Deutsch"];
    [list_language addObject:@"Svenska"];
    [list_language addObject:@"Português"];
    [list_language addObject:@"Français"];
    
    list_control = [[NSMutableArray alloc] init];
    [list_control addObject:@"Outlet1 Control On"];
    [list_control addObject:@"Outlet1 Control Off"];
    [list_control addObject:@"Outlet2 Control On"];
    [list_control addObject:@"Outlet2 Control Off"];
    [list_control addObject:@"PC Shutdown"];
    [list_control addObject:@"PC Reboot"];
    [list_control addObject:@"UPS Reboot"];
    
    list_history = [[NSMutableArray alloc] init];
    [list_history addObject:@"Historical Event"];
    
    
//    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger n;
    
    switch (section) {
        case 0:
            n = [list_connect count];
            break;
        case 1:
            n = [list_test count];
            break;
        case 2:
            n = [list_language count];
            break;
        case 3:
            n = [list_control count];
            break;
        case 4:
            n = [list_history count];
            break;
    }
    
    return n;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header;
    
    switch (section) {
        case 0:
            header = @"Connect";
            break;
        case 1:
            header = @"Test";
            break;
        case 2:
            header = @"Language";
            break;
        case 3:
            header = @"Control";
            break;
        case 4:
            header = @"History";
            break;
    }
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell1";//對應storyboad-table view cell 裡面的identifier!
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //UIViewController *uv = [self.storyboard instantiateViewControllerWithIdentifier:@"test"];
    //[self.navigationController showDetailViewController:uv sender:self];
    
    NSLog(@"indexPath = %ld",(long)indexPath.row);
    
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [list_connect objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [list_test objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [list_language objectAtIndex:indexPath.row];
            break;
        case 3:
            cell.textLabel.text = [list_control objectAtIndex:indexPath.row];
            break;
        case 4:
            cell.textLabel.text = [list_history objectAtIndex:indexPath.row];
    }
    

    //cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"testing");
    NSLog(@"(did select) indexPath = %ld",(long)indexPath.row);

    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"123" sender:self];
    }
    if (indexPath.row ==22) {
        [self performSegueWithIdentifier:@"456" sender:self];
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        Cell *destViewController = segue.destinationViewController;
//        //destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
//    }
//}

@end
