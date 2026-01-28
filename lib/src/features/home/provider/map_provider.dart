import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/pages/map.dart';
import 'package:qr_pay_app/src/features/home/vm/map_vm.dart';

class MapProvider extends StatelessWidget {
  const MapProvider({
    super.key,
    required this.lat,
    required this.lng,
  });
  final String lat;
  final String lng;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => MapVm(context: context, lat: lat, lng: lng),
        child: Consumer<MapVm>(
          builder: (_, value, child) => MapPage(viewModel: value),
        ),
      );
}
