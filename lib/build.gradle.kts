plugins {
  kotlin("multiplatform")
}

group = "com.github.danbrough.gobindtest"
version = "1.0-SNAPSHOT"

repositories {
  mavenCentral()
  maven("https://h1.danbrough.org/maven")
}

/*
    iosX64("ios"){
        compilations["main"].cinterops {
            firebasecore {
                packageName 'cocoapods.FirebaseCore'
                defFile = file("$projectDir/src/iosMain/c_interop/FirebaseCore.def")
                includeDirs ("$projectDir/../iosApp/Pods/FirebaseCore/Firebase/Core/Public")
                compilerOpts ("-F$projectDir/src/iosMain/c_interop/modules/FirebaseCore-${versions.firebaseCoreIos}")
            }
 */
kotlin {
  jvm {
    compilations.all {
      kotlinOptions.jvmTarget = "1.8"
    }
    withJava()
    testRuns["test"].executionTask.configure {
      useJUnitPlatform()
    }
  }
/*
  js(BOTH) {
    browser {
      commonWebpackConfig {
        cssSupport.enabled = true
      }
    }
  }
*/

/*
  val hostOs = System.getProperty("os.name")
  val isMingwX64 = hostOs.startsWith("Windows")
  val nativeTarget = when {
    hostOs == "Mac OS X" -> macosX64("native")
    hostOs == "Linux" -> linuxX64("native")
    isMingwX64 -> mingwX64("native")
    else -> throw GradleException("Host OS is not supported in Kotlin/Native.")
  }
*/

  linuxX64 {
    compilations["main"].apply {
      cinterops {
        create("gobind") {
          packageName = "gobind"
          includeDirs(rootProject.file("test1"))
        //  extraOpts("-libraryPath", "${rootProject.file("test1")}")
        }
      }
    }
    binaries {
      executable {
        entryPoint = "main"
      }
    }
  }

/*  linuxArm64 {
    compilations["main"].apply {
      cinterops {
        this.create("gobind") {
          defFile = project.file("src/linuxArm64Main/gobind.def")
          packageName = "gobind"
          //headers = rootProject.files("test1")
        }
        *//*this.gojni {
          defFile project.file("gojni.def")
        }*//*
      }
    }
    binaries {
      executable {
        entryPoint = "main"
      }
    }
  }*/

  sourceSets {
    val commonMain by getting {
      dependencies {
        implementation(AndroidUtils.logging)
      }
    }
    val commonTest by getting {
      dependencies {
        implementation(kotlin("test"))
      }
    }
    val jvmMain by getting {
      dependencies {
      }
    }
    /* val jvmTest by getting
     val jsMain by getting
     val jsTest by getting*/
    val nativeMain by creating {
      dependsOn(commonMain)
    }

    val nativeTest by creating

    val linuxX64Main by getting {
      dependsOn(nativeMain)
    }


  }
}
