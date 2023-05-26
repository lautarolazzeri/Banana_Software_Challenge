import 'package:app/constants/constants.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        context: context,
        delegate: SearchDelegateProducts(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xAC9E9E9E),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.search,
              color: appColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Buscar producto',
              style: TextStyle(color: Color(0xFF7E7D7D)),
            ),
          ],
        ),
      ),
    );
  }
}
