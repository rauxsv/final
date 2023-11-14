import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            final prefs = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: <Widget>[
                  _buildUserInfoRow(Icons.person, "Имя", prefs.getString('name')),
                  _buildUserInfoRow(Icons.cake, "Возраст", prefs.getString('age')),
                  _buildUserInfoRow(Icons.flag, "Страна", prefs.getString('country')),
                  _buildUserInfoRow(Icons.transgender, "Пол", prefs.getString('gender')),
                  _buildUserInfoRow(Icons.phone, "Телефон", prefs.getString('phone')),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Text('Выйти из аккаунта'),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildUserInfoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 10),
          Text("$label: "),
          Text(value ?? 'Не указано', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}