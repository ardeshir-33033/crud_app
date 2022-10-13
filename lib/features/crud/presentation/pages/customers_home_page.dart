import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';
import 'package:mc_crud_test/features/crud/presentation/cubit/customer_cubit.dart';
import 'package:mc_crud_test/features/crud/presentation/widgets/custom_loading.dart';
import 'package:mc_crud_test/features/crud/presentation/widgets/customer_item.dart';

import '../widgets/add_customer_button.dart';

class CustomersHomePage extends StatelessWidget {
  CustomersHomePage({Key? key}) : super(key: key);

  List<CustomerEntity> customer = [
    CustomerEntity(
      firstName: "firstname",
      lastName: "lastname",
      dateOfBirth: DateTime.parse("2022-10-12"),
      phoneNumber: "09373555973",
      email: "test@gmail.com",
      bankAccountNumber: "12356421356541",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddCustomerFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            BlocConsumer<CustomerCubit, CustomerState>(
                listener: (context, state) {
              if (state is CustomerError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            }, builder: (context, state) {
              if (state is CustomerLoading) {
                return const Center(child: CustomLoadingAnimation());
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                        itemCount: customer.length,
                        itemBuilder: (context, int index) {
                          return CustomerItem(customerEntity: customer[index]);
                        }),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
