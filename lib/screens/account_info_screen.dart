import 'package:flutter/material.dart';

import 'package:alibaba/widgets/account_info_app_bar.dart';
import 'package:alibaba/widgets/travelers_list.dart';
import 'package:alibaba/widgets/account_info_item.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountInfoScreenState();
  }
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AccountInfoAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const AccountInfoItem(
                        label: 'سفرهای من',
                        icon: Icons.luggage_outlined,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const AccountInfoItem(
                        label: 'سوابق تراکنش ها',
                        icon: Icons.format_list_bulleted_outlined,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const AccountInfoItem(
                        label: 'شارژ اعتبار',
                        icon: Icons.account_balance_wallet_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
