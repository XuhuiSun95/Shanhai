cmake_minimum_required(VERSION 3.15)

project(shanhai-engine)
set(SHANHAI_VERSION 0.0.1)

# option(INSTALL_SHANHAI "Enable installation of Shanhai engine" ON)
option(BUILD_SANDBOX "Builds the sandbox demo game" ON)

add_subdirectory(engine)

if(BUILD_SANDBOX)
  message("Building Sandbox.")
  add_subdirectory(sandbox)
endif()
