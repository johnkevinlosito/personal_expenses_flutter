import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionHandler;
  NewTransaction(this.addTransactionHandler, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    addTransactionHandler(
      title,
      amount,
    );
  }

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
              textInputAction: TextInputAction.next,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            TextButton(
              onPressed: _submitData,
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
