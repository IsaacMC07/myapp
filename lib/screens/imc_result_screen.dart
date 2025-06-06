import 'package:flutter/material.dart';
import 'package:myapp/core/app_color.dart';
import 'package:myapp/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text("Resultado", style: TextStyles.bodyText),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tu resultado es:",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32, top: 32),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.backgroundComponent,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        getStatusbyImc(imcResult),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: getColorbyImc(imcResult),
                        ),
                      ),
                      Text(
                        imcResult.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 78,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 20),
                        child: Text(
                          getAdvicebyImc(imcResult),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColor.accent),
                ),
                child: Text(
                  "Volver a la Pantalla Principal",
                  style: TextStyles.bodyText
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorbyImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.lightBlue, //bueno
      < 24.9 => Colors.green, //aceptable
      < 29.9 => Colors.yellow, //sobrepeso
      _ => Colors.red, //obesidad
    };
  }
  
  String getStatusbyImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Bajo peso", //bueno
      < 24.9 => "Aceptable", //aceptable
      < 29.9 => "Sobrepeso", //sobrepeso
      _ => "Obesidad", //obesidad
    };
  }
  
  String getAdvicebyImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Come más seguido, métele proteína y snacks buenos. Tu cuerpo necesita fuel", //bueno
      < 24.9 => "Vas bien, solo mantén el ritmo. Balancea comida y algo de ejercicio suave", //aceptable
      < 29.9 => "Cuidado con las porciones y muévete más. No es drama, pero ya toca cuidarse", //sobrepeso
      _ => "Tiempo de hacer cambios, tranqui pero firmes. Busca ayuda si puedes, no estás solo", //obesidad
    };
  }
}
