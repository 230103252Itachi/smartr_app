import 'package:flutter/material.dart';
import 'jobs_list_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF12AA73), Color(0xFF135B46)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Transform.translate(
              offset: const Offset(0, -30),
              child: Center(
                child: Image.asset(
                  "assets/images/smartr.png",
                  width: 130,
                  height: 130,
                ),
              ),
            ),
            const Spacer(),

            Transform.translate(
              offset: const Offset(0, -60),
              child: ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 211,
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: Offset(11, 30),
                      child: Transform.scale(
                        scale: 1.6,
                        child: Image.asset(
                          "assets/images/profile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Transform.translate(
              offset: const Offset(0, -60),
              child: Text(
                "Fresh look, same login.",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF4F4F4),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Transform.translate(
              offset: const Offset(0, -60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.swap_vert, color: Colors.white, size: 33),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            "SmartRecruiters\ncandidate portal\nis now Smartr.",
                            style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.login, color: Colors.white, size: 33),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          "Enter the same login\ninfo used for your\nSmartrProfile.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF4F4F4),
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.refresh, color: Colors.white, size: 33),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          "If login details were \nsaved,you may \nneed to re-save.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF4F4F4),
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              "Why Smartr? Read here",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF4F4F4),
                fontSize: 10,
                height: 1.4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 40,
                left: 40,
                bottom: 40,
                top: 10,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFBFDBD1),
                  foregroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF135B46),
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => JobsListScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
