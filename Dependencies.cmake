set(CPM_USE_LOCAL_PACKAGES ON)
include(cmake/CPM.cmake)

function(add_external_dependencies)

CPMAddPackage(
  NAME trantor
  GITHUB_REPOSITORY an-tao/trantor
  GIT_TAG master
  OPTIONS
  "BUILD_TESTING OFF"
)
CPMFindPackage(
  NAME jsoncpp
  GITHUB_REPOSITORY open-source-parsers/jsoncpp
  GIT_TAG v1.9.5
  OPTIONS
  "JSONCPP_WITH_POST_BUILD_UNITTEST OFF" "JSONCPP_WITH_TESTS OFF" "BUILD_SHARED_LIBS OFF" "BUILD_STATIC_LIBS ON"
 
)


endfunction()
