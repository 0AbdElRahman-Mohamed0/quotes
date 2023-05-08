import 'package:flutter/material.dart';
import 'package:quote_learn/core/utils/empty_space_extension.dart';
import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            quote.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          40.ph,
          Text(
            quote.author,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
