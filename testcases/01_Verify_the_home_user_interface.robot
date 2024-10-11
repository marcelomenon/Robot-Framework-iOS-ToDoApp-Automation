*** Settings ***
Resource          ../resources/import.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/ui_keywords.robot
Suite Setup       Open App
Suite Teardown    Close All Applications

*** Test Cases ***
Verify the home user interface
    Verify the home title
    Verify the home description
    Verify the home add button
