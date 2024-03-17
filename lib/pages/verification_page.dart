import 'package:flutter/material.dart';
import 'order_page.dart'; // Import OrderPage if it's in a separate file
import 'package:visibility_detector/visibility_detector.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> with SingleTickerProviderStateMixin {
  final phoneNumberController = TextEditingController();

  void goToOrdersPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrdersPage()));
  }

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController( 
      duration: const Duration(milliseconds: 1000),
      vsync: this, 
    );

    // Initialize animations here 
    _slideAnimation = Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero)
        .animate(_animationController);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Image.asset('lib/images/LOGO.jpg', width: 150,), // Replace with your image paths
            const SizedBox(height: 25),
            Image.asset('lib/images/kitchen.png', width: 270,),
            const SizedBox(height: 20),
            VisibilityDetector(
              key: UniqueKey(), // Unique key to trigger animation correctly
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.2) { // Trigger when 20% visible
                  _animationController.forward();
                }
              },
              child: SlideTransition( 
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 10.0),
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
                        SizedBox(height: 5),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit, enim non bibendum cursus, nunc loremtristique leo, quis fermentum tortor arcu non ipsum.'
                        , style: TextStyle(fontSize: 12, fontFamily: 'Poppins', height: 2,),
                        textAlign: TextAlign.left,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
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