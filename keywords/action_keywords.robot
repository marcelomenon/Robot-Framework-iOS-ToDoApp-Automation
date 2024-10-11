*** Settings ***
Resource          ../resources/import.robot
Variables         ../resources/test_data/home_locators.yaml
Variables         ../resources/test_data/text_data.yaml

*** Keywords ***
Add the first item
    Element Should Be Visible    ${add_item}
    Click Element    ${add_item}
    Element Should Be Visible    ${type_text}
    Input Text    ${type_text}    ${text1}
    Element Should Be Visible    ${save}
    Click Element    ${save}
    Element Should Be Visible    ${text1}

Add the second item
    Element Should Be Visible    ${add_item}
    Click Element    ${add_item}
    Element Should Be Visible    ${type_text}
    Input Text    ${type_text}    ${text2}
    Element Should Be Visible    ${save}
    Click Element    ${save}
    Element Should Be Visible    ${text2}

Add the third item
    Element Should Be Visible    ${add_item}
    Click Element    ${add_item}
    Element Should Be Visible    ${type_text}
    Input Text    ${type_text}    ${text3}
    Element Should Be Visible    ${save}
    Click Element    ${save}
    Element Should Be Visible    ${text3}

Checkmark the first item
    Element Should Be Visible    ${text1}
    Click Element    ${text1}

Checkmark the second item
    Element Should Be Visible    ${text2}
    Click Element    ${text2}

Checkmark the third item
    Element Should Be Visible    ${text3}
    Click Element    ${text3}

Verify the checkmark1
#The keyword "Element Name Should Be" is the best option to verify the checkmark name in this case
    Element Name Should Be    ${checkmark1}    Selected

Verify the checkmark2
    Element Name Should Be    ${checkmark2}    Selected

Verify the checkmark3
    Element Name Should Be    ${checkmark3}    Selected

Delete the third item
    ${element_size}=    Get Element Size    ${item}
    ${element_location}=    Get Element Location    ${item}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}

Delete the second item
    ${element_size}=    Get Element Size    ${item}
    ${element_location}=    Get Element Location    ${item}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}

Delete the first item
    ${element_size}=    Get Element Size    ${item}
    ${element_location}=    Get Element Location    ${item}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}

Verify the empty list
    Element Should Be Visible    ${description}
