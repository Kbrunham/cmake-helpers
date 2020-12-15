macro(build_project_msg)
    message(STATUS "INFO: Building project ${PROJECT_NAME} from toplevel project ${CMAKE_PROJECT_NAME}")
endmacro()


macro(project_add_test TESTNAME FILES LIBRARIES)
    # Create the executable for the test
    add_executable(${TESTNAME} ${FILES})

    if (ENABLE_SANITIZERS)
        add_sanitizers(${TESTNAME})
    endif()
    
    # Link all google test libs and the specified libraires. Use the default GoogleTest main.
    target_link_libraries(${TESTNAME} gtest gmock gtest_main ${LIBRARIES})
    
    # Self discover tests using gtest_discover_tests
    # see https://cmake.org/cmake/help/v3.10/module/GoogleTest.html for more options to pass to it
    gtest_discover_tests(${TESTNAME}
        # set a working directory so your project root so that you can find test data via paths relative to the project root
        WORKING_DIRECTORY ${PROJECT_DIR}
        PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}"
    )
    set_target_properties(${TESTNAME} PROPERTIES FOLDER tests)
endmacro()
