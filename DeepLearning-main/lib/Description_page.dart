import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hi ..',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Let\'s keep your skin healthy.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Home_Page_skin.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Diagnosis of skin cancer - what happens next?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Early diagnosis of skin cancer is essential as it greatly increases the chances of successful treatment and full recovery. '
                      'Detecting the disease early allows simpler, quicker, and less invasive treatments, reducing the need for complex surgeries or aggressive therapies like chemotherapy. '
                      'It prevents serious complications, such as metastasis—when cancer spreads to other organs—which can be life-threatening. '
                      'Additionally, an early diagnosis significantly lowers medical expenses and minimizes psychological stress for patients and their families. '
                      'Finally, promoting early detection raises awareness about sun protection, encouraging preventive behaviors and regular medical check-ups.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Previous Diagnoses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _previousDiagnosisCard(
            'Chicken Pox',
            'Varicella zoster',
            'Rear, seburn, redness',
            'Sunday, 3 Aug 2023 | 15:00',
          ),
          _previousDiagnosisCard(
            'Chicken Pox',
            'Varicella zoster',
            'Rear, seburn, redness',
            'Sunday, 5 Aug 2023 | 10:00',
          ),
          _previousDiagnosisCard(
            'Common Warts',
            'Verruca vulgaris',
            'Dark, bumps on skin',
            'Monday, 7 Aug 2023 | 18:00',
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Card builder method
  static Widget _previousDiagnosisCard(
      String diagnosis, String disease, String description, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/previous_diagnosis_image.png'),
          ),
          title: Text(diagnosis, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(disease, style: TextStyle(color: Colors.black54)),
              Text(description, style: TextStyle(color: Colors.black54)),
              Text(date, style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
