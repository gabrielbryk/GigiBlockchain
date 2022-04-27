cmake_minimum_required(VERSION 3.15)

project(gigiblockchain)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -pthread")


set(Boost_USE_STATIC_LIBS OFF) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_USE_STATIC_RUNTIME OFF) 
find_package(Boost 1.58.0 COMPONENTS system) 


# load in pkg-config support
find_package(PkgConfig)
# use pkg-config to get hints for 0mq locations
pkg_check_modules(PC_ZeroMQ QUIET zmq)

#use the hint from above to find where 'zmq.hpp' is located
find_path(ZeroMQ_INCLUDE_DIR
        NAMES zmq.hpp
        PATHS ${PC_ZeroMQ_INCLUDE_DIRS}
        )

## use the hint from about to find the location of libzmq
find_library(ZeroMQ_LIBRARY
        NAMES zmq
        PATHS ${PC_ZeroMQ_LIBRARY_DIRS}
        )


# Find required protobuf package
find_package(Protobuf REQUIRED)

# Print version messages
if(Protobuf_FOUND)
    message(STATUS "Using Protocol Buffers ${Protobuf_VERSION}")
endif()

set(PROTO_SRC_DIR ${CMAKE_CURRENT_BINARY_DIR}/proto-src)
file(MAKE_DIRECTORY ${PROTO_SRC_DIR})
include_directories(${PROTO_SRC_DIR})

# Get the filenames of all the proto files.
file(GLOB PROTO_FILES ${CMAKE_CURRENT_SOURCE_DIR}/protos/*.proto)


foreach(proto ${PROTO_FILES})
    # Get filename without extension
    get_filename_component(PROTO_NAME_WE ${proto} NAME_WE)
    get_filename_component(PROTO_NAME ${proto} NAME)
    message(STATUS "Generating Protobuf Code for ${PROTO_NAME}")
    protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS ${proto})
    add_library(${PROTO_NAME_WE} STATIC ${PROTO_SRCS} ${PROTO_SRC_DIR} ${PROTO_HDRS})
    target_include_directories(${PROTO_NAME_WE} PUBLIC ${Protobuf_INCLUDE_DIRS})
endforeach()

include_directories(${CMAKE_BINARY_DIR}/protos)


set(SOURCE_FILES
        src/daemon.cpp
        src/Peer.hpp
        src/Block.hpp
        src/BlockChain.hpp
        src/common.hpp
        src/hash.hpp
        src/json.hh)



if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS}) 
    add_executable(daemon ${SOURCE_FILES} ${PROTO_SRCS})
    target_include_directories(daemon PUBLIC ${ZeroMQ_INCLUDE_DIR} ${Protobuf_LIBRARIES})
    target_link_libraries(daemon PUBLIC ${Boost_LIBRARIES} ${ZeroMQ_LIBRARY} libpthread.so.0 ${Protobuf_INCLUDE_DIRS}) 
endif()

# Generate header and source files for all the proto files

