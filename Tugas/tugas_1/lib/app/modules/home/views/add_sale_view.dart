import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sales_controller.dart';

class AddSaleView extends StatelessWidget {
  const AddSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final SalesController salesController = Get.find();

    final noFakturController = TextEditingController();
    final customerController = TextEditingController();
    final jumlahBarangController = TextEditingController();
    final totalPenjualanController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Penjualan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: noFakturController,
                decoration: const InputDecoration(
                  labelText: 'No Faktur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter invoice number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: customerController,
                decoration: const InputDecoration(
                  labelText: 'Nama Customer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter customer name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: jumlahBarangController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Barang',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: totalPenjualanController,
                decoration: const InputDecoration(
                  labelText: 'Total Penjualan',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    salesController.addSale({
                      'noFaktur': noFakturController.text,
                      'tanggal': DateTime.now(),
                      'customer': customerController.text,
                      'jumlahBarang': int.parse(jumlahBarangController.text),
                      'totalPenjualan':
                          double.parse(totalPenjualanController.text),
                    });
                    Get.back();
                    Get.snackbar(
                      'Success',
                      'Data penjualan berhasil ditambahkan',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
