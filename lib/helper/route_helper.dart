import'dart:convert';
import 'package:get/get.dart';
import '../../../utils/core_export.dart';

class RouteHelper {

  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String offers = '/offers';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String accessLocation = '/access-location';
  static const String pickMap = '/pick-map';
  static const String verification = '/verification';
  static const String sendOtpScreen = '/send-otp';
  static const String changePassword = '/change-password';
  static const String searchScreen = '/search';
  static const String serviceDetails = '/service-details';
  static const String profile = '/profile';
  static const String profileEdit = '/profile-edit';
  static const String notification = '/notification';
  static const String address = '/address';
  static const String orderSuccess = '/order-completed';
  static const String checkout = '/checkout';
  static const String customPostCheckout = '/custom-checkout';
  static const String html = '/html';
  static const String categories = '/categories';
  static const String categoryProduct = '/category';
  static const String support = '/support';
  static const String update = '/update';
  static const String cart = '/cart';
  static const String addAddress = '/add-address';
  static const String editAddress = '/edit-address';
  static const String chatScreen = '/chat-screen';
  static const String chatInbox = '/chat-inbox';
  static const String onBoardScreen = '/onBoardScreen';
  static const String settingScreen = '/settingScreen';
  static const String languageScreen = '/language';
  static const String voucherScreen = '/voucher';
  static const String bookingListScreen = '/booking-list';
  static const String bookingDetailsScreen = '/booking-details';
  static const String trackBooking = '/track-booking';
  static const String rateReviewScreen = '/rate-review-screen';
  static const String allServiceScreen = '/service';
  static const String featheredServiceScreen = '/feathered-service-screen';
  static const String subCategoryScreen = '/subcategory-screen';
  static const String notLoggedScreen = '/not-logged-screen';
  static const String suggestService = '/suggest-service';
  static const String suggestServiceList = '/suggest-service-list';
  static const String myWallet = '/my-wallet';
  static const String loyaltyPoint = '/my-point';
  static const String referAndEarn = '/refer-and-earn';
  static const String allProviderList = '/all-provider';
  static const String providerDetailsScreen = '/provider-details';
  static const String providerReviewScreen = '/provider-review-screen';
  static const String providerAvailabilityScreen = '/provider-availability-screen';
  static const String createPost = '/create-post';
  static const String createPostSuccessfully = '/create-post-successfully';
  static const String myPost = '/my-post';
  static const String providerOfferList = '/provider-offer-list';
  static const String providerOfferDetails = '/provider-offer-details';
  static const String providerWebView = '/provider-web-view';
  static const String serviceArea = '/service-area';
  static const String serviceAreaMap = '/service-area-map';
  static const String customImageListScreen = '/custom-image-list-screen';
  static const String zoomImage = '/zoom-image';
  static const String favorite = '/favorite';
  static const String nearByProvider = '/nearby-provider';
  static const String maintenance = '/maintenance';
  static const String updateProfile = '/update-profile';

  static String getHtmlRoute(String page) => '$html?page=$page';
  static String getInitialRoute() => initial;

  static String getUpdateRoute(String fromPage) => '$update?update=$fromPage';

  static String getMaintenanceRoute() => maintenance;
  static String getLanguageScreen(String fromPage) => '$languageScreen?fromPage=$fromPage';

  static String getSplashRoute() {
    return splash;
  }

  static String getOffersRoute() => offers;

  static String getSignInRoute({String? fromPage}) => '$signIn?page=$fromPage';

  static String getSignUpRoute() => signUp;

  static String getSendOtpScreen() => sendOtpScreen;

  static String getVerificationRoute(
      {required String identity, required String identityType, required String fromPage, String? firebaseSession}) {
    String data = Uri.encodeComponent(jsonEncode(identity));
    String session = base64Url.encode(utf8.encode(firebaseSession ?? ''));


    return '$verification?identity=$data&identity_type=$identityType&fromPage=$fromPage&session=$session';
  }

  static String getAccessLocationRoute(String page) =>
      '$accessLocation?page=$page';

  static String getMainRoute(String page, { String? showServiceNotAvailableDialog}) {
    String data = '';
    return '$home?page=$page&address=$data&showDialog=$showServiceNotAvailableDialog';
  }

  static String getSearchResultRoute({String? queryText, String? fromPage}) {
    String data = '';
    if (queryText != null && queryText != '' && queryText != 'null') {
      List<int> encoded = utf8.encode(jsonEncode(queryText));
      data = base64Encode(encoded);
    }
    return '$searchScreen?fromPage=${fromPage ?? ''}&query=$data';
  }

