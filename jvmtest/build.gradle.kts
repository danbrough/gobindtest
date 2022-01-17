plugins {
  kotlin("jvm")
}

dependencies {
  implementation("com.github.danbrough.kipfs:jvm:_")

  implementation("com.github.danbrough.kipfs:linuxAmd64:_")
  implementation(AndroidUtils.logging)
  testImplementation(Testing.junit4)
// testImplementation("com.github.danbrough.ipfs_mobile:libamd64:_")
}


java {
  withSourcesJar()
}


group = ProjectVersions.GROUP_ID
version = ProjectVersions.VERSION_NAME

fun TaskContainerScope.registerDemo(name: String, cls: String) =
  register<JavaExec>(name) {
    mainClass.set(cls)
    //classpath = files("../jvm/libs/linux/libs/$arch") + sourceSets["main"].runtimeClasspath
    classpath = sourceSets["main"].runtimeClasspath

    val execTask = this

    project.properties.keys.forEach { key ->
      if (key.startsWith("IPFS_")) {
        execTask.systemProperties[key] = project.property(key).toString()
      }
    }
  }

tasks {
  registerDemo("main", "danbroid.gobindtest.Main")
}


