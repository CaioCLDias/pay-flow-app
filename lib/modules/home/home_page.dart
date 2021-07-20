import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/themes/appcolors.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controler = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: 'Caio', style: TextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text('Mantenha as suas contas em dia',
                  style: TextStyles.captionShape),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controler.currentPage],
      bottomNavigationBar: Container(
          height: 90,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  controler.setPage(0);
                  setState(() {});
                },
                icon: Icon(Icons.home),
                color: AppColors.primary),
            GestureDetector(
              onTap: () {
                print('Clcou');
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  controler.setPage(1);
                  setState(() {});
                },
                icon: Icon(Icons.description_outlined),
                color: AppColors.body),
          ])),
    );
  }
}
