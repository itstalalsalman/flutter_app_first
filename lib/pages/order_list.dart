import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: FoodOrderList(),
      ),
    );
  }
}

class FoodOrder {
  final String restaurantName;
  final String orderStatus;
  final String orderDate;
  final String orderTime;
  final String personName;
  final String restaurantAddress;

  FoodOrder({
    required this.restaurantName,
    required this.orderStatus,
    required this.orderDate,
    required this.orderTime,
    required this.personName,
    required this.restaurantAddress,
  });
}

class FoodOrderList extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _FoodOrderListState createState() => _FoodOrderListState();
}

class _FoodOrderListState extends State<FoodOrderList> {
  List<FoodOrder> foodOrders = []; // Initially empty
  double _refreshPadding = 0.0;

  Future<void> _refreshOrders() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  
    // Backend Integration with Firebase 
    //    FirebaseFirestore.instance.collection('orders');

    // 2. QuerySnapshot querySnapshot = await ordersCollection.get();

    // 3. Convert Firestore documents into FoodOrder objects
    //    List<FoodOrder> updatedOrders = querySnapshot.docs.map((doc) {
    //      return FoodOrder(
    //        restaurantName: doc['restaurantName'],
    //        // ...other fields to be updated
    //      );
    //    }).toList();

    // 4. Updating the UI by managing the state
    //    setState(() {
    //      foodOrders = updatedOrders;
    //    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData(); // For initially populating the foodOrders list
  }

  // Function to load initial data (replace with Firebase logic later)
  void _loadInitialData() {
    setState(() {
      foodOrders = [
        FoodOrder(
          restaurantName: "Antakya Durum",
          orderStatus: "Preparing",
          orderDate: "2023-02-01",
          orderTime: "18:30",
          personName: "Roshan Jafry",
          restaurantAddress: "Esat Caddesi, Ankara",
        ),
        FoodOrder(
          restaurantName: "KFC",
          orderStatus: "Delivered",
          orderDate: "2024-01-27",
          orderTime: "18:30",
          personName: "Talal Salman Zafeer",
          restaurantAddress: "Kizilay, Ankara, Cankaya",
        ),
        FoodOrder(
          restaurantName: "Quick China",
          orderStatus: "Cancelled",
          orderDate: "2024-01-25",
          orderTime: "18:30",
          personName: "Ali Shahid",
          restaurantAddress: "Gaziomanpasa, Ankara",
        ),
        FoodOrder(
          restaurantName: "McDonalds",
          orderStatus: "Delivered",
          orderDate: "2024-01-25",
          orderTime: "18:30",
          personName: "Ali Shahid",
          restaurantAddress: "Gaziomanpasa, Ankara",
        ),
        FoodOrder(
          restaurantName: "KFC",
          orderStatus: "Delivered",
          orderDate: "2024-01-27",
          orderTime: "18:30",
          personName: "Talal Salman Zafeer",
          restaurantAddress: "Kizilay, Ankara, Cankaya",
        ),
        FoodOrder(
          restaurantName: "Antakya Durum",
          orderStatus: "Preparing",
          orderDate: "2023-02-01",
          orderTime: "18:30",
          personName: "Roshan Jafry",
          restaurantAddress: "Esat Caddesi, Ankara",
        ),
        FoodOrder(
          restaurantName: "KFC",
          orderStatus: "Cancelled",
          orderDate: "2024-01-27",
          orderTime: "18:30",
          personName: "Talal Salman Zafeer",
          restaurantAddress: "Kizilay, Ankara, Cankaya",
        ),
        FoodOrder(
          restaurantName: "Antakya Durum",
          orderStatus: "Preparing",
          orderDate: "2023-02-01",
          orderTime: "18:30",
          personName: "Roshan Jafry",
          restaurantAddress: "Esat Caddesi, Ankara",
        ),
      ];

    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      
      onRefresh: _refreshOrders,
      backgroundColor: Colors.orange,
      color: Colors.white,
      // Track pull progress !** the notification predicate was enable to as allow the padding space on pull down but only ios have it built through another library
      notificationPredicate: (notification) {
        if (notification is ScrollStartNotification) {
          setState(() {
            _refreshPadding = 0.0; // Reset padding when starting a refresh
          });
        } else if (notification is ScrollUpdateNotification) {
          setState(() {
            _refreshPadding = notification.metrics.extentBefore.clamp(0, 80);
          }); // Clamp the padding to a maximum value (e.g., 80)
        } else if (notification is ScrollEndNotification) {
          setState(() {
            _refreshPadding = 0.0; // Reset padding when it ends
          });
        }
        return true; 
      },
      child: ListView.builder(
        // Apply the dynamic padding
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: _refreshPadding), 
        itemCount: foodOrders.length,
        itemBuilder: (context, index) {
          return FoodOrderContainer(foodOrder: foodOrders[index]);
        },
      ),
    );
  }
}

class FoodOrderContainer extends StatelessWidget {
  final FoodOrder foodOrder;

  const FoodOrderContainer({super.key, required this.foodOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0), // Setting margin outside the card here by initiating a container
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    foodOrder.restaurantName,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        foodOrder.orderStatus,
                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                      if (foodOrder.orderStatus == "Delivered")
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ) ,
                      if(foodOrder.orderStatus == "Preparing")
                        const Icon(
                            Icons.access_time,
                            color: Colors.yellow,
                          ) ,
                      if(foodOrder.orderStatus == "Cancelled") 
                        const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                    ]
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    foodOrder.orderDate,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    foodOrder.orderTime,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    foodOrder.personName,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    foodOrder.restaurantAddress,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
