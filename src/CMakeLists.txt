file(GLOB_RECURSE project_SRCS *.cpp *.cxx *.cc *.C *.c *.h *.hpp)
set(project_LIBS "")  # ${Protobuf_INCLUDE_DIRS})
set(project_BIN ${TOP_NAMESPACE})

add_executable(${project_BIN} ${project_SRCS})
# or
# add_library(${project_BIN} SHARED ${project_SRCS})
target_link_libraries(${project_BIN} ${project_LIBS})
set_target_properties(${project_BIN} PROPERTIES
  VERSION "${APPLICATION_VERSION_MAJOR}.${APPLICATION_VERSION_MINOR}"
  OUTPUT_NAME ${project_BIN}
  CLEAN_DIRECT_OUTPUT 1
)

install(TARGETS ${project_BIN} DESTINATION "bin")
