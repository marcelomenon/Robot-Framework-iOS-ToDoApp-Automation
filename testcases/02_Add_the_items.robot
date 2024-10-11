*** Settings ***
Resource          ../resources/import.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/action_keywords.robot
Suite Setup       Open App
Suite Teardown    Close All Applications

*** Test Cases ***
Add the items
    Add the first item
    Add the second item
    Add the third item
