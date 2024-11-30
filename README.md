# welcome

Launching in IDEs (VS Code or Android Studio):
1. To build an apk, run in terminal: 
flutter build apk --dart-define=UNSPLASH_CLIENT_ID=provided client id
2. To run the project, run in terminal: 
flutter run --release --dart-define=UNSPLASH_CLIENT_ID=provided client id

Reason for having different list is state for each tab: this is due to pagination, if we receive a bulk list of all tours, pagination in section will either really strange or impossible. 