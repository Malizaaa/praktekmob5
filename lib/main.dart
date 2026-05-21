import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    const ProfilePage(),
    const CalculatorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        backgroundColor: const Color(0xff1E293B),

        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white70,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculator",
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff0F172A),

      body: Center(
        child: Container(

          width: 340,
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(35),

            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [
                Color(0xff1E293B),
                Color(0xff334155),
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 3,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: Colors.cyanAccent,
                    width: 4,
                  ),
                ),

                child: const CircleAvatar(
                  radius: 65,

                  backgroundImage:
                  AssetImage("assets/images/profile.jpeg"),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Rizka Maliza",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sistem Informasi",

                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text(
                  "Mahasiswa Universitas Ahmad Dahlan",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,

                children: [

                  buildIcon(Icons.code, "Coding"),

                  buildIcon(Icons.phone_iphone, "Flutter"),

                  buildIcon(Icons.school, "Student"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, String text) {

    return Column(
      children: [

        Container(

          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: Colors.cyanAccent,
            size: 28,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          text,

          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();

  double hasil = 0;

  void hitung(String operasi) {

    if (angka1.text.isEmpty || angka2.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Input tidak boleh kosong"),
        ),
      );

      return;
    }

    double a = double.parse(angka1.text);
    double b = double.parse(angka2.text);

    setState(() {

      if (operasi == "+") {
        hasil = a + b;
      }

      else if (operasi == "-") {
        hasil = a - b;
      }

      else if (operasi == "x") {
        hasil = a * b;
      }

      else if (operasi == "/") {

        if (b == 0) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tidak bisa dibagi dengan nol"),
            ),
          );

          return;
        }

        hasil = a / b;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xff0F172A),

      appBar: AppBar(
        title: const Text("Kalkulator"),
        backgroundColor: const Color(0xff1E293B),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              TextField(
                controller: angka1,

                keyboardType: TextInputType.number,

                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(

                  labelStyle:
                  const TextStyle(color: Colors.white70),

                  filled: true,

                  fillColor: const Color(0xff1E293B),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: angka2,

                keyboardType: TextInputType.number,

                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(

                  labelStyle:
                  const TextStyle(color: Colors.white70),

                  filled: true,

                  fillColor: const Color(0xff1E293B),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,

                children: [

                  tombol("+"),

                  tombol("-"),

                  tombol("x"),

                  tombol("/"),
                ],
              ),

              const SizedBox(height: 40),

              Container(

                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: const Color(0xff1E293B),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [

                    const Text(
                      "Hasil",

                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      hasil.toString(),

                      style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget tombol(String operasi) {

    return ElevatedButton(

      onPressed: () {
        hitung(operasi);
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyanAccent,
        foregroundColor: Colors.black,

        padding: const EdgeInsets.all(20),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      child: Text(
        operasi,

        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}