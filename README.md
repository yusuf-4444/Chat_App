# Scholar Chat App 📱💬

A real-time chat application built with Flutter and Firebase that allows users to communicate instantly in a shared chat room.

## Features ✨

- **User Authentication**: Secure sign-up and login using Firebase Authentication
- **Real-time Messaging**: Send and receive messages instantly using Firestore
- **Clean UI**: Modern and intuitive user interface with custom styling
- **Password Security**: Password visibility toggle for enhanced security
- **Form Validation**: Email and password validation with user feedback
- **Auto-scroll**: Automatically scrolls to latest messages
- **Cross-platform**: Runs on Android, iOS, Web, macOS, and Windows

## Screenshots 📸

*Add your app screenshots here*

## Tech Stack 🛠️

- **Flutter**: Cross-platform mobile development framework
- **Firebase Authentication**: User authentication and management
- **Cloud Firestore**: Real-time database for storing messages
- **Firebase Core**: Core Firebase functionality

## Dependencies 📦

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest_version
  firebase_auth: ^latest_version
  cloud_firestore: ^latest_version
  modal_progress_hud_nsn: ^latest_version
```

## Getting Started 🚀

### Prerequisites

- Flutter SDK installed on your machine
- Firebase project set up
- Android Studio/VS Code with Flutter plugins

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/scholar-chat-app.git
   cd scholar-chat-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication (Email/Password)
   - Create a Firestore database
   - Add your platform-specific configuration files:
     - `android/app/google-services.json` for Android
     - `ios/Runner/GoogleService-Info.plist` for iOS
   - Update `firebase_options.dart` with your project configuration

4. **Run the app**
   ```bash
   flutter run
   ```

## App Structure 🏗️

```
lib/
├── main.dart                    # App entry point
├── contants.dart               # App constants and colors
├── firebase_options.dart       # Firebase configuration
├── models/
│   └── message_model.dart      # Message data model
├── views/
│   ├── login_view.dart         # Login screen
│   ├── signup_view.dart        # Sign up screen
│   └── chat_view.dart          # Main chat screen
└── widgets/
    ├── custom_chat_widget.dart           # Chat bubble widget
    ├── custom_chat_text_form_field.dart  # Chat input field
    ├── text_form_field_widget_username.dart # Email input field
    └── text_form_field_widget_password.dart # Password input field
```

## Key Features Explained 🔍

### Authentication Flow
- Users can register with email and password
- Secure login with Firebase Authentication
- Form validation for email format and password requirements
- Error handling with user-friendly messages

### Real-time Chat
- Messages are stored in Firestore collection
- Real-time updates using StreamBuilder
- Messages ordered by creation timestamp
- Automatic scrolling to latest messages

### Custom UI Components
- Custom text form fields with validation
- Styled chat bubbles for messages
- Loading indicators during async operations
- Consistent color scheme throughout the app

## Firebase Configuration 🔧

The app supports multiple platforms with the following Firebase configuration:

- **Web**: Full web app support
- **Android**: Native Android app
- **iOS**: Native iOS app  
- **macOS**: Desktop macOS support
- **Windows**: Desktop Windows support

## Usage 📱

1. **Sign Up**: Create a new account with email and password
2. **Login**: Sign in with your credentials
3. **Chat**: Start sending messages in the shared chat room
4. **Real-time**: See messages from other users instantly

## Contributing 🤝

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Security Notes 🔒

- Firebase API keys are included in the configuration files
- For production apps, consider implementing Firebase Security Rules
- Use environment variables for sensitive configuration in production
- Enable additional security features in Firebase Console

## Future Enhancements 🚧

- [ ] User profiles and avatars
- [ ] Private messaging between users
- [ ] Message reactions and replies
- [ ] File and image sharing
- [ ] Push notifications
- [ ] Dark mode theme
- [ ] Message search functionality
- [ ] User online status

## Troubleshooting 🐛

### Common Issues

1. **Firebase not initialized**: Make sure Firebase is properly configured for your platform
2. **Build errors**: Run `flutter clean` and `flutter pub get`
3. **Authentication errors**: Check Firebase Authentication settings
4. **Firestore permission errors**: Review Firestore security rules

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact 📧

Email: youssefhamed374@gmail.com

Project Link: https://github.com/yusuf-4444/Chat_App

---

**Built with ❤️ using Flutter and Firebase**