import 'package:flutter/material.dart';

class AddCustomerFloatingActionButton extends StatelessWidget {
  const AddCustomerFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: '1',
      onPressed: () {
        Navigator.pushNamed(context, '/add_edit_page');
      },
      backgroundColor: Colors.grey.withOpacity(0.2),
      elevation: 0,
      child: const Icon(
        Icons.add,
        color: Color.fromRGBO(22, 190, 105, 1),
        size: 30,
      ),
    );
  }
}
