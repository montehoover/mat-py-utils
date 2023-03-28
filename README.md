# mat-py-utils
Scripts for easy matlab-python interface.

## How to activate Python env in Matlab
Open Matlab and run the following command in the Matlab terminal to set its Python env to point to the location your virtualenv:
```
>> pyenv('Version', 'C:\Users\monte\miniconda3\envs\v3d_fantalgo_21\python.exe')
```
(This python env will persist in future Matlab sessions, so you only need to do this once.)  

## How to debug between Matlab and Python

We can step through the Matlab code with the Matlab debugger, but this doesn't step through our Python code. In order to seamlessly debug between the two environments, we can use VS Code's Python debugger.

1. Download VS Code (https://code.visualstudio.com/) and the Python extension that includes the debugger (https://marketplace.visualstudio.com/items?itemName=ms-python.python).

2. Confirm that within this repo `.vscode/launch.json` contains the following section:
    ```json
    {
        "name": "Attach to running Matlab process",
        "type": "python",
        "request": "attach",
        "processId": "${command:pickProcess}",
        "justMyCode": true
    }
    ```
    This section adds an option to the debugger menu (1) that says "Attach to running Matlab process" (2):
    ![](images/debugger.png)  

3. In order to step through the python code, add a breakpoint to the first line of code within a python function by clicking to the left of the line number and adding a small red dot: 
    ![](images/breakpoint.png)   

4. Open the debugger menu, select the "Attach to running Matlab process" option, and click the green triangle to initiate the debugger attachment (see image from step 2).

5. In the dropdown menu of all possible processes to attach to, select MATLAB.exe. Type "matlab" in the text box to bring it to the top. If there are more than one instances of Matlab running, execute `>> pyenv` in the Matlab terminal to show the process ID.
    ![](images/debugger-process.png)  

6. Switch to Matlab, execute the Matlab script that calls into Python and you will notice that it hangs. Switch back to VS Code and you can see that the debugger has stopped on the line where you set the breakpoint. From here you can step through Python code, examine the variables in the panel at the left, or execute Python code in the Debug Console at the bottom.
    ![](images/debugger-pytorch.png)