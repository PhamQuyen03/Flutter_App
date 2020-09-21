import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/presentation/widgets/button.dart';

class RegisterSucceedPage extends StatelessWidget {
  const RegisterSucceedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: MediaQuery.of(context).size.width / 3,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Successfully created account!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ButtonWidget(
                      label: 'LOGIN NOW',
                      color: Theme.of(context).accentColor,
                      textStyle: TextStyle(color: Colors.white),
                      onSubmit: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
