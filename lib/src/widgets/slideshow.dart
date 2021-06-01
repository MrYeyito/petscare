import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SlideShow({
    @required this.slides,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {

            Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
            Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;
            Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
            Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;

            return Column(
              children: <Widget>[
                Expanded(child: _Slides(slides)),
                _Dots(slides.length)
              ],
            );

          }
        )
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final length;

  _Dots(this.length);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (i) => _Dot(i))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);


    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      height: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) ? ssModel.colorPrimario : ssModel.colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageviewController = PageController();

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {

      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageviewController.page;

    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageviewController,
        children: widget.slides.map((child) => _Slide(child)).toList()
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideshowModel with ChangeNotifier {

  double _currentPage = 0;
  Color _colorPrimario;
  Color _colorSecundario;
  double _bulletPrimario;
  double _bulletSecundario;
  String _description;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color colorPrimario) {
    this._colorPrimario = colorPrimario;
    // notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color colorSecundario) {
    this._colorSecundario = colorSecundario;
    // notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }

  String get description => this._description;

  set description(String description) {
    this._description = description;
  }

}
