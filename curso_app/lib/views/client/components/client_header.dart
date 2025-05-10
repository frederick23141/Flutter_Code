import 'package:curso_app/core/components/network_image.dart';
import 'package:curso_app/core/constants/app_images.dart';
import 'package:curso_app/core/constants/app_colors.dart';
import 'package:curso_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientHeader extends StatelessWidget {
  final Function(String) onChanged;

  const ClientHeader({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          labelText: 'Buscar empresa',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
