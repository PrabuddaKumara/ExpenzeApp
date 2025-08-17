import 'package:demo/services/user_services.dart';
import 'package:demo/util/color.dart';
import 'package:demo/widgets/income_expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //main colum
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.25),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: kMainColor, width: 3),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  "assetsflutter/assets/images/user.jpg",
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("Welcome to Page $username"),
                            Icon(Icons.notifications, color: kMainColor),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            IncomeExpenceChip(
                              title: "Income",
                              amount: 5000,
                              bgColor: kGreen,
                              imageUrl:
                                  "assetsflutter/assets/images/income.png",
                            ),
                            IncomeExpenceChip(
                              title: "Expense",
                              amount: 1200,
                              bgColor: kRed,
                              imageUrl:
                                  "assetsflutter/assets/images/expense.png",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
