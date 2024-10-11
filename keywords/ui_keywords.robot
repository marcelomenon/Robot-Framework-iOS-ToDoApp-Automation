*** Settings ***
Resource          ../resources/import.robot
Variables         ../resources/test_data/home_locators.yaml

*** Keywords ***
Verify the home title
    Element Should Be Visible    ${title}

Verify the home description
    Element Should Be Visible    ${description}

Verify the home add button
    Element Should Be Visible    ${add_item}
