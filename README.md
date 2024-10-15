# Robot Framework iOS ToDoApp Automation

---

## Table of Contents
- [Overview](#overview)
- [How to run the automation](#how-to-run-the-automation)
- [Test Cases](#test-cases)
- [Setup and Installation](#setup-and-installation)

## Overview
This automation mobile testing project is developed using Robot Framework to test the iOS ToDoApp.

The iOS ToDoApp is available at https://github.com/marcelomenon/todo-app

## How to run the automation
Run the command `appium --base-path /wd/hub` to start the Appium.

To run the test cases just use the "Run" in the VSCode.

## Test Cases
- **Test Case 01:** Verify the home user interface.
- **Test Case 02:** Add the items.
- **Test Case 03:** Checkmark the items.
- **Test Case 04:** Delete the items.

## Setup and Installation

**Install Xcode - Version 15.2 (15C500b)**

**Install Visual Studio Code - Version: 1.88.0 (Universal)**

**Install Brew (https://brew.sh/)**

**Install Node (https://nodejs.org/en)**

**Install Appium - Version 2.5.1**

- `sudo npm install -g appium`

- Do NOT install the Appium Server GUI (https://github.com/appium/appium-desktop) because it is deprecated and the webdriveragent is not compatible with Xcode

**Install Xcuitest Appium Driver - Version 7.3.1**

- `sudo appium driver install xcuitest`

**Install Python (https://www.python.org/downloads/) - Version 3.12.2**

- `python3 -V`

**Install Robot Framework - Version 7.0**

- `pip3 install robotframework`

**Install Robot Framework Selenium Library**

- `pip3 install --upgrade robotframework-seleniumlibrary`

**Setup Webdriver Agent for iOS in the Xcode**

- find . -name "appium-webdriveragent"
- find: ./.Trash: Operation not permitted
- ./.appium/node_modules/appium-xcuitest-driver/node_modules/appium-webdriveragent
- open ./.appium/node_modules/appium-xcuitest-driver/node_modules/appium-webdriveragent

- Open the file WebDriverAgent.xcodeproj
- In the Xcode select WebDriverAgentRunner and the simulator (ex: iPhone 15 Pro)
- Xcode - Settings - Accounts and make sure the Apple ID is set 

- Change the Bundle Identifier for the WebDriverAgentRunner to com.facebooks.WebDriverAgentRunners
- Keep the Bundle Identifier for the WebDriverAgentLib to com.facebook.WebDriverAgentLib
- Change the Bundle Identifier for the IntegrationApp to com.facebooks.IntegrationApps

- Important: If the WebDriverAgent.xcodeproj is locked we need to change the folder permissions, it happened because the Appium was installed using the command sudo and the Xcode do not has permissions to access the Appium folder.
- Try first open ./.appium/node_modules/appium-xcuitest-driver/node_modules and double right click on the folder appium-webdriveragent, click on Get Info and at the bottom change to “Apply to enclosed items”.
- If it is still locked try open ./.appium and double right click on the folder node_modules, click on Get Info and at the bottom change to “Apply to enclosed items”.

- Run the build for the WebDriverAgentRunner - Build Succeded
- Run the build for the WebDriverAgentLib - Build Succeded
- Run the build for the IntegrationApp - Build Succeded
- Product and Run for the IntegrationApp - Simulator is opened successfully 

**Visual Studio Code with RobotCode**

- https://docs.robotframework.org/docs/getting_started/ide#visual-studio-code
- Open Visual Studio Code
- Click on Extensions icon or press Ctrl + Shift + X
- Search for RobotCode and click on it
- Click on Install

**Install the Robot Framework Appium Library**

- `pip3 install robotframework-appiumlibrary`
- Successfully installed Appium-Python-Client-4.0.0 decorator-5.1.1 docutils-0.20.1 kitchen-1.2.6 robotframework-appiumlibrary-2.0.0 six-1.16.0

**Fix the Appium Library errors in the VSCode**

- Unresolved library: AppiumLibrary. Error generating libspec: Importing library 'AppiumLibrary' failed: ModuleNotFoundError: No module named 'appium.webdriver.common.touch_action'. Consider adding the needed paths to the "robot.pythonpath" setting and calling the "Robot Framework: Clear caches and restart" action.
- https://forum.robotframework.org/t/unable-to-import-robotframework-appiumlibrary-even-after-successful-installation-in-pycharm/6990/5

- It says AppiumLibrary (rf bindings) cannot import TouchAction from appium itself. So, next we need to check what Appium-Python-Client is used, pip3 list displays version 4.0.0.

- `pip3 list`
```
Package                        Version
------------------------------ -----------
Appium-Python-Client           4.0.0
attrs                          23.2.0
certifi                        2024.2.2
decorator                      5.1.1
docutils                       0.20.1
h11                            0.14.0
idna                           3.6
kitchen                        1.2.6
outcome                        1.3.0.post0
packaging                      24.0
pillow                         10.2.0
pip                            24.0
psutil                         5.9.8
Pygments                       2.17.2
Pypubsub                       4.0.3
PySocks                        1.7.1
robotframework                 7.0
robotframework-appiumlibrary   2.0.0
robotframework-pythonlibcore   4.3.0
robotframework-ride            2.0.8.1
robotframework-seleniumlibrary 6.2.0
selenium                       4.18.1
six                            1.16.0
sniffio                        1.3.1
sortedcontainers               2.4.0
trio                           0.25.0
trio-websocket                 0.11.1
typing_extensions              4.10.0
urllib3                        2.2.1
wsproto                        1.2.0
wxPython                       4.2.1
```

- TouchAction is removed in 4.0.0 release, the error is saying that TouchAction cannot be imported so the issue is that AppiumLibrary pulls in too new appium (eg, bug in its dependencies) and its not updated to handle the changes in the upstream.

- Solution:
- Install the old version Appium-Python-Client. Something like this might fix your issue:

- `python3 -mpip install --force-reinstall Appium-Python-Client==3.2.1`
- Successfully uninstalled Appium-Python-Client-4.0.0. Successfully installed Appium-Python-Client-3.2.1

- `pip3 list`
```
Package                        Version
------------------------------ -----------
Appium-Python-Client           3.2.1
attrs                          23.2.0
certifi                        2024.2.2
decorator                      5.1.1
docutils                       0.20.1
h11                            0.14.0
idna                           3.6
kitchen                        1.2.6
outcome                        1.3.0.post0
packaging                      24.0
pillow                         10.2.0
pip                            24.0
psutil                         5.9.8
Pygments                       2.17.2
Pypubsub                       4.0.3
PySocks                        1.7.1
robotframework                 7.0
robotframework-appiumlibrary   2.0.0
robotframework-pythonlibcore   4.3.0
robotframework-ride            2.0.8.1
robotframework-seleniumlibrary 6.2.0
selenium                       4.19.0
six                            1.16.0
sniffio                        1.3.1
sortedcontainers               2.4.0
trio                           0.25.0
trio-websocket                 0.11.1
typing_extensions              4.10.0
urllib3                        2.2.1
wsproto                        1.2.0
wxPython                       4.2.1
```

**Appium Inspector Installation**

- https://appium.github.io/appium-inspector/latest/quickstart/installation/

- There is also an alternative approach which uses the command line. Run the following command:

- `xattr -cr "/Applications/Appium Inspector.app"`

- After this, opening the app should not produce any warnings anymore.

**Appium Inspector Error**

- Failed to create session. An unknown server-side error occurred while processing the command. Original error: Could not determine iOS SDK version: Command 'xcrun --sdk iphonesimulator --show-sdk-version' exited with code 1: xcrun: error: SDK "iphonesimulator" cannot be located xcrun: error: SDK "iphonesimulator" cannot be located xcrun: error: unable to lookup item 'SDKVersion' in SDK 'iphonesimulator'

- Solution:

- https://github.com/appium/appium/issues/6743?ref=quinngil.com

- The problem solved for me by doing these 2 commands:

- `sudo /usr/bin/xcode-select -switch /Applications/Xcode.app/Contents/Developer`
- `xcrun --sdk iphonesimulator --show-sdk-version`

**Another Appium Inspector Error**

- [LOG FAIL] Variable '${remote_url}' not found.
- Using YAML variable files requires PyYAML module to be installed.
- Typically you can install it by running `pip install pyyaml`.
- `pip3 install pyyaml`
- Successfully installed pyyaml-6.0.1
- https://help.perfecto.io/perfecto-help/content/kb/automation/xpath_2_0_updates___workarounds.htm

**Set Python virtual environment**

- `python3 -V`
- Python 3.12.2

- `pip3 -V`
- pip 24.0 from /Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12/site-packages/pip (python 3.12)

- Verify if the Path was already added during the Python installation

- `vi .zprofile`
```
# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH
~                                                                                                                     
~        
```
- Type i after ESC and :q to close the editor without save


- `echo $PATH`
```
Library/Frameworks/Python.framework/Versions/3.12/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
```

- `pip3 list`
```
Package                        Version
------------------------------ -----------
Appium-Python-Client           3.2.1
attrs                          23.2.0
certifi                        2024.2.2
decorator                      5.1.1
docutils                       0.20.1
h11                            0.14.0
idna                           3.6
kitchen                        1.2.6
outcome                        1.3.0.post0
pip                            24.0
PySocks                        1.7.1
robotframework                 7.0
robotframework-appiumlibrary   2.0.0
robotframework-pythonlibcore   4.3.0
robotframework-seleniumlibrary 6.2.0
selenium                       4.18.1
six                            1.16.0
sniffio                        1.3.1
sortedcontainers               2.4.0
trio                           0.25.0
trio-websocket                 0.11.1
typing_extensions              4.10.0
urllib3                        2.2.1
wsproto                        1.2.0
```

- `type python3`
- python3 is /Library/Frameworks/Python.framework/Versions/3.12/bin/python3
- `type pip3`   
- pip3 is /Library/Frameworks/Python.framework/Versions/3.12/bin/pip3
- `which python3`
- /Library/Frameworks/Python.framework/Versions/3.12/bin/python3


- In the VSCode terminal in the folder project type:
- `python3 -m venv env`

- A new env folder is created and in the VSCode type Shift Command P and in the search type Python Select Interpreter

- Select the new env 

- In the VSCode terminal in the folder project type:
- `source env/bin/activate`

- `pip3 list`
```
(env) marcelomenon@FFPTMFG40P0Q05Q robotframework_automation % pip3 list
Package Version
------- -------
pip     24.0
```

- In the VSCode terminal type:
- `pip3 install robotframework`
- (env) marcelomenon@FFPTMFG40P0Q05Q robotframework_automation % pip3 install robotframework
- `pip3 install --upgrade robotframework-seleniumlibrary`
- (env) marcelomenon@FFPTMFG40P0Q05Q robotframework_automation % pip3 install --upgrade robotframework-seleniumlibrary
- `pip3 install robotframework-appiumlibrary`
- (env) marcelomenon@FFPTMFG40P0Q05Q robotframework_automation % pip3 install robotframework-appiumlibrary
- `pip3 list`
- (env) marcelomenon@FFPTMFG40P0Q05Q robotframework_automation % pip3 list
```                                         
Package                        Version
------------------------------ -----------
Appium-Python-Client           3.2.1
attrs                          23.2.0
certifi                        2024.2.2
decorator                      5.1.1
docutils                       0.20.1
h11                            0.14.0
idna                           3.6
kitchen                        1.2.6
outcome                        1.3.0.post0
pip                            24.0
PySocks                        1.7.1
robotframework                 7.0
robotframework-appiumlibrary   2.0.0
robotframework-pythonlibcore   4.4.0
robotframework-seleniumlibrary 6.2.0
selenium                       4.19.0
six                            1.16.0
sniffio                        1.3.1
sortedcontainers               2.4.0
trio                           0.25.0
trio-websocket                 0.11.1
typing_extensions              4.10.0
urllib3                        2.2.1
wsproto                        1.2.0
```

**Reference links:**

- Set Up Python Virtual Environment In Visual Studio Code (VS Code) On Mac | VSCode activate venv (https://www.youtube.com/watch?v=og0Oz0_lStM)

- Selecting the correct Python interpreter in VSCode's Python Extension (https://www.youtube.com/watch?v=GqTsFOtZiQI)

- HOW TO! Install Robot Framework and Appium on MacOS (https://www.youtube.com/watch?v=9Dl2Hfl6Dhg)
 
- Robot Framework Tutorial #4 - Create New Robot Framework Automation Project (https://www.youtube.com/watch?v=ZV47LblOeYA)

- https://stackoverflow.com/questions/72379118/error-generating-libspec-when-trying-to-import-python-libraries-into-robot-fram

- https://stackoverflow.com/questions/71931370/robotframework-some-libraries-are-not-imported/72324894#72324894

# Robot Framework iOS ToDoApp Automation
