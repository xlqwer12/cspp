file(GLOB_RECURSE tests_SRCS *.cpp *.cxx *.cc *.C *.c *.h *.hpp)
set(tests_LIBS "")
set(tests_BIN ${TOP_NAMESPACE}-test)

add_executable(${tests_BIN} ${tests_SRCS})
target_link_libraries(${tests_BIN} ${tests_LIBS})
