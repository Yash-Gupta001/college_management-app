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
        applicationId = "com.example.flutter_flavors"  // Base applicationId
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        debug {
            // For debug, you don't need to specify signingConfig if you're only testing in debug mode.
        }
        release {
            // You can configure signing here later if needed for release.
            // For now, it's empty because you may not have a release key yet.
        }
    }

    flavorDimensions("environment")
    
    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"  // Adds .dev to the applicationId for this flavor
            versionName = "1.0.0-dev"
            resValue("string", "app_name", "flutter_dev")  // App name for dev flavor
        }
        create("uat") {
            dimension = "environment"
            applicationIdSuffix = ".uat"  // Adds .uat to the applicationId for this flavor
            versionName = "1.0.0-uat"
            resValue("string", "app_name", "flutter_uat")  // App name for uat flavor
        }
        create("prod") {
            dimension = "environment"
            // If needed, set the applicationId for prod flavor, or it will default to the base app ID
            // applicationId = "com.example.flutter_flavors" 
            versionName = "1.0.0-prod"
            resValue("string", "app_name", "flutter_prod")  // App name for prod flavor
        }
    }
}

flutter {
    source = "../.."
}
