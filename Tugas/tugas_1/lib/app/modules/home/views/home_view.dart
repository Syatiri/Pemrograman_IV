import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_1/app/routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management System'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildMenuCard(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  color: Colors.blue,
                  onTap: () => Get.toNamed(AppRoutes.DASHBOARD),
                ),
                _buildMenuCard(
                  icon: Icons.add,
                  title: 'Add',
                  color: Colors.red,
                  onTap: () => Get.toNamed(AppRoutes.ADD),
                ),
                _buildMenuCard(
                  icon: Icons.update,
                  title: 'Update',
                  color: Colors.green,
                  onTap: () => Get.toNamed(AppRoutes.UPDATE),
                ),
                _buildMenuCard(
                  icon: Icons.logout,
                  title: 'Logout',
                  color: Colors.grey,
                  onTap: () => Get.offAllNamed(AppRoutes.LOGIN),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: const Column(
              children: [
                Text(
                  'NPM: 1194049',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Nama: M. Hadi Syatiri',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
