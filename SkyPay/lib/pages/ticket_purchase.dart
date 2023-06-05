import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skypay/const.dart';
import 'package:skypay/pages/refund.dart';

class TicketPurchasePage extends StatefulWidget {
  @override
  _TicketPurchasePageState createState() => _TicketPurchasePageState();
}

class _TicketPurchasePageState extends State<TicketPurchasePage> {
  String _departureCity = '';
  String _destinationCity = '';
  final _cities = ['İstanbul', 'Ankara', 'İzmir', 'Antalya'];
  String _fromValue = 'İstanbul';
  String _toValue = 'Ankara';
  final _dateController = TextEditingController();
  final _passengersController = TextEditingController();
  final _cardNumberController = TextEditingController();

  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardExpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _departureDate = DateTime.now();
  int _passengerCount = 1;
  bool _isOneWay = true;

  // Değişkenlere değer atamak için aşağıdaki fonksiyonları kullanabilirsiniz
  void setDepartureCity(String city) {
    setState(() {
      _departureCity = city;
    });
  }

  void setDestinationCity(String city) {
    setState(() {
      _destinationCity = city;
    });
  }

  void setDepartureDate(DateTime date) {
    setState(() {
      _departureDate = date;
    });
  }

  void setPassengerCount(int count) {
    setState(() {
      _passengerCount = count;
    });
  }

  void setIsOneWay(bool isOneWay) {
    setState(() {
      _isOneWay = isOneWay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Tarih: ${_departureDate.toString().substring(0, 10)}'),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: _departureDate,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null && picked != _departureDate)
                                  setDepartureDate(picked);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yolcu Sayısı: $_passengerCount',
                              style: stilim,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    if (_passengerCount > 1) {
                                      setPassengerCount(_passengerCount - 1);
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setPassengerCount(_passengerCount + 1);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tek Yön', style: stilim),
                            Switch(
                              value: _isOneWay,
                              onChanged: (value) => setIsOneWay(value),
                            ),
                            Text('Gidiş-Dönüş', style: stilim),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _cardNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Kart Numarası',
                                    hintText: 'xxxx xxxx xxxx xxxx',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.payment),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16),
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Lütfen kart numarasını girin';
                                    } else if (value.length < 16) {
                                      return 'Kart numarası eksik';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _expiryDateController,
                                        decoration: InputDecoration(
                                          labelText: "Son Kullanma Tarihi",
                                          hintText: 'MM/YY',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.timelapse),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(4),
                                        ],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Lütfen son kullanma tarihini girin';
                                          } else if (value.length < 4) {
                                            return 'Son kullanma tarihi eksik';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _cvvController,
                                        decoration: InputDecoration(
                                          labelText: 'CVV',
                                          hintText: '123',
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.vpn_key),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Lütfen CVV numarasını girin';
                                          } else if (value.length < 3) {
                                            return 'CVV numarası eksik';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Formu submit et
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                            0x0ffB1EDFF), // arka plan rengi
                                        foregroundColor:
                                            Colors.black, // yazı rengi
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              6), // butonun şeklini düzenle
                                        ),
                                      ),
                                      child: Text(
                                        'Ödeme Yap',
                                        style: TextStyle(
                                          fontSize: 18, // yazı boyutu
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RefundPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'İade ve İptal Politikası',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
