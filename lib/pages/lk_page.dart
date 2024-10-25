
import 'package:flutter/material.dart';

class LkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль покупателя', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Отступ

            // Имя
            Text(
              'Имя Фамилия',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Телефон: +7 (999) 999-99-99',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),

            Text(
              'Почта: example@mail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
              },
              child: Text('Редактировать профиль', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
