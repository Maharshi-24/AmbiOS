// my_container.dart
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String containerName;
  final Widget logo;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? logoPadding;
  final double? textSize;
  final Widget nextPage;

  const MyContainer({
    super.key,
    required this.containerName,
    required this.logo,
    required this.nextPage,
    this.width,
    this.height,
    this.margin,
    this.logoPadding,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: logoPadding ?? const EdgeInsets.all(20),
                child: FittedBox(
                  child: logo,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  containerName,
                  style: TextStyle(fontSize: textSize ?? 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}