import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';

import '../../../../core/consts/constants.dart';

class CustomerItem extends StatelessWidget {
  CustomerItem({
    Key? key,
    required this.customerEntity,
  }) : super(key: key);

  CustomerEntity customerEntity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            borderRadius: BorderRadius.circular(Constants.borderRadius),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.borderRadius),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${customerEntity.firstName}  ${customerEntity.lastName}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
