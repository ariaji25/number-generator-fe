import 'package:flutter/material.dart';
import 'package:test_fe/service.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  var service = new NumberService();

  var bilanganGanjil = [];
  var bilanganPrima = [];
  var segitiga = [];

  var textController = new TextEditingController();

  void findBilanganGanjil() async {
    if (textController.text.isNotEmpty) {
      var data =
          await service.getBilanganGanjil(int.parse(textController.text));
      setState(() {
        bilanganGanjil = data['bilanganGanjil'];
      });
      textController.text = '';
    }
  }

  void findBilanganPrima() async {
    if (textController.text.isNotEmpty) {
      var data = await service.getBilanganPrima(int.parse(textController.text));
      print(data);
      setState(() {
        bilanganPrima = data['bilanganPrima'];
      });
      textController.text = '';
    }
  }

  void findSegigita() async {
    if (textController.text.isNotEmpty) {
      var data = await service.getSegitiga(textController.text);
      setState(() {
        segitiga = data['segitiga'];
      });
      textController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Input Number')),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text('Bilangan Ganjil',
                    style: TextStyle(color: Colors.white)),
                onPressed: () => findBilanganGanjil(),
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text('Bilangan Prima',
                    style: TextStyle(color: Colors.white)),
                onPressed: () => findBilanganPrima(),
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text('Segitiga', style: TextStyle(color: Colors.white)),
                onPressed: () => findSegigita(),
              )
            ],
          ),
          Text(
            'Result :',
            style: TextStyle(fontSize: 24),
          ),
          Text('Bilangan Ganjil : $bilanganGanjil'),
          Text('Bilangan Prima : $bilanganPrima'),
          Text('Bilangan Seigtiga :'),
          segitiga.isEmpty ? Container() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: segitiga.map((e) => Text(e)).toList(),
          )
        ],
      ),
    );
  }
}
