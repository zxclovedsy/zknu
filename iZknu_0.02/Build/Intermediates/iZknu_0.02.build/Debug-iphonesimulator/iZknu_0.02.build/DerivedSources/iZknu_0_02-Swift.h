// Generated by Apple Swift version 2.1 (swiftlang-700.1.101.6 clang-700.1.76)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
#endif

#import "/Users/juno/Documents/git/zknu/iZknu_0.02/iZknu_0.02-Bridging-Header.h"

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC10iZknu_0_0211AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10iZknu_0_0234CanJiaDeHuoDongTableViewController")
@interface CanJiaDeHuoDongTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0238ChuangJianDeHuoDongTableViewController")
@interface ChuangJianDeHuoDongTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0238ChuangJianDeSheTuanTableViewController")
@interface ChuangJianDeSheTuanTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIScrollView;
@class DOPDropDownMenu;
@class UICarouselView;
@class NSIndexPath;
@class UITableViewCell;
@class DOPIndexPath;

SWIFT_CLASS("_TtC10iZknu_0_0226HuoDongTableViewController")
@interface HuoDongTableViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView * __null_unspecified scrollView;
@property (nonatomic, strong) DOPDropDownMenu * __null_unspecified menu;
@property (nonatomic, strong) UICarouselView * __null_unspecified carouselView;
@property (nonatomic, strong) UITableView * __null_unspecified tableView;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull departments;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull types;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull times;
- (void)viewDidLoad;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)tableView:(UITableView * __nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)scrollViewDidScroll:(UIScrollView * __nonnull)scrollView;
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu * __null_unspecified)menu;
- (NSInteger)menu:(DOPDropDownMenu * __null_unspecified)menu numberOfRowsInColumn:(NSInteger)column;
- (NSString * __null_unspecified)menu:(DOPDropDownMenu * __null_unspecified)menu titleForRowAtIndexPath:(DOPIndexPath * __null_unspecified)indexPath;
- (void)menu:(DOPDropDownMenu * __null_unspecified)menu didSelectRowAtIndexPath:(DOPIndexPath * __null_unspecified)indexPath;
- (void)setupScrollView;
- (void)setupMenu;
- (void)setupCarouselView;
- (void)setupTableView;
- (void)setupContentSize;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;
@class UITextField;
@class UITextView;
@class UIColor;
@class UIImage;
@class UIButton;

SWIFT_CLASS("_TtC10iZknu_0_0221HuoDongViewController")
@interface HuoDongViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView * __null_unspecified scrollView;
@property (nonatomic, strong) UIImageView * __null_unspecified imageView;
@property (nonatomic, copy) NSArray<UITextField *> * __null_unspecified textFields;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)setupScrollView;
- (void)setupImageView;
- (void)setupLabels;
- (void)setupTextFields;
- (void)setupTextView;
- (void)setupButton;
- (BOOL)textFieldShouldBeginEditing:(UITextField * __nonnull)textField;
- (BOOL)textViewShouldBeginEditing:(UITextView * __nonnull)textView;
- (UIImage * __nonnull)getImageWithColor:(UIColor * __nonnull)color size:(CGSize)size;
- (void)buttonTapped:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0233JiaRuDeSheTuanTableViewController")
@interface JiaRuDeSheTuanTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;

SWIFT_CLASS("_TtC10iZknu_0_0227LiaoTianTableViewController")
@interface LiaoTianTableViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * __null_unspecified tableView;
@property (nonatomic, strong) UILabel * __null_unspecified label;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)setupLabel;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImagePickerController;
@class UIBarButtonItem;
@class UITapGestureRecognizer;

