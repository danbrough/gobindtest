plugins {
  kotlin("jvm")
  application
  id("com.github.johnrengelman.shadow")
}

val arch = System.getProperty("os.arch")!!.let {
  if (it == "aarch64") "arm64" else it
}

val osName = System.getProperty("os.name")!!.let {
  if (it.startsWith("Windows")) "win32" else it
}

application {
  mainClass.set("danbroid.gobindtest.Main")
}
dependencies {
  implementation("com.github.danbrough.kipfs:jvm:_")


  /*if (arch == "arm64")
    implementation("com.github.danbrough.kipfs:linuxArm64:_")
  else*/
    implementation("com.github.danbrough.kipfs:linuxArm64:_")
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



shadow {

}
