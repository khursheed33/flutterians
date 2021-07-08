import 'package:flutter/material.dart';

class AuthUI extends StatefulWidget {
  const AuthUI({Key? key}) : super(key: key);

  @override
  _AuthUIState createState() => _AuthUIState();
}

class _AuthUIState extends State<AuthUI> {
  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            child: ClipPath(
              clipper: CustomShapeUpper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.amber.withOpacity(0.5),
                      Colors.deepOrange.withOpacity(0.5),
                      Colors.deepOrange.withOpacity(0.5),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.36,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: CustomShapeUpper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.amber,
                      Colors.deepOrange,
                      Colors.deepOrange,
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            left: 5,
            child: ClipPath(
              clipper: CustomShapeLower(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.cyan.withOpacity(0.5),
                      Colors.blue.withOpacity(0.5),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomShapeLower(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.cyan,
                      Colors.cyan,
                      Colors.blue,
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          // Login Or Register
          Positioned(
            child: Stack(
              children: [
                if (!_isLogin)
                  Positioned(
                    top: _isLogin
                        ? 0
                        : MediaQuery.of(context).size.height * 0.15,
                    right: 0,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(-1, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                // Title
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  right: MediaQuery.of(context).size.height * 0.2,
                  child: Text(
                    _isLogin ? "Login" : "Register",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                // Form
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    child: Container(
                      // padding: const EdgeInsets.only(right: 10),
                      // height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username
                          TextField(
                            key: ValueKey("username"),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Username",
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                          ),
                          // Password
                          TextField(
                            key: ValueKey("password"),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Password",
                            ),
                          ),
                          if (!_isLogin)
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                            ),
                          if (!_isLogin)
                            // Email
                            TextField(
                              key: ValueKey("email"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.alternate_email),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Email",
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: _isLogin
                      ? MediaQuery.of(context).size.height * 0.44
                      : MediaQuery.of(context).size.height * 0.48,
                  right: MediaQuery.of(context).size.width * 0.12,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 6,
                          offset: Offset(1, 1),
                        ),
                        BoxShadow(
                          color: Colors.tealAccent.withOpacity(0.8),
                          blurRadius: 6,
                          offset: Offset(-1, -1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        colors: [
                          Colors.tealAccent,
                          Colors.teal,
                        ],
                      ),
                    ),
                    child: Icon(
                      _isLogin ? Icons.arrow_forward : Icons.done,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Register Switch Button
                if (_isLogin)
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15,
                    // right: MediaQuery.of(context).size.width * 0.2,
                    left: 0,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(-1, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShapeUpper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    // First Curve
    Offset cp1 = Offset(size.width * 0.06, size.height * 0.95);
    Offset ep1 = Offset(size.width * 0.08, size.width * 0.5);
    // Second Curve
    Offset cp2 = Offset(size.width * 0.15, size.height * 0.35);
    Offset ep2 = Offset(size.width * 0.6, size.width * 0.25);
    // Third Curve
    Offset cp3 = Offset(size.width * 0.95, size.height * 0.35);
    Offset ep3 = Offset(size.width - 10, 0.0);

    // Draw
    path.quadraticBezierTo(cp1.dx, cp1.dy, ep1.dx, ep1.dy);
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx, ep2.dy);
    path.quadraticBezierTo(cp3.dx, cp3.dy, ep3.dx, ep3.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomShapeLower extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset cp1 = Offset(size.width * 0.9, size.height * 0.05);
    Offset ep1 = Offset(size.width * 0.9, size.height * 0.3);
    // Second Curve
    Offset cp2 = Offset(size.width * 0.9, size.height * 0.95);
    Offset ep2 = Offset(size.width * 0.4, size.height * 0.8);
    // Third Curve
    Offset cp3 = Offset(size.width * 0.15, size.height * 0.7);
    Offset ep3 = Offset(size.width * 0.01, size.height + 60);

    // Clipping
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.quadraticBezierTo(cp1.dx, cp1.dy, ep1.dx, ep1.dy);
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx, ep2.dy);
    path.quadraticBezierTo(cp3.dx, cp3.dy, ep3.dx, ep3.dy);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
