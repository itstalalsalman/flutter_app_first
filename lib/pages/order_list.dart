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

class FoodOrderList extends StatelessWidget {
  final List<FoodOrder> foodOrders = [
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodOrders.length,
      itemBuilder: (context, index) {
        return FoodOrderContainer(foodOrder: foodOrders[index]);
      },
    );
  }
}

class FoodOrderContainer extends StatelessWidget {
  final FoodOrder foodOrder;

  FoodOrderContainer({required this.foodOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0), // Setting margin outside the card here by initiating a container
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
                    "${foodOrder.restaurantName}",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "${foodOrder.orderStatus}",
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                      if (foodOrder.orderStatus == "Delivered")
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ) ,
                      if(foodOrder.orderStatus == "Preparing")
                        Icon(
                            Icons.access_time,
                            color: Colors.yellow,
                          ) ,
                      if(foodOrder.orderStatus == "Cancelled") 
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                    ]
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${foodOrder.orderDate}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "${foodOrder.orderTime}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${foodOrder.personName}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "${foodOrder.restaurantAddress}",
                    style: TextStyle(fontSize: 16.0),
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
