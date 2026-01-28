import 'package:qr_pay_app/src/features/profile/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class ProfileProvider extends StatelessWidget {
  const ProfileProvider({super.key});

  @override
  Widget build(BuildContext context) => Consumer<ProfileVm>(
      builder: (_, value, child) => ProfilePage(viewModel: value));
}
