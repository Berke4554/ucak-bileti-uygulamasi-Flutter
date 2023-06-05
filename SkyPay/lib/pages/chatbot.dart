import 'dart:math';

import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  final List<String> _botResponses = [
    "Emin değilim, tekrar sorabilir misin?",
    "Sanırım öyle, ama emin değilim.",
    "Kesinlikle!",
    "Kesinlikle hayır.",
    "Muhtemelen öyle.",
    "Kesinlikle eminim!",
    "Bu soruya cevap veremeyeceğim.",
    "Evet, doğru.",
    "Hayır, yanılıyorsun.",
    "Muhtemelen öyle değil.",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[600]!,
                    Colors.blue[800]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.builder(
                      reverse: true,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          _messages[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Bir soru sorun...',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => _handleSubmitted(_controller.text),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _messages.insert(0, "Siz: $text");
      String response = _botResponses[Random().nextInt(_botResponses.length)];
      _messages.insert(0, "ChatBot: $response");
    });
  }
}
