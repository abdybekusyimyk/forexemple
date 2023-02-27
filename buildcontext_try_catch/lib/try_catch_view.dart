import 'package:flutter/material.dart';

class TryCatchView extends StatefulWidget {
  const TryCatchView({Key? key}) : super(key: key);

  @override
  _TryCatchViewState createState() => _TryCatchViewState();
}

class _TryCatchViewState extends State<TryCatchView> {
  final birinchi = TextEditingController();
  final ekinchi = TextEditingController();
  double summa = 0;

  // final joop =  birinchi. + ekinchi ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$summa',
            style: TextStyle(fontSize: 36),
          ),
          TextFormField(
            controller: birinchi,
          ),
          TextFormField(
            controller: ekinchi,
          ),
          ElevatedButton(
              onPressed: () {
                try {
                  summa =
                      double.parse(birinchi.text) + double.parse(ekinchi.text);
                  setState(() {});
                } catch (e) {
                  showAboutDialog(
                      context: context, applicationName: 'San Jaz $e');
                  print('bixdin kata $e, menimche siz kata jayshynyz kerek');
                }
              },
              child: Text('+'))
        ],
      ),
    );
  }
}
