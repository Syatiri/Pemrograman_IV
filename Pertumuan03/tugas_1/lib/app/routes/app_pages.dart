import 'package:get/get.dart';
import 'package:tugas_1/app/modules/home/views/add_sale_view.dart';
import 'package:tugas_1/app/modules/home/views/dashboard_view.dart';
import 'package:tugas_1/app/modules/home/views/home_view.dart';
import 'package:tugas_1/app/modules/home/views/login_view.dart';
import 'package:tugas_1/app/modules/home/views/update_sale_view.dart';
import 'package:tugas_1/app/modules/home/controllers/sales_controller.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
    ),
    GetPage(
      name: AppRoutes.ADD,
      page: () => AddSaleView(),
      binding: BindingsBuilder(() {
        Get.put(SalesController());
      }),
    ),
    GetPage(
      name: AppRoutes.UPDATE,
      page: () => UpdateSaleView(),
      binding: BindingsBuilder(() {
        Get.put(SalesController());
      }),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
    ),
  ];
}
