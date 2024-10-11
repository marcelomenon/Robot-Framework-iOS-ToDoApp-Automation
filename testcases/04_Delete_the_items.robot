*** Settings ***
Resource          ../resources/import.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/action_keywords.robot
Suite Setup       Open App
Suite Teardown    Close All Applications

*** Test Cases ***
Delete the items
    Add the first item
    Add the second item
    Add the third item
    Checkmark the first item
    Checkmark the second item
    Checkmark the third item
    Verify the checkmark1
    Verify the checkmark2
    Verify the checkmark3
    Delete the third item
    Delete the second item
    Delete the first item
    Verify the empty list
