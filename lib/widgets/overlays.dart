import 'package:flutter/material.dart';

class Dailogbox extends StatefulWidget {
  @override
  State<Dailogbox> createState() => _DailogboxState();
}

class _DailogboxState extends State<Dailogbox> {
  bool isChecked = false;
  var listTypeRadio = ["English", "German", "French", "Hindi"];
  String selecteRadio = "English";
  bool isLightMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlays"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.blueAccent.withOpacity(0.2),
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text("Delete"),
                          content: Text(
                              "Are you sure you want to delete this item?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes")),
                          ],
                        );
                      });
                },
                child: Icon(Icons.delete)),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.blueAccent.withOpacity(0.2),
                      builder: (ctx) {
                        return SimpleDialog(
                          title: Text("Select a Language"),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("English"),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("German"),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("French"),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Hindi"),
                            ),
                          ],
                        );
                      });
                },
                child: Text("Simple dailog")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.blueAccent.withOpacity(0.2),
                      builder: (ctx) {
                        return AboutDialog(
                          applicationVersion: "v1.0",
                          applicationIcon: Icon(Icons.person),
                          applicationName: "OverLays",
                          applicationLegalese: "All rights reserved",
                        );
                      });
                },
                child: Text("About Dailog")),
            ElevatedButton(
                onPressed: () {
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Barrier",
                      pageBuilder: (ctx, _, __) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 21),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 220,
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(),
                                    TextField(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Submit")),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text("Custom Dailog Box")),
            ElevatedButton(
                onPressed: () async {
                  var selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000, 9, 29),
                      lastDate: DateTime(2026, 12, 31));
                  if (selectedDate != null) {
                    print(
                        "selectedDate : ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
                  }
                },
                child: Text("DatePicker")),
            ElevatedButton(
                onPressed: () async {
                  var selectedRangeDate = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000, 9, 29),
                      lastDate: DateTime.now());
                  if (selectedRangeDate != null) {
                    "selectedDate : ${selectedRangeDate.start.day}/${selectedRangeDate.start.month}/${selectedRangeDate.start.year}//${selectedRangeDate.end.day}/${selectedRangeDate.end.month}/${selectedRangeDate.end.year}";
                    print(selectedRangeDate);
                  }
                },
                child: Text("Date Range Picker")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      showCloseIcon: true,
                      action: SnackBarAction(label: "Retry", onPressed: () {}),
                      content: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          Text("  This is a snackbar"),
                        ],
                      )));
                },
                child: Text("Show Snackbar")),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.blueAccent.shade100,
                      enableDrag: false,
                      isDismissible: false,
                      builder: (ctx) {
                        return Container(
                          height: 300,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextField(),
                              SizedBox(
                                width: 20,
                              ),
                              TextField(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Submit")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text("BottomSheet")),
            Checkbox.adaptive(
                splashRadius: 34,
                activeColor: Colors.green,
                checkColor: Colors.yellow,
                value: isChecked,
                onChanged: (value) {
                  isChecked = value!;
                  setState(() {});
                }),
            CheckboxListTile(
              title: Text("Remember Me!"),
              subtitle: Text("Hello"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked,
              onChanged: (value) {
                isChecked = value!;
                setState(() {});
              },
            ),
            Radio.adaptive(
                value: listTypeRadio[0],
                groupValue: selecteRadio,
                onChanged: (value) {
                  selecteRadio = value!;
                  setState(() {});
                }),
            RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text("${listTypeRadio[0]}"),
                value: listTypeRadio[0],
                groupValue: selecteRadio,
                onChanged: (value) {
                  selecteRadio = value!;
                  setState(() {});
                }),
            RadioListTile(
                title: Text("${listTypeRadio[1]}"),
                controlAffinity: ListTileControlAffinity.trailing,
                value: listTypeRadio[1],
                groupValue: selecteRadio,
                onChanged: (value) {
                  selecteRadio = value!;
                  setState(() {});
                }),
            Switch(value: isLightMode, onChanged: (value){
              isLightMode = value;
              setState(() {

              });
            }),
            SwitchListTile(
              activeColor: Colors.amber,
              inactiveThumbColor: Colors.black,
              thumbIcon: MaterialStateProperty.resolveWith((states){
                if(states.contains(MaterialState.selected)){
                  return Icon(Icons.check);
                }else{
                  return Icon(Icons.close);
                }
              }),
              title: Text("Theme Mode"),
                value: isLightMode, onChanged: (value){
              isLightMode = value;
              setState(() {});
            })
          ],
        ),
      ),
    );
  }
}
