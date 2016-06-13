//
//  PaletteViewController.m
//  Colorboard
//
//  Created by Ernald on 6/7/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "PaletteViewController.h"
#import "ColorDescription.h"
#import "ColorViewController.h"

@interface PaletteViewController ()
@property (nonatomic) NSMutableArray *colors;
@end

@implementation PaletteViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
    [super viewWillAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    ColorDescription *cd = self.colors[indexPath.row];
    cell.textLabel.text = cd.name;
    cell.textLabel.textColor = cd.color;
    
    return cell;
}

- (NSArray *) colors
{
    if(!_colors)
    {
        _colors = [NSMutableArray new];
        ColorDescription *cd = [ColorDescription new];
        [_colors addObject:cd];
    }
    
    return _colors;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"NewColor"])
    {
        ColorDescription *cd = [ColorDescription new];
        [self.colors addObject:cd];
        
        UINavigationController *nc = [segue destinationViewController];
        ColorViewController *pVC = (ColorViewController *) nc.view;
        pVC.existingColor = false;
    }
    else if([segue.identifier isEqualToString:@"ExistingColor"])
    {
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        ColorDescription *cd = self.colors[path.row];
        
        ColorViewController *pVC = [segue destinationViewController];
        pVC.existingColor = false;
        pVC.colorDescription = cd;
    }
}

@end
