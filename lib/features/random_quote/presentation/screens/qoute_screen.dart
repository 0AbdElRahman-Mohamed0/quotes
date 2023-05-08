import 'package:flutter/material.dart';
import 'package:quote_learn/core/utils/app_strings.dart';
import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';
import 'package:quote_learn/features/random_quote/presentation/widgets/quote_card.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        QuoteCard(
          quote: Quote(
              id: 1,
              author: 'Bedo',
              category: 'cat',
              content:
                  'You can do anything that you can imagine, So Just do it no thing is impossible just do it yesterday you said tomorrow.'),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppStrings.appName),
    );
    return Scaffold(
      appBar: appBar,
      body: _buildBody(context),
    );
  }
}
