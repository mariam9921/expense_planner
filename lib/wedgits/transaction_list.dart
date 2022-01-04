import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../wedgits/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function delet;
  TransactionList(this.transactions, this.delet);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constrains) {
                return Column(
                  children: [
                    Text(
                      'No Transactions Add!!!!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: constrains.maxHeight * .5,
                      child: Image.asset(
                        'lib/assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (contex, index) {
                return TransactionItem(
                  transaction: transactions[index],
                  delet: delet,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
