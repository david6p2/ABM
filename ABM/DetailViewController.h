//
//  DetailViewController.h
//  ABM
//
//  Created by LSR Marketing Service on 1/08/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cliente;//No se preocupe, cliente es una clase

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Cliente * cliente;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UITextField * txtNombre;
@property (strong, nonatomic) IBOutlet UISwitch * swDebe;

@end
