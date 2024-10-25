import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sales_controller.dart';

class UpdateSaleView extends StatelessWidget {
  const UpdateSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesController salesController = Get.find();
    final selectedIndex = 0.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Penjualan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final sale = salesController.sales[selectedIndex.value];
          final noFakturController =
              TextEditingController(text: sale['noFaktur']);
          final customerController =
              TextEditingController(text: sale['customer']);
          final jumlahBarangController =
              TextEditingController(text: sale['jumlahBarang'].toString());
          final totalPenjualanController =
              TextEditingController(text: sale['totalPenjualan'].toString());

          return Column(
            children: [
              DropdownButton<int>(
                value: selectedIndex.value,
                items: List.generate(
                  salesController.sales.length,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text(
                        'Invoice ${salesController.sales[index]['noFaktur']}'),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) selectedIndex.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noFakturController,
                decoration: const InputDecoration(
                  labelText: 'No Faktur',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: customerController,
                decoration: const InputDecoration(
                  labelText: 'Nama Customer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: jumlahBarangController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Barang',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: totalPenjualanController,
                decoration: const InputDecoration(
                  labelText: 'Total Penjualan',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  salesController.updateSale(
                    selectedIndex.value,
                    {
                      'noFaktur': noFakturController.text,
                      'tanggal': sale['tanggal'],
                      'customer': customerController.text,
                      'jumlahBarang': int.parse(jumlahBarangController.text),
                      'totalPenjualan':
                          double.parse(totalPenjualanController.text),
                    },
                  );
                  Get.back();
                  Get.snackbar(
                    'Success',
                    'Data penjualan berhasil diupdate',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: const Text('Update'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
