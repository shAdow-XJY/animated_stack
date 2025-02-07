import '../../lib/animated_stack.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Stack Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: AnimatedStack(
        backgroundColor: const Color(0xff321B4A),
        fabBackgroundColor: const Color(0xffEB456F),
        foregroundWidget: Container(
          decoration: const BoxDecoration(
            color: Color(0xff56377C),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return _ItemPlaceholder();
            },
          ),
        ),
        columnWidget: const Column(
          children: <Widget>[
            _IconTile(
              width: 100,
              height: 60,
              iconData: Icons.share,
            ),
            SizedBox(height: 20),
            _IconTile(
              width: 60,
              height: 60,
              iconData: Icons.image,
            ),
            SizedBox(height: 20),
            _IconTile(
              width: 60,
              height: 60,
              iconData: Icons.camera_alt,
            ),
          ],
        ),
        bottomWidget: Container(
          decoration: const BoxDecoration(
            color: Color(0xff645478),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          width: 260,
          height: 50,
        ),
        onChanged: (bool isOpened) {  },
      ),
    );
  }
}

class _IconTile extends StatelessWidget {
  final double width;
  final double height;
  final IconData iconData;

  const _IconTile(
      {Key? key,
      required this.width,
      required this.height,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff645478),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Icon(
        iconData,
        color: const Color(0xffAEA6B6),
      ),
    );
  }
}

class _ItemPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Container(
              width: 60,
              height: 60,
              color: const Color(0xff9783A9),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xff6D528D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      child: const _RowPlaceholder(color: 0xffA597B4),
                    ),
                    const _RowPlaceholder(color: 0xff846CA1),
                    const _RowPlaceholder(color: 0xff846CA1),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RowPlaceholder extends StatelessWidget {
  final int color;

  const _RowPlaceholder({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
