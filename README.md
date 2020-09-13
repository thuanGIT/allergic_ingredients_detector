# Issue that may be encountered
*   [[firebase_core_web , firebase_auth_web, cloud_firestore_web ] Plugin project :firebase_auth_web not found. Please update settings.gradle. ] (https://github.com/FirebaseExtended/flutterfire/issues/2599)
*   [Flutter Firestore causing D8: Cannot fit requested classes in a single dex file (# methods: 71610 > 65536) in Android Studio] (https://stackoverflow.com/questions/55591958/flutter-firestore-causing-d8-cannot-fit-requested-classes-in-a-single-dex-file)


# Changes made to AndroidManifest.xml

*   Add android:requestLegacyExternalStorage="true" as an attribute to the \<application> tag in AndroidManifest.xml. The attribute is false by default on apps targeting Android Q.