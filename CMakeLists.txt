cmake_minimum_required(VERSION 3.20)
project(GameEngine CXX C)

include(FetchContent) 

find_package(glfw3 QUIET) 
find_package(glm QUIET)
find_package(assimp QUIET)

#GLFW 
if(NOT glfw3_FOUND)
	FetchContent_Declare(glfw GIT_REPOSITORY https://github.com/glfw/glfw.git GIT_TAG 3.3.8)
	FetchContent_MakeAvailable(glfw)
endif() 

#GLM
if(NOT glm_FOUND) 
	FetchContent_Declare(glm GIT_REPOSITORY https://github.com/g-truc/glm.git) 
	FetchContent_MakeAvailable(glm)
endif() 

#Assimp
if(NOT assimp_FOUND)
	FetchContent_Declare(assimp GIT_REPOSITORY https://github.com/assimp/assimp.git)
	FetchContent_MakeAvailable(assimp)
endif()

set(CPP_SOURCES 
    src/main.cpp 
    src/camera.cpp 
    src/mesh.cpp 
	src/model.cpp 
	src/shader.cpp 
	src/texture.cpp 
	src/window.cpp 
	src/skybox.cpp 
	src/grid.cpp
    src/entity.cpp
)

add_library(glad STATIC src/glad.c)
target_include_directories(glad PUBLIC includes)

add_executable(enginetest ${CPP_SOURCES})

target_compile_options(enginetest PRIVATE -Werror -Wall -Wpedantic -O0 -g)

target_compile_features(enginetest PRIVATE cxx_std_20)

target_include_directories(enginetest PRIVATE includes)

if(UNIX)
    target_link_libraries(enginetest PRIVATE glad glfw GL assimp dl) 
elseif(WIN32)
	target_link_libraries(enginetest PRIVATE glad glfw opengl32 assimp) 
else() 
    message(FATAL_ERROR "No compatibility with system")
endif()





