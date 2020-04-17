import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTxHandler() {
    var inputTitle = titleController.text;
    var inputAmount = double.parse(amountController.text);

    if (inputTitle == '' || inputAmount < 0.0) {
      return;
    }
    widget.addTx(
      inputTitle,
      inputAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) {
                addTxHandler();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                addTxHandler();
              },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: addTxHandler,
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