SWIFT_CLASS("_TtC10iZknu_0_0224NewHuoDongViewController")
@interface NewHuoDongViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView * __null_unspecified scrollView;
@property (nonatomic, strong) UITextView * __null_unspecified huoDongJianJieTextView;
@property (nonatomic, strong) UIImageView * __null_unspecified haiBaoImageView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (BOOL)textFieldShouldReturn:(UITextField * __nonnull)textField;
- (BOOL)textViewShouldEndEditing:(UITextView * __nonnull)textView;
- (void)textViewDidBeginEditing:(UITextView * __nonnull)textView;
- (void)imagePickerController:(UIImagePickerController * __nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * __nonnull)info;
- (void)setupView;
- (void)undoButtonTapped:(UIBarButtonItem * __nonnull)sender;
- (void)doneButtonTapped:(UIBarButtonItem * __nonnull)sender;
- (void)selectImageFromPhotoLibrary:(UITapGestureRecognizer * __nonnull)sender;
- (void)finishButtonTapped:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0224NewSheTuanViewController")
@interface NewSheTuanViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView * __null_unspecified scrollView;
@property (nonatomic, strong) UITextView * __null_unspecified sheTuanJianJieTextView;
@property (nonatomic, strong) UIImageView * __null_unspecified haiBaoImageView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (BOOL)textFieldShouldReturn:(UITextField * __nonnull)textField;
- (BOOL)textViewShouldEndEditing:(UITextView * __nonnull)textView;
- (void)textViewDidBeginEditing:(UITextView * __nonnull)textView;
- (void)imagePickerController:(UIImagePickerController * __nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * __nonnull)info;
- (void)setupView;
- (void)undoButtonTapped:(UIBarButtonItem * __nonnull)sender;
- (void)doneButtonTapped:(UIBarButtonItem * __nonnull)sender;
- (void)selectImageFromPhotoLibrary:(UITapGestureRecognizer * __nonnull)sender;
- (void)finishButtonTapped:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0226SFenLeiTableViewController")
@interface SFenLeiTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0226SYuanXiTableViewController")
@interface SYuanXiTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0227SZhaoXinTableViewController")
@interface SZhaoXinTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0226SheTuanTableViewController")
@interface SheTuanTableViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * __null_unspecified tableView;
@property (nonatomic, strong) DOPDropDownMenu * __null_unspecified menu;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull departments;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull types;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull recruitments;
- (void)viewDidLoad;
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu * __null_unspecified)menu;
- (NSInteger)menu:(DOPDropDownMenu * __null_unspecified)menu numberOfRowsInColumn:(NSInteger)column;
- (NSString * __null_unspecified)menu:(DOPDropDownMenu * __null_unspecified)menu titleForRowAtIndexPath:(DOPIndexPath * __null_unspecified)indexPath;
- (void)menu:(DOPDropDownMenu * __null_unspecified)menu didSelectRowAtIndexPath:(DOPIndexPath * __null_unspecified)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)tableView:(UITableView * __nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)setupMenu;
- (void)setupTableView;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0221SheTuanViewController")
@interface SheTuanViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIPageControl;
@class NSTimer;

SWIFT_CLASS("_TtC10iZknu_0_0214UICarouselView")
@interface UICarouselView : UIView <UIScrollViewDelegate>
@property (nonatomic, copy) NSArray<UIImage *> * __null_unspecified images;
@property (nonatomic) NSInteger pages;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic, strong) UIScrollView * __null_unspecified scrollView;
@property (nonatomic, strong) UIPageControl * __null_unspecified pageControl;
@property (nonatomic, strong) NSTimer * __null_unspecified timer;
- (nonnull instancetype)initWithImages:(NSArray<UIImage *> * __nonnull)images origin:(CGPoint)origin height:(CGFloat)height OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)setupScrollView;
- (void)setupImageViews;
- (void)setupPageControl;
- (void)setupTimer;
- (void)addViews;
- (void)scrollViewDidScroll:(UIScrollView * __nonnull)scrollView;
- (void)backToEnd;
- (void)autoScroll;
@end


SWIFT_CLASS("_TtC10iZknu_0_0228WoDeFenSiTableViewController")
@interface WoDeFenSiTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0230WoDeGuanZhuTableViewController")
@interface WoDeGuanZhuTableViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0223WoDeTableViewController")
@interface WoDeTableViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * __null_unspecified tableView;
@property (nonatomic, strong) UIImageView * __null_unspecified touXiangImageView;
@property (nonatomic, strong) UIView * __null_unspecified topView;
@property (nonatomic, strong) UILabel * __null_unspecified nameLabel;
@property (nonatomic, strong) UILabel * __null_unspecified numberLabel;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull info;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)tableView:(UITableView * __nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)setupTopView;
- (void)setupTableView;
- (void)setupTouXiangImageView;
- (void)setupLabels;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISegmentedControl;

SWIFT_CLASS("_TtC10iZknu_0_0219XinDeViewController")
@interface XinDeViewController : UIViewController
@property (nonatomic, strong) UISegmentedControl * __null_unspecified segmentedControl;
@property (nonatomic, strong) NewHuoDongViewController * __null_unspecified newHuoDongViewController;
@property (nonatomic, strong) NewSheTuanViewController * __null_unspecified newSheTuanViewController;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)setupSegmentedControl;
- (void)segmentedControlIndexChanged:(UISegmentedControl * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10iZknu_0_0221ZhaoXinViewController")
@interface ZhaoXinViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
