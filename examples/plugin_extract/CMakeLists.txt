project(plugin_extract)
cmake_minimum_required(VERSION 3.31)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../cmake")

find_package(falcosecurity_plugin_sdk REQUIRED)

add_library(plugin SHARED
	plugin.cpp
)

target_link_libraries(plugin
PRIVATE
	falcosecurity::plugin_sdk
)
