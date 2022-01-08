plugins {
  kotlin("jvm")
  `maven-publish`
}

dependencies {
  implementation(project(":lib"))
  implementation(AndroidUtils.logging)
  testImplementation(Testing.junit4)
// testImplementation("com.github.danbrough.ipfs_mobile:libamd64:0.10.0_06")
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
    this.jvmArgs=listOf("-Djava.library.path=/home/dan/workspace/gobindtest/lib/build/libs/jni/amd64")
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



publishing {

  publications {
    create<MavenPublication>("default") {
      from(components["java"])
    }
  }


  repositories {
    maven(ProjectVersions.MAVEN_REPO)
  }

}