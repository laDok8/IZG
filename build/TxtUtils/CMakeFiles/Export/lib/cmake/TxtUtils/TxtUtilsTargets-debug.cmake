#----------------------------------------------------------------
# Generated CMake target import file for configuration "DEBUG".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "TxtUtils::TxtUtils" for configuration "DEBUG"
set_property(TARGET TxtUtils::TxtUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(TxtUtils::TxtUtils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libTxtUtilsd.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS TxtUtils::TxtUtils )
list(APPEND _IMPORT_CHECK_FILES_FOR_TxtUtils::TxtUtils "${_IMPORT_PREFIX}/lib/libTxtUtilsd.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
