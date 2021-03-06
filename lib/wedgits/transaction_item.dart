import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delet,
  }) : super(key: key);

  final Transactions transaction;
  final Function delet;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding:const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          '${transaction.title}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          '${DateFormat.yMMMd().format(transaction.date)}',
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => delet(transaction.id),
                icon: Icon(Icons.delete),
                label: const Text('Delet'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(
                   Icons.delete,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () => delet(transaction.id),
              ),
      ),
    );
  
}
}