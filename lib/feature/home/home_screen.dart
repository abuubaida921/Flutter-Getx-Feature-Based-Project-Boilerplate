import 'package:get/get.dart';
import '../../../utils/core_export.dart';


class HomeScreen extends StatefulWidget {
  static Future<void> loadData(bool reload, {int availableServiceCount = 1}) async {

    // if(availableServiceCount==0){
    //   Get.find<BannerController>().getBannerList(reload);
    // }else{
    //   Get.find<ServiceController>().getRecommendedSearchList();
    //   Get.find<ServiceController>().getAllServiceList(1,reload);
    //   Get.find<BannerController>().getBannerList(reload);
    //   Get.find<AdvertisementController>().getAdvertisementList(reload);
    //   Get.find<CategoryController>().getCategoryList(1,reload);
    //   Get.find<ServiceController>().getPopularServiceList(1,reload);
    //   Get.find<ServiceController>().getTrendingServiceList(1,reload);
    //   Get.find<ProviderBookingController>().getProviderList(1,reload);
    //   Get.find<CampaignController>().getCampaignList(reload);
    //   Get.find<ServiceController>().getRecommendedServiceList(1, reload);
    //   Get.find<CheckOutController>().getOfflinePaymentMethod(false);
    //   if(Get.find<AuthController>().isLoggedIn()){
    //     Get.find<ServiceController>().getRecentlyViewedServiceList(1,reload);
    //   }
    //   Get.find<ServiceController>().getFeatherCategoryList(reload);
    //   Get.find<ServiceAreaController>().getZoneList(reload: reload);
    //   Get.find<WebLandingController>().getWebLandingContent();
    //   Get.find<ServiceController>().getRecommendedSearchList();
    //   Get.find<AuthController>().updateToken();
    // }
  }
  final bool showServiceNotAvailableDialog;
  const HomeScreen({super.key, required this.showServiceNotAvailableDialog}) ;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int availableServiceCount = 0;

  @override
  void initState() {
    super.initState();

    Get.find<LocalizationController>().filterLanguage(shouldUpdate: false);
    if(Get.find<AuthController>().isLoggedIn()) {
      Get.find<UserController>().getUserInfo();
    }
    HomeScreen.loadData(false, availableServiceCount: availableServiceCount);

  }
  final ScrollController scrollController = ScrollController();
  final signInShakeKey = GlobalKey<CustomShakingWidgetState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: homeAppBar(signInShakeKey: signInShakeKey),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
          },
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: GetBuilder<SplashController>(builder: (splashController){
              return const Center(child: Text('Homeeeeee'));
            })
          ),
        ),
      ),
    );
  }
}

