import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.indigo,
      fontFamily: 'Nunito',
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Nunito',
        ),
      ),
      appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                headline6: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                ),
              )
              .bodyText2,
          titleTextStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
          // ThemeData.light()
          //     .textTheme
          //     .copyWith(
          //       headline6: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 20,
          //         fontFamily: 'Nunito',
          //       ),
          //     )
          //     .headline6,
          ),
    );
    return MaterialApp(
      title: 'Personal Expenses',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: ctx,
      builder: (bCtx) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                child: Text('CHART here'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
    );
  }
}
