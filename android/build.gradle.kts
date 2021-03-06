plugins {
  id("com.android.library")
  id("org.jetbrains.kotlin.android")
  `maven-publish`
}

android {
  compileSdk = 31
  //ndkVersion= "23.0.7599858"
  ndkVersion = "23.1.7779620"

/*
  packagingOptions {
    jniLibs {
     // excludes += "**libgojni.so"
    }
  }
*/

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

/*    ndk {
      //abiFilters += listOf("x86", "x86_64", "armeabi", "armeabi-v7a", "arm64-v8a")
      abiFilters += listOf("x86")

    }*/
  }

  buildTypes {
    release {
      isMinifyEnabled = false
      proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    }
  }
  externalNativeBuild {
    cmake {
      // path("src/main/cpp/CMakeLists.txt")
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

  val sourcesJar by tasks.registering(Jar::class) {
    archiveClassifier.set("sources")
    from(sourceSets.getByName("main").java.srcDirs)
  }
  afterEvaluate {

    publishing {
      publications {

        publications {
          create<MavenPublication>("release") {
            from(components["release"])
            artifact(sourcesJar.get())
            artifactId = "android"
            groupId = ProjectVersions.GROUP_ID
            version = ProjectVersions.VERSION_NAME
          }
        }
      }

      repositories {
        maven(ProjectVersions.MAVEN_REPO)
      }
    }
  }
}





dependencies {

  testImplementation(AndroidUtils.logging)
  testImplementation(Testing.junit4)
  androidTestImplementation(AndroidUtils.logging)

  androidTestImplementation("com.android.support.test:runner:_")
  androidTestImplementation("com.android.support.test.espresso:espresso-core:_")
}