// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_pay_app/src/features/home/logic/models/responses/city_model.dart';
// import 'package:qr_pay_app/src/features/home/pages/coffee_shops.dart';
// import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';

// class BonusProvider extends StatelessWidget {
//   const BonusProvider({
//     super.key,
//     required this.id,
//     required this.cityes,
//     required this.city,
//   });
//   final int id;
//   final List<CityDatum> cityes;
//   final CityDatum? city;

//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (_) => BonusVm(
//           context: _,
//           id: id,
//           cityes: cityes,
//           city: city,
//         ),
//         child: Consumer<BonusVm>(
//           builder: (_, value, child) => CoffeeShopsPage(viewModel: value),
//         ),
//       );
// }
