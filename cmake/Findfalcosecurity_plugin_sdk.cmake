# Findfalcosecurity_plugin_sdk.cmake - Locate the Falco Security Plugin SDK
# Provides the imported target: falcosecurity::plugin_sdk

find_path(FALCOSECURITY_PLUGIN_SDK_INCLUDE_DIR
  NAMES falcosecurity/sdk.h
  PATHS
  ${CMAKE_CURRENT_LIST_DIR}/../include
  /usr/local/include
  /usr/include
  # temp
  /home/ubuntu/src/plugin-sdk-cpp.git/cmake-findpackage/include
  ENV CMAKE_PREFIX_PATH
)

if (FALCOSECURITY_PLUGIN_SDK_INCLUDE_DIR)
  # Library found
  set(FALCOSECURITY_PLUGIN_SDK_FOUND TRUE)

  # Define the imported target
  add_library(falcosecurity_plugin_sdk INTERFACE)

  # Set include directories for the target
  target_include_directories(falcosecurity_plugin_sdk INTERFACE ${FALCOSECURITY_PLUGIN_SDK_INCLUDE_DIR})

  # Enforce C++17 for users of the SDK
  target_compile_features(falcosecurity_plugin_sdk INTERFACE cxx_std_17)

  # Optionally alias the target to a namespaced one
  add_library(falcosecurity::plugin_sdk ALIAS falcosecurity_plugin_sdk)
else()
  # Library not found
  set(FALCOSECURITY_PLUGIN_SDK_FOUND FALSE)
endif()

mark_as_advanced(FALCOSECURITY_PLUGIN_SDK_INCLUDE_DIR)

