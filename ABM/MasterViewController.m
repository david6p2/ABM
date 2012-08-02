//
//  MasterViewController.m
//  ABM
//
//  Created by LSR Marketing Service on 1/08/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "RepositorioClientes.h"
#import "Cliente.h"

//@interface MasterViewController () {
//    NSMutableArray *_objects;
//}
//@end

@implementation MasterViewController


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    /*self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}




/*- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray * clientes = [RepositorioClientes sharedInstance].clientes;
    return clientes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray * clientes = [RepositorioClientes sharedInstance].clientes;
    Cliente * cliente = [clientes objectAtIndex: indexPath.row];
    
    static NSString * nombreCeldas = @"celdasCliente";
    
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:nombreCeldas];
    
    /*if (celda==nil){
        celda = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nombreCeldas];
    }*/
    celda.textLabel.text = cliente.nombre;
    celda.detailTextLabel.text = (cliente.debeDinero) ? @"Es deudor" : @"Es amigo";
    celda.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return celda;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSMutableArray * clientes = [RepositorioClientes sharedInstance].clientes;
        [clientes removeObjectAtIndex:indexPath.row];
        /*[_objects removeObjectAtIndex:indexPath.row];*/
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editar"]) {
        DetailViewController * detalle = [segue destinationViewController];
        
        NSMutableArray * clientes = [RepositorioClientes sharedInstance].clientes;
        Cliente * cliente = [clientes objectAtIndex: [self.tableView indexPathForSelectedRow].row];
        
        detalle.cliente = cliente;
        
        /*NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = [_objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];*/
    }
}

@end
