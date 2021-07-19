//
//  ArtistViewController.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "ArtistViewController.h"
#import "PaletteViewController.h"
//#import "TimerViewController.h"
#import "DrawingsViewController.h"
//#import "RSTask8Final-Bridging-Header.h"

#import "RSTask8Final-Swift.h"

#import "DrawingView.h"

//@class PaletteViewController;

#import "ArtistButton.h"
#import "DrawingView.h"
#import "DrawingButton.h"
#import "DrawingButton+PictureTypeEnum.h"

@interface ArtistViewController ()

@property (strong, nonatomic) DrawingsViewController *drawingVC;
@property (strong, nonatomic) PaletteViewController *paletteChildVC;
@property (strong, nonatomic) TimerViewController *timerChildVC;
@property (strong, nonatomic) DrawingView *drawingView;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    self.drawingVC = [DrawingsViewController new];
    self.paletteChildVC = [PaletteViewController new];
    self.timerChildVC = [TimerViewController new];
    // Создаеть drawingView и прокинуть ее в остальные контроллер
    
    [self configuringArtistButtons];
    [self configuringDrawingView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupNavigationItems];
    
}

// configuring navigation bar items
- (void)setupNavigationItems {
    self.navigationItem.title = @"Artist";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
    }];
    
    UIBarButtonItem *drawingsRightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStylePlain target:self action:@selector(drawingsRightBarButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = drawingsRightBarButton;
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateHighlighted];
    self.navigationController.navigationBar.tintColor = [UIColor colorNamed:@"Light Green Sea"];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorNamed:@"Light Green Sea"];
}

// drawing right bar button tap selector
- (void)drawingsRightBarButtonTapped {
    [self.navigationController pushViewController:self.drawingVC animated:YES];
}

- (void)configuringDrawingView {
    DrawingView *drawingView = [[DrawingView alloc] initWithFrame:CGRectMake(38.0, 104.0, 300.0, 300.0)];
    
    self.drawingView = drawingView;
    
    self.drawingView.delegate = self;
    self.paletteChildVC.drawingView = self.drawingView;
    self.drawingVC.drawingView = self.drawingView;
    self.timerChildVC.drawingView = self.drawingView;
    
    [self.view addSubview:drawingView];
}


- (void)configuringArtistButtons {
    
    ArtistButton *paletteButton = [[ArtistButton alloc] initWithFrame:CGRectMake(20.0, 454.0, 163.0, 32.0) andTitle:@"Open Palette"];
    ArtistButton *drawButton = [[ArtistButton alloc] initWithFrame:CGRectMake(243.0, 454.0, 91.0, 32.0) andTitle:@"Draw"];
    ArtistButton *timerButton = [[ArtistButton alloc] initWithFrame:CGRectMake(20.0, 506.0, 151.0, 32.0) andTitle:@"Open Timer"];
    ArtistButton *shareButton = [[ArtistButton alloc] initWithFrame:CGRectMake(239.0, 506.0, 95.0, 32.0) andTitle:@"Share"];
    
//    UIButton *paletteButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 454.0, 163.0, 32.0)];
//    UIButton *drawButton = [[UIButton alloc] initWithFrame:CGRectMake(234.0, 454.0, 91.0, 32.0)];
//    UIButton *timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 506.0, 151.0, 32.0)];
//    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(239.0, 506.0, 95.0, 32.0)];
//
//    [paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
//    [drawButton setTitle:@"Draw" forState:UIControlStateNormal];
//    [timerButton setTitle:@"Open Timer" forState:UIControlStateNormal];
//    [shareButton setTitle:@"Share" forState:UIControlStateNormal];
//
//    [paletteButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
//    [drawButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
//    [timerButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
//    [shareButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
//
//    paletteButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
//    drawButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
//    timerButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
//    shareButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    
//    [paletteButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
//    [drawButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
//    [timerButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
//    [shareButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [drawButton addTarget:self action:@selector(drawPicture:) forControlEvents:UIControlEventTouchUpInside];
    [timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton addTarget:self action:@selector(sharePicture:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:paletteButton];
    [self.view addSubview:drawButton];
    [self.view addSubview:timerButton];
    [self.view addSubview:shareButton];
    
}

//-(void)drawingButtonTapped:(DrawingButton *)sender {
//    NSLog(@"111");
//    NSLog(@"%u", sender.pictureType);
//}

- (void)showHalfScreenChildVC:(UIViewController *)controller {
//    NSLog(@"111");
    [self addChildViewController:controller];
    controller.view.frame = CGRectMake(0.0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void)openPalette:(ArtistButton *)sender {
    [self showHalfScreenChildVC:self.paletteChildVC];
}

- (void)drawPicture:(ArtistButton *)sender {
    NSLog(@"123123");
    [self.drawingView setNeedsDisplay];
}

- (void)justDrawing {
    float interval = 1.0/60.0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self.drawingView selector:@selector(changeStrokeEnd) userInfo:nil repeats:true];
}

- (void)openTimer:(ArtistButton *)sender {
    [self showHalfScreenChildVC:self.timerChildVC];
}

- (void)sharePicture:(ArtistButton *)sender {
    CGRect rect = [self.drawingView bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.drawingView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}




















//if (self.isPaletteChildViewControllerAdded) {
//    self.isPaletteChildViewControllerAdded = NO;
//
//    [self.paletteChildVC willMoveToParentViewController:nil];
//    [self.paletteChildVC.view removeFromSuperview];
//    [self.paletteChildVC removeFromParentViewController];
//} else {
//    self.isPaletteChildViewControllerAdded = YES;
//
//    self.paletteChildVC = [[PaletteViewController alloc] initWithNibName:@"PaletteViewController" bundle:nil];
//    [self addChildViewController:self.paletteChildVC];
//
//    self.paletteChildVC.view.frame = CGRectMake(0.0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
//
//    [self.view addSubview:self.paletteChildVC.view];
//    [self.paletteChildVC didMoveToParentViewController:self];
//}

@end
