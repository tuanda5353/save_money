import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Name'),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.addNewTransaction(titleController.text, double.parse(amountController.text));
                Navigator.of(context).pop();
              },
              child: Text("Add transaction"),
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
