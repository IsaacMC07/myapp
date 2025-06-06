import 'package:flutter/material.dart';
import 'package:myapp/components/gender_selector.dart';
import 'package:myapp/components/height_selector.dart';
import 'package:myapp/components/number_selector.dart';
import 'package:myapp/core/app_color.dart';
import 'package:myapp/core/text_styles.dart';
import 'package:myapp/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;
  double selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: NumberSelector(
                    title: "PESO",
                    value: selectedWeight,
                    onIncrement: () {
                      setState(() {
                        selectedWeight++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedWeight--;
                      });
                    },
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: NumberSelector(
                    value: selectedAge,
                    title: "EDAD",
                    onIncrement: () {
                      setState(() {
                        selectedAge++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedAge--;
                      });
                    },
                  ),
                ),
              ), //Expanded(child: NumberSelector(title: "EDAD")),
            ],
          ),
        ),
        Spacer(),
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:638178343.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ImcResultScreen(
                    height: selectedHeight,
                    weight: selectedWeight,
                  )
                )
                );
              },

              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.primary),
              ),
              child: Text("Calcular!", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
