import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folkatechtest/utils/routes/routes.dart';
import 'package:folkatechtest/utils/routes/routes_name.dart';
import 'package:folkatechtest/view_model/menu_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.menuPage,
          onGenerateRoute: Routes.generateRoute,
        ),
      );
}
