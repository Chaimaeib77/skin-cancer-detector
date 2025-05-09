import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DiagnosisResultPage extends StatelessWidget {
  final String imagePath;
  const DiagnosisResultPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final Map<String, double> cancerProbabilities = {
      'Actinic Keratosis': 70,
      'Basal Cell Carcinoma': 45,
      'Dermatofibroma': 30,
      'Melanoma': 85,
      'Nevus': 20,
      'Pigmented Benign Keratosis': 15,
      'Seborrheic Keratosis': 40,
      'Squamous Cell Carcinoma': 60,
      'Vascular Lesion': 10,
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Your skin report")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Image.file(File(imagePath), height: 220),
            const SizedBox(height: 16),
            const Text("Skin test results",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("AI analysis of skin cancer risk"),
            const SizedBox(height: 20),

            // Score global
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _scoreBox("Score", "90%"),
                _scoreBox("Date", "20 Apr 2025"),
              ],
            ),
            const SizedBox(height: 20),

            // Diagramme circulaire
            const Text("Skin test statistics",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: PieChart(
                PieChartData(
                  sections: cancerProbabilities.entries.map((e) {
                    return PieChartSectionData(
                      value: e.value,
                      title: '${e.value.toInt()}%',
                      radius: 40,
                      titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Liste des cancers
            ...cancerProbabilities.entries.map((e) => ListTile(
                  leading: const Icon(Icons.circle, size: 10),
                  title: Text(e.key),
                  trailing: Text("${e.value.toInt()}%"),
                )),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Repeat"),
            )
          ],
        ),
      ),
    );
  }

  Widget _scoreBox(String label, String value) {
    return Container(
      width: 130,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
