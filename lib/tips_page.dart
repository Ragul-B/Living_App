import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreenAccent,
              Colors.green, // Bottom color
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildTipCard('Reduce Water Usage', 'Take shorter showers to conserve water.', Color(0xFFB2EBF2)),
                  _buildTipCard('Reduce Energy Consumption', 'Turn off lights and appliances when not in use.', Color(0xFFC8E6C9)),
                  _buildTipCard('Reduce Waste', 'Use reusable bags and containers.', Color(0xFFFFCCBC)),
                  _buildTipCard('Conserve Energy', 'Switch to energy-efficient light bulbs.', Color(0xFFE1BEE7)),
                  _buildTipCard('Go Paperless', 'Opt for electronic billing and communication to save paper.', Color(0xFFFFFFCC)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String description, Color color) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shadowColor: Colors.black,
      color: color,
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
