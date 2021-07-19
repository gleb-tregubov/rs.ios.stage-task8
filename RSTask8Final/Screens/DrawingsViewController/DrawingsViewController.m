//
//  DrawingsViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.


#import "DrawingsViewController.h"
#import "DrawingButton.h"
//#import "DrawingButton+PictureTypeEnum.h"
#import "ArtistViewController.h"
#import "DrawingView.h"

@interface DrawingsViewController ()

@end

@implementation DrawingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    
    [self configuringDrawingButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationItems];
}

- (void)setupNavigationItems {
    self.navigationItem.title = @"Drawings";
//    self.navigationController.navigationBar.tintColor = [UIColor colorNamed:@"Light Green Sea"];
}

- (void)configuringDrawingButtons {
    
    DrawingButton *planetButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 114.0, 200.0, 40.0) title:@"Planet" andPictureTypeEnum:pictureTypePlanet];
    
    DrawingButton *headButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 169.0, 200.0, 40.0) title:@"Head" andPictureTypeEnum:pictureTypeHead];
    
    DrawingButton *treeButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 224.0, 200.0, 40.0) title:@"Tree" andPictureTypeEnum:pictureTypeTree];
    
    DrawingButton *landscapeButton = [[DrawingButton alloc] initWithFrame:CGRectMake(88.0, 279.0, 200.0, 40.0) title:@"Landscape" andPictureTypeEnum:pictureTypeLandscape];
    
    planetButton.delegate = self;
    headButton.delegate = self;
    treeButton.delegate = self;
    landscapeButton.delegate = self;
    
    [self.view addSubview:planetButton];
    [self.view addSubview:headButton];
    [self.view addSubview:treeButton];
    [self.view addSubview:landscapeButton];
}

-(void)drawingButtonTapped:(DrawingButton *)sender {
    NSLog(@"sender picture type with click %ld", (long)sender.pictureType);
    self.drawingView.pictureType = (NSInteger)sender.pictureType;
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"picture type after equaling to drawingView --- %ld", (long) self.drawingView.pictureType);
}



@end
