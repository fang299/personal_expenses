// @dart=2.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //const NewTransaction({ Key? key }) : super(key: key);

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var pickedDate;

  void submit() {
    final checkTitle = titleController.text;
    final checkAmount = double.parse(amountController.text);

    if (checkAmount <= 0 || checkTitle.isEmpty || pickedDate == null) {
      return;
    }

    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
      pickedDate,
    );

    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submit(),
              //onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
              //onChanged: (val) {
              //  amountInput = val;
              //},
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(pickedDate == null
                        ? 'No picked date'
                        : 'You picked ${DateFormat.yMd().format(pickedDate)}'),
                  ),
                  TextButton(
                    child: Text('Pick a date'),
                    onPressed: datePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submit,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
