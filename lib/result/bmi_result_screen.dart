import 'package:calculator_bmi/sharing/sharing.dart';
import 'package:calculator_bmi/theme/mode_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
  final int weight;

  const BMIResultScreen({
    super.key,
    required this.age,
    required this.result,
    required this.isMale,
    required this.weight,
  });

  String getBMICategory(int bmi) {
    if (bmi < 18.5) {
      return 'نقص في الوزن';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'وزن طبيعي';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'زيادة في الوزن';
    } else if (bmi >= 30 && bmi < 34.9) {
      return 'سمنة من الدرجة الأولى';
    } else if (bmi >= 35 && bmi < 39.9) {
      return 'سمنة من الدرجة الثانية';
    } else {
      return 'سمنة مفرطة (الدرجة الثالثة)';
    }
  }

  String getHealthAdvice(int bmi, int age, int weight) {
    if (age < 18) {
      if (bmi < 18.5) {
        return '''
      ينصح بزيادة تناول الطعام الصحي ومراجعة الطبيب للتأكد من عدم وجود مشاكل صحية.
      ''';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return '''
      تتمتع بوزن صحي. استمر في اتباع نمط حياة صحي وممارسة الرياضة بانتظام.
      ''';
      } else {
        return '''
      ينصح باستشارة الطبيب ومراقبة الوزن.
      ''';
      }
    } else if (age >= 18 && age < 60) {
      if (bmi < 18.5) {
        if (weight < 50) {
          return '''
        وزنك منخفض جداً بالنسبة لعمرك، ينصح بزيادة تناول الطعام الصحي واستشارة الطبيب.
        ''';
        } else {
          return '''
        ينصح بزيادة تناول الطعام الصحي وممارسة الرياضة بانتظام.
        ''';
        }
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return '''
      تتمتع بوزن صحي. استمر في اتباع نمط حياة صحي وممارسة الرياضة بانتظام.
      ''';
      } else if (bmi >= 25 && bmi < 29.9) {
        return '''
      ينصح باتباع نظام غذائي متوازن وممارسة الرياضة بانتظام.
      ''';
      } else if (bmi >= 30 && bmi < 34.9) {
        return '''
      ينصح باستشارة الطبيب واتباع نظام غذائي صحي وممارسة الرياضة.
      ''';
      } else if (bmi >= 35 && bmi < 39.9) {
        return '''
      ينصح باستشارة الطبيب واتباع نظام غذائي صحي وممارسة الرياضة.
      ''';
      } else {
        return '''
      ينصح باستشارة الطبيب بشكل عاجل واتباع نظام غذائي صحي وممارسة الرياضة.
      ''';
      }
    } else {
      if (bmi < 18.5) {
        return '''
      ينصح بزيادة تناول الطعام الصحي واستشارة الطبيب للحفاظ على الصحة.
      ''';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return '''
      تتمتع بوزن صحي. استمر في اتباع نمط حياة صحي وممارسة الرياضة بانتظام.
      ''';
      } else {
        return '''
      ينصح باستشارة الطبيب لمراقبة الوزن والنظام الغذائي.
      ''';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final bmiCategory = getBMICategory(result);
    final healthAdvice = getHealthAdvice(result, age, weight);
    return Scaffold(
      appBar: AppBar(
        leading: const ShareButton(),
        title: const Text(
          " نتيجة صحة جسمك",
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الجنس: ${isMale ? 'ذكر' : 'أنثى'}',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "كتلة الجسم: $result",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "العمر: $age",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "النتيجة: $bmiCategory",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                healthAdvice,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
