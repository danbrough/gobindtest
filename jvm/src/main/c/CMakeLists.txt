# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.18.1)

# Declares and names the project.

project("kipfs")

find_package(JNI)

if (JNI_FOUND)
  message (STATUS "JNI_INCLUDE_DIRS=${JNI_INCLUDE_DIRS}")
  message (STATUS "JNI_LIBRARIES=${JNI_LIBRARIES}")
endif()

include_directories(${JNI_INCLUDE_DIRS})

include_directories(${CMAKE_SOURCE_DIR}/../../../../test1/)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
             kipfs

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
         test.c
         )


add_library(gobindtest SHARED IMPORTED)
set_property(TARGET gobindtest PROPERTY IMPORTED_LOCATION /home/dan/workspace/go/src/github.com/danbrough/gobindtest/test1/libgobindtest.so)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

#find_library( # Sets the name of the path variable.
#              log-lib
#
#              # Specifies the name of the NDK library that
#              # you want CMake to locate.
#              log )

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries(
kipfs
gobindtest
)

#target_link_libraries( # Specifies the target library.
#    kipfs
#
#                       # Links the target library to the log library
#                       # included in the NDK.
#                       ${log-lib} )