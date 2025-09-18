import 'package:flutter/material.dart';

void main() {
  runApp(Myexpensesplitter());
}

class Myexpensesplitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          "Expense Splitter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on,
                  size: 80,
                ),
                Text("MR TIP\nCALCULATOR",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32))
              ],
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: 400,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Total p/person",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter the total amount",
                        prefixIcon: Icon(Icons.monetization_on),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Bill",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rs.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.cyan),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Total Tip",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rs.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.cyan),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Enter\nyour bill",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    width: 280,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.monetization_on),
                          border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Choose\nyour tip",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.cyanAccent)),
                      child: Text("10%",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 32))),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.cyanAccent)),
                      child: Text("15%",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 32))),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.cyanAccent)),
                      child: Text("20%",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 32))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 95),
              child: SizedBox(
                  height: 80,
                  width: 300,
                  child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.cyanAccent.shade100)),
                      child: Text("10%",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 32)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Split\nthe total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Center(
                    child: IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.cyanAccent)),
                        icon: Icon(Icons.minimize))),
                Text("2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        iconColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.cyanAccent)),
                    icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
