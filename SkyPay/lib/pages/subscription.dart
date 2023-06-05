import 'package:flutter/material.dart';

class SubscriptionOption {
  final String title;
  final String description;
  final String price;

  SubscriptionOption(
      {required this.title, required this.description, required this.price});
}

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int _selectedOptionIndex = -1;

  List<SubscriptionOption> _options = [
    SubscriptionOption(
        title: 'Temel',
        description: 'Lorem ipsum dolor sit amet',
        price: '₺29.99/ay'),
    SubscriptionOption(
        title: 'Standart',
        description: 'Consectetur adipiscing elit',
        price: '₺59.99/ay'),
    SubscriptionOption(
        title: 'Premium',
        description: 'Sed do eiusmod tempor incididunt',
        price: '₺89.99/ay'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Text(
                'Size en uygun planı seçin',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (BuildContext context, int index) {
                  SubscriptionOption option = _options[index];
                  bool isSelected = index == _selectedOptionIndex;
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    color: isSelected ? Colors.blue[50] : Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option.title,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.blue[800]
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              option.description,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: isSelected
                                    ? Colors.blue[800]
                                    : Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              option.price,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.blue[800]
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _selectedOptionIndex == -1
                    ? null
                    : () {
                        // seçilen abonelik seçeneğini satın al
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x0ff023240),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ),
                child: Text(
                  'Şimdi Satın Al',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
