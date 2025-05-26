import 'package:capstone/component/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../component/dio.dart';
import '../../component/secure_storage.dart';
import '../../user/login_screen.dart' show LoginScreen;

class SettingMenu extends ConsumerStatefulWidget {
  const SettingMenu({super.key});

  @override
  ConsumerState<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends ConsumerState<SettingMenu> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () async {
      final storage = ref.read(secureStorageProvider);
      await storage.delete(key: ACCESS_TOKEN_KEY);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('로그아웃되었습니다.'),
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
        );
      }
    },
      constraints: const BoxConstraints(minWidth: 50, maxWidth: 150),
      icon: const Icon(Icons.logout, color: Colors.white,),
      iconSize: 30,
    );
  }
}