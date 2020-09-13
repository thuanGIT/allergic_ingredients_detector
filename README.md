# INSPIRATION
* Food security is now a common concern for many people. We want to create a tool that can help users easily and quickly identify foods that contain allergic ingredients to them.

# WHAT IT DOES
* The app walks users through 2 simple steps. First, users need to fill in the box with their allergy. Then, they need to upload image of the ingredients. Finally, the app will provide result whether the food is safe to consume or not.

# HOW WE BUILT IT
We use: 
* Flutter to build User Interface. 
* Flutter's machine learning kit (MLKit) to recognize text from uploaded image.
* Firebase to store data about ingredients causing allergy.

# INSTRUCTIONS ON INSTALLATION AND SAMPLE RUN

* Install Flutter (MacOS):
  * Download the [Flutter SDK](https://flutter.dev/docs/get-started/install/macos) and put it in a folder of your choice, /Users/$HOME/ (recommended).
  * Update Path permanently by opening terminal. 
    * Type:<br/>
      ```bash cd ~/```<br/> 
      ```bash touch .bash_profile```<br/>
      ```bash open -e .bash_profile``` or ```bash vim .bash_profile```<br/>
    * Add the following line to the bash_profile where [PATH_TO_FLUTTER_GIT_DIRECTORY] is your path to the location of the fultter sdk folder:<br/>
      ```bash export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"```

*  Install IDE or code editor of your choice. Mine is VSCode where you can find Flutter extension along with extensions for Dart language. For more information, follow this [playlist](https://youtu.be/I9ceqw5Ny-4).

* Adding FireBase to your Flutter Project:
  * Create a FireBase account at [FireBase](https://firebase.google.com).
  * Create a firebase Project. Follow the instructions to for setting up. Make you have google-services.json in your android/app folder.
  * In your pubspec.yaml file **(if not cloning from this repository)**. Add the following lines to your **dependencies:**
    * ```bash firebase_core: ^0.4.0+9``` - Check that you have this dependency (added in the previous step)
    * ``` bash firebase_analytics: ^5.0.2``` - Add the dependency for the FlutterFire plugin for Google Analytics
    * ```bash firebase_auth: ^0.14.0+5``` - to use Firebase Authentication
    * ```bash cloud_firestore: ^0.12.9+5``` - to use Cloud Firestore
    * ```bash image_picker: ^0.6.7+7``` - to allow user to pick image from gallery
    * ```bash firebase_ml_vision: ^0.9.3+8``` - FireBase ML Vision 
 * Import for using those above packages:<br/>
  * ``` bash import 'package:image_picker/image_picker.dart';```
  * ``` bash import 'package:firebase_ml_vision/firebase_ml_vision.dart';```
  
* **You are ready to run the sample source code !!!**
  

# CHALLENGES
* How to connect Firebase with Flutter app 
* How to utilize Flutter's MLKit 
* How to retrieve data from database on Firebase

# POTENTIAL ISSUE
*   "Firebase_core_web , firebase_auth_web, cloud_firestore_web Plugin project :firebase_auth_web not found. Please update settings.gradle." --> [SOLUTION](https://github.com/FirebaseExtended/flutterfire/issues/2599)
*   "Flutter Firestore causing D8: Cannot fit requested classes in a single dex file # methods: 71610 > 65536 in Android Studio" -->[SOLUTION](https://stackoverflow.com/questions/55591958/flutter-firestore-causing-d8-cannot-fit-requested-classes-in-a-single-dex-file)

*   If encountering "Waiting for the text recognition model to be downloaded. Please wait,..null" issue. Try on Nexus 5 (AVD manager - create new device). If still not resolving the issue, wait 5-10 minutes for downloading the OCR library. Upon success, the debug console may look like this.

```bash
Launching lib/main.dart on Android SDK built for x86 in debug mode...
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app.apk...
Connecting to VM Service at ws://127.0.0.1:56466/wA4H6ilyyik=/ws
D/EGL_emulation(12236): eglMakeCurrent: 0xdd0ead40: ver 3 0 (tinfo 0xd1ab7aa0)
D/eglCodecCommon(12236): setVertexArrayObject: set vao to 0 (0) 1 0
D/EGL_emulation(12236): eglMakeCurrent: 0xdd0e9f60: ver 3 0 (tinfo 0xd1ab94b0)
D/EGL_emulation(12236): eglMakeCurrent: 0xdd0ead40: ver 3 0 (tinfo 0xd1ab7aa0)
D/EGL_emulation(12236): eglMakeCurrent: 0xdd0e9f60: ver 3 0 (tinfo 0xd1ab94b0)
D/EGL_emulation(12236): eglMakeCurrent: 0xdd0ead40: ver 3 0 (tinfo 0xd1ab7aa0)
D/eglCodecCommon(12236): setVertexArrayObject: set vao to 0 (0) 12 0
I/flutter (12236): click
W/DynamiteModule(12236): Local module descriptor class for com.google.android.gms.vision.dynamite.text not found.
I/DynamiteModule(12236): Considering local module com.google.android.gms.vision.dynamite.text:0 and remote module com.google.android.gms.vision.dynamite.text:0
D/TextNativeHandle(12236): Cannot load feature, fall back to load whole module.
W/DynamiteModule(12236): Local module descriptor class for com.google.android.gms.vision.dynamite not found.
W/dients_detecto(12236): Unsupported class loader
I/DynamiteModule(12236): Considering local module com.google.android.gms.vision.dynamite:0 and remote module com.google.android.gms.vision.dynamite:2703
I/DynamiteModule(12236): Selected remote version of com.google.android.gms.vision.dynamite, version >= 2703
V/DynamiteModule(12236): Dynamite loader version >= 2, using loadModule2NoCrashUtils
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->allocateInstance(Ljava/lang/Class;)Ljava/lang/Object; (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekLong(JZ)J (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeLong(JJZ)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeInt(JIZ)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekInt(JZ)I (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeByte(JB)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekByte(J)B (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeByteArray(J[BII)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekByteArray(J[BII)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden field Ljava/nio/Buffer;->address:J (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, linking, allowed)
I/DynamiteModule(12236): Considering local module com.google.android.gms.vision.ocr:0 and remote module com.google.android.gms.vision.ocr:1
I/DynamiteModule(12236): Selected remote version of com.google.android.gms.vision.ocr, version >= 1
I/native  (12236): start_ocr_856638336_langid.cc:33 StartOcr with label: latin_script_gmvapi_android
I/native  (12236): jni_helper.cc:115 Loading model config /data/user/0/com.example.allergic_ingredients_detector/cache/vision/ocr/data/models/semanticlift_rpn_lstm_engine_tfmini.bincfg
I/native  (12236): region_proposal_text_detector.cc:1976 Compute manager Max in flight region detector: 1
I/native  (12236): common_util.h:39 Removing Thread Pool: ocr_region
I/native  (12236): tensor_detector_client.cc:1643 Compute manager Max in flight detector: 1
I/native  (12236): common_util.h:35 Resizing Thread Pool: ocr_det to 4
I/native  (12236): tfmini_model_interface.cc:124 Loaded weights from /data/user/0/com.example.allergic_ingredients_detector/cache/vision/ocr/data/models/tfmini_rpn_detector_space_to_depth_gray_quantized_v2_model.data
I/native  (12236): timer.cc:71 PhotoOcrEngine::Init (detector): 3.93235 ms (elapsed)
I/native  (12236): assist_recognizer.cc:94 Initializing nugget matcher with /data/user/0/com.example.allergic_ingredients_detector/cache/vision/ocr/data/models/nugget_stats_1.0.dat
I/native  (12236): timer.cc:71 PhotoOcrEngine::Init (assist recognizer): 0.0357016 ms (elapsed)
I/native  (12236): timer.cc:71 LanguageIdMutator: 0.587399 ms (elapsed)
I/native  (12236): timer.cc:71 BeamSearch::Init (mutator): 0.610488 ms (elapsed)
I/native  (12236): common_util.h:35 Resizing Thread Pool: ocr_segm to 4
I/native  (12236): tfmini_model_interface.cc:102 Loaded fp16 weights from /data/user/0/com.example.allergic_ingredients_detector/cache/vision/ocr/data/models/tfmini_latin_conv_model.data_fp16
I/native  (12236): tfmini_model_interface.cc:102 Loaded fp16 weights from /data/user/0/com.example.allergic_ingredients_detector/cache/vision/ocr/data/models/tfmini_latin_lstm_model.data_fp16
I/native  (12236): timer.cc:71 PhotoOcrEngine::Init (recognizer): 4.357 ms (elapsed)
I/native  (12236): timer.cc:71 Init: 8.37283 ms (elapsed)
I/native  (12236): start_ocr_856638336_langid.cc:42 StartOcr success
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeByte(JB)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekByte(J)B (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->pokeByte(JB)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Llibcore/io/Memory;->peekByte(J)B (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, reflection, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object; (greylist, linking, allowed)
W/dients_detecto(12236): Accessing hidden method Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V (greylist, linking, allowed)
I/flutter (12236): INGREDIENTS:
I/flutter (12236): Organic
...
```

# WHAT WE LEARNT
* Machine Learning, especially text recognition from images. Creating Flutter app.

# WHAT'S NEXT
* Improve on the database of allergic ingredients so that the app is suitable for diversity of users.
* Add a new feature where users can use their camera to directly take and load pictures into the app.

