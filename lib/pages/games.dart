import 'package:flutter/material.dart';
import 'package:provider_based_app/providers/game_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  HomePageProvider? homePageProvider;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_context) => HomePageProvider(context: context),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(builder: (context) {
      homePageProvider = context.watch<HomePageProvider>();
      if (homePageProvider?.questions != null) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _deviceHeight! * 0.05,
              ),
              child: _gameUI(),
            ),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _questionText(),
        Column(
          children: [
            _buttonPress(),
            SizedBox(
              height: 10,
            ),
            _buttonPressFalse(),
          ],
        ),
      ],
    );
  }

  Widget _questionText() {
    return Text(homePageProvider!.getCurrentQuestions());
  }

  Widget _buttonPress() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.purple,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: Text(
        'Press',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buttonPressFalse() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: Text(
        'Disable',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}
