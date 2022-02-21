import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class TypeRpMenu extends StatefulWidget {
  Function onChanged;

  TypeRpMenu({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<TypeRpMenu> createState() => _TypeRpMenuState();
}

class _TypeRpMenuState extends State<TypeRpMenu> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'DIGITE O PREÇO DA SKIN',
            style: kInputMenuText,
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    'RP',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalDivider(
                    thickness: 3.0,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      onChanged: (value) {
                        widget.onChanged(value);
                      },
                      controller: myController,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'VALOR RP ',
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('images/RP.png'),
                    width: 35,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Ex: Leona Reinos Mecha= \n 1350 RP',
            style: kInputMenuText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