  static String getServiceRoute(String id, {String fromPage = "others"}) =>
      '$serviceDetails?id=$id&fromPage=$fromPage';

  static String getProfileRoute() => profile;

  static String getEditProfileRoute() => profileEdit;

  static String getNotificationRoute() => notification;

  static String getTrackBookingRoute() => trackBooking;

  static String getSupportRoute() => support;

  static String getCartRoute() => cart;

  static String getSettingRoute() => settingScreen;


  static List<GetPage> routes = [

  GetPage

  (

  name: initial, binding: BottomNavBinding(),
  page: () => const BottomNavScreen(pageIndex: 0, showServiceNotAvailableDialog: true,),
  ),
  GetPage(name: splash, page: () {
  return SplashScreen();
  }),
  GetPage(name: languageScreen, page: () => LanguageScreen(fromPage: Get.parameters['fromPage'],)),
  // GetPage(name: offers, page: () => getRoute(const OfferScreen())),
  GetPage(name: signIn, page: () =>
  SignInScreen(
  exitFromApp: Get.parameters['page'] == signUp || Get.parameters['page'] == splash,
  fromPage: Get.parameters['page'] ,
  )),
  GetPage(name: signUp, page: () => const SignUpScreen()),

  GetPage(binding: BottomNavBinding(), name: home, page: () {
  return getRoute( BottomNavScreen(
  pageIndex: Get.parameters['page'] == 'home' ? 0 :
  Get.parameters['page'] == 'booking' ? 1 :
  Get.parameters['page'] == 'cart' ? 2 :
  Get.parameters['page'] == 'order' ? 3 :
  Get.parameters['page'] == 'menu' ? 4 : 0,
  showServiceNotAvailableDialog: Get.parameters['showDialog'] == 'false' ? false : true,
  ));
  },
  ),

  // GetPage(name: sendOtpScreen, page:() {
  // return const ForgetPassScreen();
  // }),

  // GetPage(name: verification, page:() {
  // String data = Uri.decodeComponent(jsonDecode(Get.parameters['identity']!));
  // return VerificationScreen(
  // identity: data,
  // identityType: Get.parameters['identity_type']!,
  // fromPage: Get.parameters['fromPage']!,
  // firebaseSession: Get.parameters['session'] == 'null' ? null
  //     : utf8.decode(base64Url.decode(Get.parameters['session'] ?? '')),
  // );
  // }),

  GetPage(name: profile, page: () => const ProfileScreen()),
  // GetPage(name: profileEdit, page: () => getRoute(const EditProfileScreen())),
  // GetPage(name: notification, page: () => getRoute(const NotificationScreen())),


  // GetPage(name: support, page: () => SupportScreen()),
  GetPage(name: update, page: () => UpdateScreen(fromPage: Get.parameters['update'])),

  // GetPage(binding: OnBoardBinding(),name: onBoardScreen, page: ()=>const OnBoardingScreen(),),
  // GetPage(name: settingScreen, page: ()=>const SettingScreen(),),


  GetPage(name: maintenance, page: () => const MaintenanceScreen()),

  // GetPage(name: updateProfile, page: () {
  // String phone = Uri.decodeComponent(jsonDecode(Get.parameters['phone']??""));
  // String email = Uri.decodeComponent(jsonDecode(Get.parameters['email']??""));
  // String tempToken = Uri.decodeComponent(jsonDecode(Get.parameters['temp-token']??""));
  // String userName = Uri.decodeComponent(jsonDecode(Get.parameters['user-name']??""));
  // return UpdateProfileScreen(
  // phone: phone,
  // email: email,
  // tempToken: tempToken,
  // userName: userName,
  // );
  // })
  ];
  static getRoute(Widget navigateTo) {
    bool isRouteExist = Get.currentRoute == "/" || routes.any((route) {
      String routeName = route.name == "/" ? "*" : route.name.replaceAll("/", "");
      return Get.currentRoute.split('?')[0].replaceAll("/", "") == routeName;
    });
    var config = Get.find<SplashController>().configModel.content?.maintenanceMode;
    bool maintenance = config?.maintenanceStatus == 1 && config?.selectedMaintenanceSystem?.webApp == 1 && kIsWeb && !AppConstants.avoidMaintenanceMode;
    return !isRouteExist ?  const NotFoundScreen() : maintenance ? const MaintenanceScreen() :SizedBox();
  }
}

