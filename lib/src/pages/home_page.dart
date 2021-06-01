import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:pets_care_two/src/widgets/slideshow.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[


            Expanded(
              child: _MySlideShow(),
            ),

            Container(
              width: 140,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {

                  Navigator.pushReplacementNamed(context, 'user-register');

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Empezar',
                      style: GoogleFonts.indieFlower(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                    )),
                    Icon(
                      Icons.send,
                      color: Colors.white70,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 50,
            )


          ],
        ),
      )
   );
  }
}

class _MySlideShow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _Description('Conoce dietas adecuadas!'),

        Expanded(
          child: SlideShow(
            colorPrimario: Theme.of(context).primaryColor,
            bulletPrimario: 13,
            bulletSecundario: 10,
            // colorSecundario: Colors.grey,
            slides: <Widget>[
              SvgPicture.asset('assets/svg/1.svg'),
              SvgPicture.asset('assets/svg/2.svg'),
              SvgPicture.asset('assets/svg/3.svg'),
              SvgPicture.asset('assets/svg/4.svg'),
              SvgPicture.asset('assets/svg/5.svg'),
              SvgPicture.asset('assets/svg/6.svg'),
            ],
          ),
        ),

      ],
    );
  }
}

class _Description extends StatelessWidget {

  final String description;

  _Description(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // decoration: BoxDecoration(color: Colors.pinkAccent),
      child: Center(
        child: Text('$description', style: GoogleFonts.indieFlower(
          fontSize: 30,
          color: Colors.grey
        ))
      ),
    );
  }
}