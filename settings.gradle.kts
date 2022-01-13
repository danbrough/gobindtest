plugins {
  id("de.fayard.refreshVersions") version "0.30.1"
////                          # available:"0.30.2"
}

include(":lib")
include(":jvmtest")

rootProject.name = "gobindtest"

include(":android")
include(":jvm")
