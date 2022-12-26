# Requirements:
1. Install Python 3.11
2. Once installed clone the repository "PyRobofw" & install the python package below from the command line  
-**pip install robotframework**  
-**pip install --upgrade robotframework-seleniumlibrary**  
-**pip install -U robotframework-pabot**  

3. If you are using PyCharm IDE, install the plugin "**Robot Framework Language Server**" by Robocorp for syntax highlights.    
4. To run the test cases you can use any of the below commands:  
**robot  .\testCases\<test_case_name>.robot** to run a single test.  
**robot .\testCases\*.robot** to run all the tests  
**robot --i smoke .\testCases\<test_case_name>.robot** to run a single test with a tag name "smoke"  
**pabot --processes 2 --testlevelsplit .\testCases\<test_case_name>.robot** to run tests in parallel.
