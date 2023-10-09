import 'package:domus/config/size_config.dart';
import 'package:domus/provider/base_view.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => {
        model.generateRandomNumber(),
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: getProportionateScreenHeight(60),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text(
                'Hi, Merjen',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: Body(model: model),
          ),
        );
      },
    );
  }
}
