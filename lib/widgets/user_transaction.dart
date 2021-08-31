// @dart=2.9
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  //const TransactionList({ Key? key }) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 's1',
      title: 'buy shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 's2',
      title: 'buy clothes',
      amount: 39.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      amount: amount,
      title: title,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
