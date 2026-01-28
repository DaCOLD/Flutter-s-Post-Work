Flutter GET and POST Request App

Overview
This project demonstrates how to perform HTTP GET and POST requests in a Flutter application using the `http` package.
The app retrieves data from a remote server and also sends data to the server.

lib/
│
├── main.dart
├── api_service.dart
└── post_model.dart

pubspec.yaml
README.md

Project Structure
- pubspec.yaml – Contains project dependencies
- post_model.dart – Defines the data model
- api_service.dart – Handles all API communication (GET and POST requests)
- main.dart – Handles the user interface and displays data

 Features
- Perform GET request to fetch data from an API
- Perform POST request to send data to an API
- Separation of API logic, model, and UI
- Proper error handling and loading indicators

 API Used
https://jsonplaceholder.typicode.com

 Purpose
This project was developed to understand REST API integration in Flutter and to practice clean code structure.

Author
Built for learning and academic purposes.
