import 'package:flutter/material.dart';
typedef IntroModalWidgetBuilder = Widget Function(
    BuildContext context,
    Function? close,
    );

class IntroModal extends StatefulWidget {
  final IntroModalWidgetBuilder? introModalWidgetBuilder;
  const IntroModal({super.key,required this.introModalWidgetBuilder});

  @override
  State<IntroModal> createState() => _IntroModalState();
}

class _IntroModalState extends State<IntroModal> {
  bool showIntroModal = true;
  @override
  Widget build(BuildContext context) {
      return showIntroModal && widget.introModalWidgetBuilder != null
          ? Stack(children: [
        const Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          left: 0,
          child: Material(
            type: MaterialType.canvas,
            color: Color.fromARGB(128, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: ClipRect(),
          ),
        ),
        widget.introModalWidgetBuilder!(context, () {
          if (mounted) {
            setState(() {
              showIntroModal = false;
            });
          }
        })
      ])
          : Container();
  }
}
