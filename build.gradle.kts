buildscript {


  repositories {
    google()
    mavenCentral()
    gradlePluginPortal()
  }

  dependencies {
    classpath("com.android.tools.build:gradle:_")
    classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.6.10")
  }
}

apply("project.gradle.kts")



allprojects {
  repositories {


    google()
    mavenCentral()

    maven(ProjectVersions.MAVEN_REPO)
    maven("https://h1.danbrough.org/maven")

  }

  tasks {
    withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>() {
      kotlinOptions {
        jvmTarget = ProjectVersions.KOTLIN_JVM_VERSION
      }
    }

    withType<JavaCompile>() {
      sourceCompatibility = ProjectVersions.JAVA_VERSION.toString()
      targetCompatibility = ProjectVersions.JAVA_VERSION.toString()
    }

    withType<Test> {
      useJUnit()

      this.jvmArgs("-Djava.library.path=/home/dan/workspace/go/src/github.com/danbrough/gobindtest/android/build/intermediates/library_and_local_jars_jni/debug/jni/x86_64/")

      testLogging {
        events("standardOut", "started", "passed", "skipped", "failed")
        showStandardStreams = true
        /*    outputs.upToDateWhen {
              false
            }*/
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
      }
      project.properties.keys.forEach { key ->
        if (key.startsWith("IPFS_")) {
          val value = project.property(key).toString()
          systemProperty(key, value)
          //environment(key, value)
        }
      }
      environment("PROJECT_DIR", file("."))
    }
  }
}

