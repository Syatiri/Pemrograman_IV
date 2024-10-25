class Sale {
  String noFaktur;
  DateTime tanggal;
  String customer;
  int jumlahBarang;
  double totalPenjualan;

  Sale({
    required this.noFaktur,
    required this.tanggal,
    required this.customer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  });

  Map<String, dynamic> toMap() {
    return {
      'noFaktur': noFaktur,
      'tanggal': tanggal,
      'customer': customer,
      'jumlahBarang': jumlahBarang,
      'totalPenjualan': totalPenjualan,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      noFaktur: map['noFaktur'],
      tanggal: map['tanggal'],
      customer: map['customer'],
      jumlahBarang: map['jumlahBarang'],
      totalPenjualan: map['totalPenjualan'],
    );
  }
}
