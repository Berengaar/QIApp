import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect=
              data["user_answer"]==data["correct_answer"];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,  
                    height: 40,  
                    decoration:  BoxDecoration(
                      color: isCorrect ? Colors.blueAccent : Colors.redAccent,  // Arka plan rengi
                      shape: BoxShape.circle,  // Daire şekli
                    ),
                    alignment: Alignment.center,  // Metni dairenin ortasına hizala
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Your answer: ${data["user_answer"] as String}",
                          style: GoogleFonts.lato(
                            color: Colors.yellowAccent,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Correct answer: ${data["correct_answer"] as String}",
                          style: GoogleFonts.lato(
                            color: Colors.greenAccent,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
