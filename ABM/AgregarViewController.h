//
//  AgregarViewController.h
//  ABM
//
//  Created by LSR Marketing Service on 1/08/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgregarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UISwitch *swDebe;
- (IBAction)guardar:(id)sender;
- (IBAction)cancelar:(id)sender;

@end
