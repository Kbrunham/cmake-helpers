# CMake Helper Scripts

Collection of CMake helper scripts for projects

## Getting Started
### Add as a submodule
Add this repo as a submodule to your project. 

`git submodule add https://github.com/kbrunham/cmake_helpers.git extern/cmake-helpers
git submodule update --init --recursive
`

### Include bcommon
Include the bcommon script inside your toplevel CMakeLists.txt
`
cmake_minimum_required (VERSION 3.8)

project (cmake_example
	VERSION 1.0
	DESCRIPTION "Git Lab and CLion Play"
	LANGUAGES CXX
)

\# Set the minimum required C++ standard.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


\# Only process these if this is the toplevel
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

    # Include build common macros
    message("INFO: Including CMake bcommon")
    include("${CMAKE_CURRENT_SOURCE_DIR}/extern/cmake-helpers/bcommon.cmake")

	# Add targets and libraries...

endif()
`

#### Using bcommon::project_add_test
Add a new GoogleTest test executable to a project using this macro. This requires that you've already added GoogleTest and CTest. Once done you can easily add tests using:

`
    project_add_test(
        # Exe name
        main_test1 

        # Source files. Semicolon separated
        "test_main.cpp"

        # Libs. Space separated
        Boost::headers
    )
`

### Print target variables
Useful to help debug CMake scripts, you can dump all properties for a project

`
message("Properties for main")
include("${CMAKE_CURRENT_SOURCE_DIR}/extern/cmake-helpers/print_properties.cmake")
print_target_properties(main)
message("End properties")
`

## Contributing
Feedback and contributions are always welcome. Send me a pull request with any changes.

## License
All code is MIT licese. Where applicable I've also added attribution to where I found the code used.

