plugins {
  id("com.android.library")
  id("org.jetbrains.kotlin.android")
}

android {
  compileSdk = 31
  //ndkVersion= "23.0.7599858"
  ndkVersion = "23.1.7779620"
  defaultConfig {
    minSdk = 21
    targetSdk = 31

    testInstrumentationRunner = "android.support.test.runner.AndroidJUnitRunner"
    consumerProguardFiles("consumer-rules.pro")
    externalNativeBuild {
      cmake {
        cppFlags("")
      }
    }
  }

  buildTypes {
    release {
      isMinifyEnabled = false
      proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    }
  }
  externalNativeBuild {
    cmake {
      path("src/main/cpp/CMakeLists.txt")
      //version = "3.18.1"
    }
  }
  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
  }
  kotlinOptions {
    jvmTarget = "1.8"
  }



}



dependencies {

  testImplementation(AndroidUtils.logging)
  testImplementation(Testing.junit4)
  androidTestImplementation("com.android.support.test:runner:_")
  androidTestImplementation("com.android.support.test.espresso:espresso-core:_")
}