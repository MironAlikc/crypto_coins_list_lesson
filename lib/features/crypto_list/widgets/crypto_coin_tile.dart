import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.asset(
        'assets/bitcoin_logo.png',
        height: 30,
        width: 30,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '200000\$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}