import 'package:flutter/material.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/views/drawer/botton_menu_component.dart';
import 'package:curso_app/views/drawer/drawer_menu.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerMenu()),
      backgroundColor: AppColors.backgroundMain,
      appBar: AppBar(
        title: const Text(
          'Hola, asesor',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header clientes
              _buildSummaryCards(),
              const SizedBox(height: 24),

              ///cuerpo
              const Text(
                'Clientes recientes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              _buildRecentClients(),
              const SizedBox(height: 24),
              _buildActionButtons(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottonMenuComponent(
        onItemTapped: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  //dise;o de las filas de informacion principal
  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //metodo de creacion de contenedor con los parametros icono, totulo y cantidad. opcional color para hacer alguna validacion
        _summaryCard(Icons.location_on_outlined, 'Visitas de hoy', '5'),
        _summaryCard(Icons.receipt_long_outlined, 'Clientes contactados', '12'),
        _summaryCard(
          Icons.person_outline,
          'Cotizaciones esta semana',
          '3',
          color: AppColors.success,
        ),
      ],
    );
  }

  Widget _summaryCard(
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color ?? AppColors.buttonPrimary, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentClients() {
    final clients = [
      {'name': 'Miguel Rosales', 'company': 'Acme S.A.', 'status': 'Realizada'},
      {'name': 'Laura Martín', 'company': 'Beta Corp.', 'status': 'Pendiente'},
      {
        'name': 'Alejandro Pérez',
        'company': 'Gamma Ltd.',
        'status': 'Pendiente',
      },
      {'name': 'Carmen Duarte', 'company': 'Delta Co.', 'status': 'Pendiente'},
      {'name': 'Miguel Rosales', 'company': 'Acme S.A.', 'status': 'Realizada'},
      {'name': 'Miguel Rosales', 'company': 'Acme S.A.', 'status': 'Realizada'},
      {'name': 'Miguel Rosales', 'company': 'Acme S.A.', 'status': 'Realizada'},
      {'name': 'Miguel Rosales', 'company': 'Acme S.A.', 'status': 'Realizada'},
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(clients.length, (index) {
          final isLast = index == clients.length - 1;
          return _clientRow(clients[index], isLast);
        }),
      ),
    );
  }

  Widget _clientRow(Map<String, String> client, bool isLast) {
    bool isDone = client['status'] == 'Realizada';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  client['company']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (isDone)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 16,
                  ),
                const SizedBox(width: 4),
                Text(
                  client['status']!,
                  style: TextStyle(
                    color: isDone ? AppColors.success : AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (!isLast) const Divider(height: 16, color: AppColors.border),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(Icons.location_on_outlined, 'Nueva visita'),
        _actionButton(Icons.person_add_alt_1_outlined, 'Nuevo cliente'),
        _actionButton(Icons.request_quote_outlined, 'Cotizar'),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonPrimary,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: Icon(icon, color: AppColors.textOnPrimary),
          label: Text(
            label,
            style: const TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 14,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
