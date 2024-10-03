import 'package:bmi_application/one_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmi_page extends StatefulWidget {
  bmi_page({super.key, required this.weight, required this.height});
  double weight;
  double height;

  @override
  State<bmi_page> createState() => _bmi_pageState();
}

class _bmi_pageState extends State<bmi_page> {
  @override
  Widget build(BuildContext context) {
    double heightInMeters = widget.height / 100;
    double bmi = calculateBMI(widget.weight, heightInMeters);
    String bmiCategory = getBMICategory(bmi);
    String idealWeight = getIdealWeightRange(heightInMeters);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        backgroundColor: Colors.indigo[80],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                ),
                Container(
                  width: 300,
                  height: 300,
                  child: Image.asset('images/4.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Container(
                    width: 360,
                    height: 300,
                    color: const Color.fromARGB(255, 16, 91, 252),
                    child: Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Column(
                        children: [
                          Text(
                            'شاخص توده بدن   :  ${bmi.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'وضعیت بدنی   =    $bmiCategory',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'وزن ایده‌آل شما  :   $idealWeight',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(230, 40),
                    side: BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bmi(),
                      ),
                    );
                  },
                  child: Text(
                    '! محاسبه مجدد  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  String getBMICategory(double bmi) {
    const double underweightLimit = 18.5;
    const double normalWeightLimit = 24.9;
    const double overweightLimit = 29.9;

    return (bmi < underweightLimit)
        ? 'لاغر'
        : (bmi <= normalWeightLimit)
            ? 'نرمال'
            : (bmi <= overweightLimit)
                ? 'اضافه وزن'
                : 'چاق';
  }

  String getIdealWeightRange(double height) {
    double minBMI = 18.5;
    double maxBMI = 24.9;
    double minWeight = minBMI * (height * height); // کمترین وزن نرمال
    double maxWeight = maxBMI * (height * height); // بیشترین وزن نرمال

    return '${minWeight.toStringAsFixed(2)} تا ${maxWeight.toStringAsFixed(2)} کیلوگرم';
  }
}
