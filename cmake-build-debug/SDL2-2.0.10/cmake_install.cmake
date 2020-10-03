# Install script for directory: /home/zen/Documents/izg/SDL2-2.0.10

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/libSDL2d.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/libSDL2maind.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake"
         "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES
    "/home/zen/Documents/izg/SDL2-2.0.10/SDL2Config.cmake"
    "/home/zen/Documents/izg/cmake-build-debug/SDL2ConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_assert.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_atomic.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_audio.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_bits.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_blendmode.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_clipboard.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_android.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_iphoneos.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_macosx.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_minimal.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_os2.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_pandora.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_psp.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_windows.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_winrt.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_config_wiz.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_copying.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_cpuinfo.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_egl.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_endian.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_error.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_events.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_filesystem.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_gamecontroller.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_gesture.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_haptic.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_hints.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_joystick.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_keyboard.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_keycode.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_loadso.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_log.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_main.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_messagebox.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_mouse.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_mutex.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_name.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengl.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengl_glext.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles2.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles2_gl2.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles2_gl2ext.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles2_gl2platform.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_opengles2_khrplatform.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_pixels.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_platform.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_power.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_quit.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_rect.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_render.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_revision.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_rwops.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_scancode.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_sensor.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_shape.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_stdinc.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_surface.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_system.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_syswm.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_assert.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_common.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_compare.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_crc32.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_font.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_fuzzer.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_harness.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_images.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_log.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_md5.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_memory.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_test_random.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_thread.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_timer.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_touch.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_types.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_version.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_video.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/SDL_vulkan.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/begin_code.h"
    "/home/zen/Documents/izg/SDL2-2.0.10/include/close_code.h"
    "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/include/SDL_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/sdl2.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/zen/Documents/izg/cmake-build-debug/SDL2-2.0.10/sdl2-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/aclocal/sdl2.m4")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/aclocal" TYPE FILE FILES "/home/zen/Documents/izg/SDL2-2.0.10/sdl2.m4")
endif()

