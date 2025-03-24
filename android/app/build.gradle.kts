plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_flavors"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.flutter_flavors"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        debug {
            // You don't need to specify signingConfig for debug if you are only testing in debug mode
        }
        release {
            // You can remove the signingConfig for release if you're not using it yet.
        }
    }

    

    flavorDimensions("environment")
    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            versionName = "1.0.0-dev"
            resValue("string", "app_name", "flutter_dev")
        }
        create("uat") {
            dimension = "environment"
            applicationIdSuffix = ".uat"
            versionName = "1.0.0-uat"
            resValue("string", "app_name", "flutter_uat")
        }
        create("prod") {
            dimension = "environment"
            //applicationId = ".prod"
            versionName = "1.0.0-prod"
            resValue("string", "app_name", "flutter_prod")
        }
    }
}

flutter {
    source = "../.."
}
