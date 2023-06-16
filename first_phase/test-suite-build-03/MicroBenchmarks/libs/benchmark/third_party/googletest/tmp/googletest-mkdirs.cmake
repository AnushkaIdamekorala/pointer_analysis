# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/MicroBenchmarks/libs/benchmark/googletest"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/build"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/tmp"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/src/googletest-stamp"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/download"
  "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/src/googletest-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/src/googletest-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/anushkaidamekorala/Documents/UVA_coursework/Compilers/test-suite/test-suite-build/MicroBenchmarks/libs/benchmark/third_party/googletest/src/googletest-stamp${cfgdir}") # cfgdir has leading slash
endif()
