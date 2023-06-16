# pointer_analysis

1. The test suite used for the experiment can be found in
https://github.com/llvm/llvm-test-suite

Within the /cmake/caches the .cmake files for optimization levels O0,O2,O3,Os,Oz is given, has to create O1.cmake with following code and
set(CMAKE_BUILD_TYPE "Debug"CACHE STRING "") 
set(CMAKE_C_FLAGS_DEBUG "-O1" CACHE STRING "") 
set(CMAKE_CXX_FLAGS_DEBUG "-O1" CACHE STRING "")

2. The test-suite-builds obtained are used to apply the alias evaluation using different alias analysis methods. For that run.sh file is used which generates op-<optimization level> folders. These files within this includes all data related to the first phase of the experiment
3. Evaluation.ipynb consists of the code to evaluate the results and generate the required tables for the study.
4. To run the second phase of the experiment you have to first install python and the lit package and execute the optimizer.sh file. This copies the O0 level compiled llvm test suite and apply AA and optimizations on that then executes the test suite using the lit. The results are in results.json and each file is copied to the results folder.
5. The results .json only consist of the file wise execution details. Use exec_time_retrieval.sh to execute the file compare.py in a loop to retrieve all the required details.
6. For the execution results of combined optimization execute combined-optimier.sh which will copy the results.json s to combined_opt_results directory.Same as above compare.py is used to retrieve execution times.
7. All the files except from the LLVM-test suite are created by me.
  
  Details about file structure
./pointer_analysis/first_phase contain files related to the first phase. Within that test-suite-build-<op> directories are different levels of compilations for llvm-test-suite. And ./pointer_analysis/first_phase/op-<optimization level> contains AA methods wise analysis for each files and summary.txt contains the summaries.
./pointer_analysis/second_phase contain files related to the second phase. The result.jsons are summaries of each execution and the results of the executions are in results directories.
