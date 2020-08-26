import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

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
                addNewTransaction(
                    titleController.text, double.parse(amountController.text));
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
