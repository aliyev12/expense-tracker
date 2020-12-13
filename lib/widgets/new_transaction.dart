import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: amountController,
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => addNewTransaction(
                titleController.text,
                double.tryParse(amountController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
