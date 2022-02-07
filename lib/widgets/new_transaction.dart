import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionHandler;
  NewTransaction(this.addTransactionHandler, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTransactionHandler(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text('Add transaction'),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
