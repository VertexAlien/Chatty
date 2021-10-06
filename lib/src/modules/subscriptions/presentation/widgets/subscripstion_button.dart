import 'package:flutter/material.dart';
import '../../../../core/export.dart';

class SubscriptionButton extends StatelessWidget {
  SubscriptionButton({
    @required this.monthText,
    @required this.descriptionText,
    @required this.priceText,
    this.onTap,
  });

  final String monthText;
  final String descriptionText;
  final String priceText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppTheme.primaryDarkColor,
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthText,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    descriptionText,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Text(
                priceText,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
