import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/Input/search_field.dart';

import '../CustomButton/account_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SearchField(),
          AccountButton()
        ],
      ),
    );
  }

}