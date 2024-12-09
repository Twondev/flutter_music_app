import 'package:client/core/providers/current_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //access user data
    final user = ref.watch(currentUserNotifierProvider);
    print(user);
    return Scaffold();
  }
}
