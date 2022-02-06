import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'BeamNG.drive',
      amount: 549,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Playseat challenge',
      amount: 10500,
      date: DateTime.now(),
    ),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                child: Text('CHART here'),
                elevation: 5,
              ),
            ),
            Card(
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
                      onPressed: () {},
                      child: const Text('Add transactions'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.blueGrey[900]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '₱${transaction.amount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87),
                            ),
                            Text(
                              DateFormat('EEE, M/d/y').format(transaction.date),
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
