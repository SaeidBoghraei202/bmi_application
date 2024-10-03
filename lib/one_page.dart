import 'package:bmi_application/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool isWoman = true; // به طور پیش‌فرض زن انتخاب شده

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 248),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isWoman = true;
                  }),
                  child: Opacity(
                    opacity: isWoman ? 1.0 : 0.5, // شفافیت بسته به انتخاب
                    child: Container(
                      width: 270,
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Image.asset('images/1.png'),
                            radius: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'جنسیت خود را انتخاب کنید ',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isWoman = false;
                  }),
                  child: Opacity(
                    opacity: isWoman ? 0.5 : 1.0, // شفافیت بسته به انتخاب
                    child: Container(
                      width: 270,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 120,
                            child: Image.asset('images/2.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => second_page(
                            iswoma: isWoman,
                          ),
                        ),
                      ); //
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'برو به صفحه بعد',
                            style: TextStyle(fontSize: 19, color: Colors.black),
                          ),
                          Spacer(),
                          Image.asset('images/3.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
