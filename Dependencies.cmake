include(cmake/CPM.cmake)

function(add_external_dependencies)

CPMAddPackage(
  NAME trantor
  GITHUB_REPOSITORY an-tao/trantor
  GIT_TAG master
  OPTIONS
  "BUILD_TESTING OFF" "BUILD_SHARED_LIBS OFF" "CMAKE_POSITION_INDEPENDENT_CODE ON"
)

if (trantor_ADDED)
  add_library(Trantor::Trantor ALIAS trantor)
endif()

CPMAddPackage(
  NAME jsoncpp
  GITHUB_REPOSITORY open-source-parsers/jsoncpp
  GIT_TAG 1.9.5
  OPTIONS
  "JSONCPP_WITH_POST_BUILD_UNITTEST OFF" "JSONCPP_WITH_TESTS OFF" "BUILD_SHARED_LIBS OFF" "BUILD_OBJECT_LIBS OFF" "BUILD_STATIC_LIBS ON"
  "CMAKE_POSITION_INDEPENDENT_CODE ON"
 )

if (jsoncpp_ADDED)
  add_library(jsoncpp INTERFACE)
  target_link_libraries(jsoncpp INTERFACE jsoncpp_static)
  target_include_directories(jsoncpp INTERFACE ${jsoncpp_SOURCE_DIR}/include ${jsoncpp_BINARY_DIR}/include)
endif()

if(BUILD_YAML_CONFIG)
  CPMAddPackage(
    NAME yaml-cpp
    VERSION 0.8.0  
    GITHUB_REPOSITORY jbeder/yaml-cpp
    GIT_TAG 0.8.0
    OPTIONS
    "BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS}"
    "CMAKE_POSITION_INDEPENDENT_CODE ON"
    )
endif()

CPMAddPackage(
  NAME ZLIB
  VERSION 1.3
  GITHUB_REPOSITORY madler/zlib
  GIT_TAG v1.3
  OPTIONS
  "CMAKE_POSITION_INDEPENDENT_CODE ON"
)

if (ZLIB_ADDED)
  add_library(ZLIB::ZLIB ALIAS zlibstatic)
endif()

endfunction()
