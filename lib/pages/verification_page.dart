import 'package:flutter/material.dart';
import 'order_page.dart'; // Import OrderPage if it's in a separate file

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final phoneNumberController = TextEditingController();

  void goToOrdersPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrdersPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Image.asset('lib/images/LOGO.jpg', width: 200,), // Replace with your image paths
            const SizedBox(height: 50),
            Image.asset('lib/images/kitchen.png', width: 280,),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 40.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tencere Aşçı\'ya Hoşgeldin',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Kayıt ol ve Sipariş Al!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit, enim non bibendum cursus, nunc loremtristique leo, quis fermentum tortor arcu non ipsum.'
                  , style: TextStyle(fontSize: 11, fontFamily: 'Poppins', height: 2,),
                  textAlign: TextAlign.left,),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goToOrdersPage,
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,  // Set background color to orange
              foregroundColor: Colors.white, 
              minimumSize: const Size(300, 50),  // Set foreground/text color to white
              ),
            child: const Text('Başla!', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}