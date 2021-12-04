import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _selected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffA3A3AD),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/logo_light.png'),
        //         fit: BoxFit.cover)),
        child: Scaffold(
            // backgroundColor: Color.transparent,
            body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 30),
            SizedBox(
                // child: Image.asset('assets/logo_light.png'),
                height: 264.0,
                width: 274.0,
                child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: Image.asset('assets/images/logo_light.png',
                        fit: BoxFit.fill))),
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [Image.asset('assets/logo_light.png')]),
            const SizedBox(height: 30),
            Container(
                // color: Color(0xff711A1A),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xff711A1A),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                // transform: Matrix4.rotationZ(0.05),
                child: SizedBox(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const Text(
                                'Login',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30.0),
                              ),
                              const SizedBox(width: 220),
                              IconButton(
                                icon: const Icon(Icons.highlight_off_outlined),
                                tooltip: 'Close',
                                onPressed: () {
                                  // ignore: todo
                                  // TODO: Return to initial page
                                },
                                iconSize: 30.0,
                                color: Colors.white,
                              ),

                              // Icon(
                              //   Icons.highlight_off_outlined,
                              //   color: Colors.white,
                              //   size: 30.0,
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: Color(0xffCC3333),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  // filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'example@mail.com'),
                            )),
                        const Padding(
                            padding: EdgeInsets.all(10.0),
                            // ignore: prefer_const_constructors
                            child: TextField(
                              obscureText: true,
                              cursorColor: Color(0xffCC3333),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  // filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter secure password'),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                  _selected
                                      ? "Remember me"
                                      : "Don't remember me",
                                  style: const TextStyle(color: Colors.white)),
                              Checkbox(
                                value: _selected,
                                activeColor: const Color(0xffCC3333),
                                side:
                                    const BorderSide(color: Color(0xffCC3333)),
                                onChanged: (value) {
                                  setState(() {
                                    _selected = value!;
                                  });
                                },
                              ),
                              const SizedBox(width: 50),
                              TextButton(
                                onPressed: () {
                                  // ignore: todo
                                  // TODO FORGOT PASSWORD SCREEN GOES HERE
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      // colork: Color(0xffCC3333),
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              color: const Color(0xff711A1A),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => HomePage()));
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // ignore: todo
                                // TODO REGISTER SCREEN GOES HERE
                              },
                              child: const Text(
                                'New Here? Register!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ]),
                ))
          ]),
        )));
  }
}
