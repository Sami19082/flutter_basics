import 'dart:io';

void main() {
  List<Map<String, dynamic>> employeeDetails = [
    {
      "name": "Varun",
      "address": "Kharagpur",
      "skills": [
        "Flutter Developer",
        "Android developer",
        "excel",
        "python",
        "css+"
            "javascript"
      ],
      "Qualification": {
        "B.Tech": 75,
        "M.Tech": 70,
        "MCA": 65,
        "BCA": 60,
      },
      "Hobbies": [
        "cycling",
        {"45 min", "15min", "10min"},
        "reading",
        {"80 min", "72 min", "17 min"},
        "playing",
        {"50 min", "2 min", "187 min"},
        "listening",
        {"20 min", "8 min", "19 min"},
      ]
    },
    {
      "name": "Remit",
      "address": "DELHI",
      "skills": {
        "UI&UX Designer",
        "FIGMA",
        "HARDWARE",
        "CONTENT WRITER",
      },
      "Qualification": {
        "c.Tech": 765,
        "d.Tech": 40,
        "pCA": 95,
        "cCA": 80,
      },
      "Hobbies": {
        "FIGHT",
        "reading",
        "GAMBLE",
        "RUN",
      }
    },
    {
      "name": "SAMID",
      "address": "JAIPUR",
      "skills": {
        "Flutter Developer",
        "Android developer",
        "DIGITAL MARKETING",
        "SEO",
        "VFX"
      },
      "Qualification": {
        "R.Tech": 15,
        "M.Tech": 20,
        "MCA": 35,
        "NCA": 50,
      },
      "Hobbies": {
        "BIKES",
        "GUITAR",
        "TRAVEL",
        "SLEEPING",
      }
    }
  ];

  List<String> machaineLearning = [
    'Machine Learning',
    "Deep Learning",
    "Computer Vision",
    "Natural Language Processing",
    "Reinforcement Learning",
    "Unsupervised Learning",
    "Supervised Learning",
    "Data Mining",
    "Data Science",
    "Data Analysis",
  ];

  employeeDetails.forEach((element) {
    print(element);
  });

  for (Map<String, dynamic> element in employeeDetails) {
    String name = element["name"];
    String address = element["address"];
    print("Name: $name,Address: $address");
  }

//for each both

  for (String elements in machaineLearning) {
    print(elements);
  }

  for (int i = 0; i < employeeDetails.length; i++) {
    print(employeeDetails[i]["Qualification"]['M.Tech']);
  }

  ////operations on collection shortcut

  print(employeeDetails.length);
  print(employeeDetails.first);
  print(employeeDetails.last);
  print(employeeDetails.isEmpty);
  print(employeeDetails.isNotEmpty);
  print(employeeDetails.asMap());
  print(employeeDetails.reversed);
  print(employeeDetails.toList());
  print(employeeDetails.toSet());
  print(employeeDetails.toSet().toList());
  print(machaineLearning.contains("Machine Learning"));

//////////////////// add remove etc

  employeeDetails.add({"name": " sagar"});
  print(employeeDetails);
  employeeDetails.remove({"Hobbies": "playing"});
  print(employeeDetails);
  machaineLearning.insert(1, "element");
  print(machaineLearning);
  machaineLearning.removeAt(1);
  print(machaineLearning);
  machaineLearning.remove("Machine Learning");
  print(machaineLearning);
  // machaineLearning.insertAll(3,machaineLearning);

  //////////////remove
  machaineLearning.removeAt(1);
  print(machaineLearning);
  machaineLearning.removeWhere((element) => element == "Machine Learning");
  print(machaineLearning);
  machaineLearning.removeRange(0, 1);
  print(machaineLearning);
  machaineLearning.removeLast();
  print(machaineLearning);
}
