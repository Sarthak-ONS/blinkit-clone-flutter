import 'package:flutter/material.dart';

import '../app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyWhiteColor,
      appBar: AppBar(
        leadingWidth: 25,
        automaticallyImplyLeading: true,
        title: const Text("Checkout"),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            children: [
              // Container for Time and Total Items
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: AppColors.primaryGreenColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery in 28 minutes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('7 Items')
                      ],
                    ),
                  ],
                ),
              ), // Container ENDS
              // Products Container STARTS
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 223, 222, 222)),
                                ),
                                child: Image.asset(
                                  "Assets/Products/${index + 1}.png",
                                  height: 70,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amul Milk Toned',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('300gms'),
                                  Text(
                                    '₹ 100',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 105,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                                const Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ), // Products Container ENDS

              // Container for Add Coupons
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 0, 67, 183),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Use Coupons',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
              //Container For Add Coupons Ends
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bill Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    ListView.builder(
                      itemCount: chargeslissst.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(chargeslissst[index]['title']!),
                            Text("₹${chargeslissst[index]['price']!}"),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "₹671",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ordering For Someone else',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'Add a message to be sent as an SMS with your gift.',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: const Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_filled,
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Delivering to Home",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Floor 4, The Star Hotel, New Delhi",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                            color: AppColors.primaryGreenColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Payment Method",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Cash on Delivery",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryGreenColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                        ),
                        child: const Text("Place Order"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const chargeslissst = [
  {"title": "Item Total", "price": "643"},
  {"title": "Delivery Charge", "price": "16"},
  {"title": "Handling Charge", "price": "2"},
  {"title": "Late Night Convenience Charge", "price": "10"},
];
