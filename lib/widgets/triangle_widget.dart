import 'package:flutter/material.dart';

class TriangleWidget extends StatelessWidget {
  const TriangleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(30, 30), painter: DrawTriangleShape());
  }
}

class DrawTriangleShape extends CustomPainter {
  late Paint painter;

  DrawTriangleShape() {
    painter = Paint()
      ..color = const Color.fromRGBO(33, 33, 33, 1)
      ..style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 15);
    path.lineTo(0, size.height);
    path.lineTo(size.height / 0, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint( CustomPainter oldDelegate) {
    return true;
  }
}
