# Setup brpc
configure_file("${PROJECT_SOURCE_DIR}/cmake/CMakeLists.download_brpc.in" ${PROJECT_BINARY_DIR}/_deps/brpc/CMakeLists.txt)


execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
                RESULT_VARIABLE result
                WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/_deps/brpc)

if(result)
  message(FATAL_ERROR "CMake step for brpc failed: ${result}")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} --build .
                RESULT_VARIABLE result
                WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/_deps/brpc)

if(result)
  message(FATAL_ERROR "Build step for brpc failed: ${result}")
endif()

add_subdirectory(${PROJECT_BINARY_DIR}/_deps/brpc/src
                 ${PROJECT_BINARY_DIR}/_deps/brpc/build
                 EXCLUDE_FROM_ALL)

set(BRPC_LIB brpc-static)
set(BRPC_INCLUDE_PATH  ${PROJECT_BINARY_DIR}/_deps/brpc/build/output/include)
