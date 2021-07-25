## "Challenge"

A Flutter "Challenge" project with DDD architecture and MOBX state management. 

"Challenge" app uses FirebaseAuth for User Authentication, including autologin functionality.

App supports Armenian and English languages for internalization.
Selected language is stored in shared preferences. 
"Challenge" heavily relies on code generation. Application uses auto_route, flutter_mobx, freezed, injectable and get_it for dependency injections.



## Getting Started

For running and debugging
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run

###Images

Authentication page English:

![](https://firebasestorage.googleapis.com/v0/b/challenge-10536.appspot.com/o/sign_in_en.png?alt=media&token=b55cfed1-2044-47b3-9716-0e6ce6cbdb7a)

Authentication page Armenian:

![](https://firebasestorage.googleapis.com/v0/b/challenge-10536.appspot.com/o/sign_in_hy.png?alt=media&token=0758a2bb-f3b2-44b9-b65f-38cd0081cdf4)

App Video recording:

![](https://firebasestorage.googleapis.com/v0/b/challenge-10536.appspot.com/o/challenge_video_recording.gif?alt=media&token=62a0e895-f5ed-4ec1-9a11-1941ca5ccb60)
