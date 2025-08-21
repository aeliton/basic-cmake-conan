cmake_minimum_required(VERSION 3.28)

project(hello VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)

if (CMAKE_COMPILE_WARNING_AS_ERROR)
  if (MSVC)
    add_compile_options(/W4 /WX)
  else()
    add_compile_options(-Wall -Wextra -pedantic -Werror)
  endif()
endif()

find_package(spdlog REQUIRED)

add_library(brokenmath)
target_sources(brokenmath PRIVATE
 ${CMAKE_CURRENT_SOURCE_DIR}/src/brokenmath.cpp
)
target_include_directories(brokenmath PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(main
 ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

target_link_libraries(main PRIVATE brokenmath spdlog::spdlog)

find_package(GTest REQUIRED)

enable_testing()
add_executable (tests
  ${CMAKE_CURRENT_SOURCE_DIR}/tests/test_brokenmath.cpp
)
target_link_libraries(tests
  GTest::gtest_main
  brokenmath
)

include(GoogleTest)
gtest_discover_tests(tests)
