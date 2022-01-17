plugins {
  kotlin("jvm")
  `maven-publish`
}

group = ProjectVersions.GROUP_ID
version = ProjectVersions.VERSION_NAME

java {
  sourceCompatibility = ProjectVersions.JAVA_VERSION
  targetCompatibility = ProjectVersions.JAVA_VERSION

  withSourcesJar()
}

dependencies {
  testImplementation(AndroidUtils.logging)
  testImplementation("com.github.danbrough.kipfs:linuxAmd64:_")
  testImplementation(Testing.junit4)
}


val buildLinuxAmd64 by tasks.registering(Jar::class) {
  archiveFileName.set("linuxAmd64.jar")
  from(file("libs/amd64"))
}

val buildLinuxArm64 by tasks.registering(Jar::class) {
  archiveFileName.set("linuxArm64.jar")
  from(file("libs/arm64"))
}

val buildWin32 by tasks.registering(Jar::class) {
  archiveFileName.set("win32.jar")
  from(layout.projectDirectory.dir("libs/win32"))
}



publishing {
  publications {

    create<MavenPublication>("default") {
      from(components["java"])
    }

    listOf("win32", "linuxAmd64", "linuxArm64").forEach { arch ->
      create<MavenPublication>(arch) {
        artifactId = arch
        artifact(tasks.getAt("build${arch.capitalize()}"))
      }
    }
  }

  repositories {
    maven(ProjectVersions.MAVEN_REPO)
  }

}

