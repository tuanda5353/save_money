import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Name'),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(_selectedDate==null?"No date chosen!": 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                widget.addNewTransaction(_titleController.text,
                    double.parse(_amountController.text),_selectedDate);
                Navigator.of(context).pop();
              },
              color: Theme.of(context).primaryColor,
              child: Text("Add transaction"),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
