import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/crud/presentation/cubit/customer_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/features/crud/presentation/pages/add_edit_customer.dart';
import 'features/crud/presentation/pages/customers_home_page.dart';
import 'injection.dart';

Future<void> main() async {
  await Hive.initFlutter();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider<CustomerCubit>.value(
                  value: locator<CustomerCubit>(),
                )
              ],
              child: CustomersHomePage(),
            ),
        '/add_edit_page': (context) => AddEditCustomerPage(),
      },
      initialRoute: '/home',
    );
  }
}
