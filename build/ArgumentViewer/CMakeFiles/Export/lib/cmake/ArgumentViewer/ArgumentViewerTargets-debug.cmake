#----------------------------------------------------------------
# Generated CMake target import file for configuration "DEBUG".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ArgumentViewer::ArgumentViewer" for configuration "DEBUG"
set_property(TARGET ArgumentViewer::ArgumentViewer APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ArgumentViewer::ArgumentViewer PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libArgumentViewerd.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ArgumentViewer::ArgumentViewer )
list(APPEND _IMPORT_CHECK_FILES_FOR_ArgumentViewer::ArgumentViewer "${_IMPORT_PREFIX}/lib/libArgumentViewerd.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
