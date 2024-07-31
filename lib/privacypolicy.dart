import 'package:flutter/material.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                '1. Introduction\n'
                    'We value your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our app.\n\n'
                    '2. Information We Collect\n'
                    'We collect information that you provide directly, such as your name, email address, and payment information. We also collect data about your interactions with our app, including usage data and device information.\n\n'
                    '3. How We Use Your Information\n'
                    'We use your information to provide, maintain, and improve our services. This includes processing transactions, personalizing content, and communicating with you.\n\n'
                    '4. Sharing Your Information\n'
                    'We do not sell or rent your personal data to third parties. We may share your information with service providers who assist us in operating our app or as required by law.\n\n'
                    '5. Security\n'
                    'We implement security measures to protect your information. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.\n\n'
                    '6. Your Rights\n'
                    'You have the right to access, correct, or delete your personal data. You may also object to or restrict the processing of your data.\n\n'
                    '7. Changes to This Policy\n'
                    'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.\n\n'
                    '8. Contact Us\n'
                    'If you have any questions about this Privacy Policy, please contact us at [Your Contact Information].\n\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
