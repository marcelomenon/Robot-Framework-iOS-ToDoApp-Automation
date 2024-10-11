*** Settings ***
Resource          ../resources/import.robot
Variables         ../resources/config/env_config.yaml

*** Keywords ***
Open App
    Open Application    remote_url=${remote_url}
    ...                 platformVersion=${platformVersion}
    ...                 platformName=${platformName}
    ...                 deviceName=${deviceName}
    ...                 automationName=${automationName}
    ...                 app=${app}
    ...                 newCommandTimeout=${newCommandTimeout}
    ...                 launchTimeout=${launchTimeout}
    ...                 noReset=${noReset}
