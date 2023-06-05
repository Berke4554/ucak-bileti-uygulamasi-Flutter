import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:skypay/pages/ticket_purchase.dart';

class FlightSearchForm extends StatefulWidget {
  @override
  _FlightSearchFormState createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  final _cities = ['İstanbul', 'Ankara', 'İzmir', 'Antalya'];
  String _fromValue = 'İstanbul';
  String _toValue = 'Ankara';
  int passengerCount = 0;
  final _dateController = TextEditingController();
  final _passengersController = TextEditingController();
  final _cardNumberController = TextEditingController();

  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListView(
          children: [
            Image.asset(
              'images/havaliman.png',
              height: 200,
            ),
            DropdownButtonFormField<String>(
              value: _fromValue,
              decoration: InputDecoration(
                labelText: 'Nereden',
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: _cities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _fromValue = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _toValue,
              decoration: InputDecoration(
                labelText: 'Nereye',
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: _cities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _toValue = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DateTimeField(
              format: DateFormat("yyyy-MM-dd"),
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Tarih',
                labelStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      // decrease the passenger count and ensure it doesn't go below 0
                      passengerCount =
                          passengerCount > 0 ? passengerCount - 1 : 0;
                      _passengersController.text =
                          passengerCount.toString(); // update the text field
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    controller: _passengersController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: 'Yolcu Sayısı',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      // increase the passenger count
                      passengerCount++;
                      _passengersController.text =
                          passengerCount.toString(); // update the text field
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPurchasePage(),
                  ),
                );
              },
              child: Text(
                'Uçak Bul',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0x0ff023240),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
