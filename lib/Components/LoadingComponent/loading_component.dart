import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  LoadingComponent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/gif/loading.gif"),
                    scale: 0.25,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
