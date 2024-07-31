import 'package:flutter/material.dart';
class Term extends StatelessWidget {
  const Term({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the Music App"),
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
              Text('1. Acceptance\n'
                  'By using our Service, you accept these Terms. We may update them occasionally, and your continued use means you accept the changes.\n\n'
                  '2. Eligibility\n'
                  'You must be at least 13 years old. If you\'re under 18, you need parental consent.\n\n'
                  '3. Account\n'
                  'You may need an account to access certain features. Keep your login details confidential and let us know if there\'s any unauthorized use of your account.\n\n'
                  '4. Subscription\n'
                  'We offer different subscription plans. Check our website or app for details. By subscribing, you agree to pay the fees and follow the plan’s terms.\n\n'
                  '5. Content\n'
                  'All content is for personal use only. You can\'t copy, distribute, or reproduce it without permission.\n\n'
                  '6. User Content\n'
                  'You own the content you upload but grant us a license to use it with the Service.\n\n'
                  '7. Prohibited Use\n'
                  'Don’t use the Service for illegal activities or disrupt its operations. Don’t try to access it without authorization or impersonate others.\n\n'
                  '8. Disclaimers\n'
                  'The Service is provided as-is, without warranties. We aren’t responsible for any issues related to its use or third-party content.\n\n'
                  '9. Contact\n'
                  'For questions or issues, contact us at ali@gmail.com.\n\n',
                ),

            ],
          ),
        ),
      ),
    );
  }
}
