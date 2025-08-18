import 'package:demo/models/exeption_category.dart';
import 'package:demo/util/color.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(

            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
            
                        horizontal: 10,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedMethod == 0 ? kRed : kWhite,
                                  borderRadius: BorderRadius.circular(50),
                                ),
            
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 60,
                                    vertical: 10,
                                  ),
                                  child: Text("Expence"),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMethod = 1;
                                });
                              },
            
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedMethod == 0 ? kWhite : kGreen,
                                  borderRadius: BorderRadius.circular(50),
                                ),
            
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 60,
                                    vertical: 10,
                                  ),
                                  child: Text("Income"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2,
                        ),
            
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
            
                          children: [
                            Text(
                              "How Much ?",
                              style: TextStyle(
                                color: kLightGrey.withOpacity(0.8),
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              style: TextStyle(
                                fontSize: 60,
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "0",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: kWhite,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            
                    //data form'
                    Container(
                      height: 300,
                      
                      
            
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.4,
                      ),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Form(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
            
                              items: ExpenseCategory.values.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
