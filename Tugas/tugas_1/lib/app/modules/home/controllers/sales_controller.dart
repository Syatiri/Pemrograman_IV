import 'package:get/get.dart';

class SalesController extends GetxController {
  var sales = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    
    sales.addAll([
      {
        'noFaktur': 'INV001',
        'tanggal': DateTime.now().subtract(const Duration(days: 2)),
        'customer': 'M. Hadi Syatiri',
        'jumlahBarang': 5,
        'totalPenjualan': 2500000,
      },
      {
        'noFaktur': 'INV002',
        'tanggal': DateTime.now().subtract(const Duration(days: 1)),
        'customer': 'Udin',
        'jumlahBarang': 3,
        'totalPenjualan': 1500000,
      },
      {
        'noFaktur': 'INV003',
        'tanggal': DateTime.now(),
        'customer': 'Joko',
        'jumlahBarang': 7,
        'totalPenjualan': 3500000,
      },
    ]);
  }

  void addSale(Map<String, dynamic> sale) {
    sales.add(sale);
  }

  void updateSale(int index, Map<String, dynamic> sale) {
    sales[index] = sale;
  }
}
