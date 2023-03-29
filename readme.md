## SYNOPSIS

    This script displays a dialog box containing a checkbox list of PowerShell scripts 
    imported from an external URL. The user can select one or more scripts to run, and 
    then execute them in sequential order by clicking the "Run" button. An error message 
    is displayed if a script fails to execute. 

## DESCRIPTION

    This PowerShell script imports a list of PowerShell scripts from an external URL 
    specified in the $url variable. The scripts are added to a checkbox list control, 
    and the user can select one or more scripts to run by checking the corresponding 
    checkboxes. The selected scripts are executed in sequential order when the "Run" 
    button is clicked. If a script fails to execute, an error message is displayed.

## PARAMETER Url

    Specifies the URL of the text file containing the list of PowerShell scripts to import.

## EXAMPLE

```cmd
    .\base-install.ps1 -Url "http://example.com/scripts.txt"
```

## PARAMETERS

```text
    "https://example.com/scripts.txt" =  https://example.com/script1.ps1
                                         https://example.com/script2.ps1
                                         https://example.com/script3.ps1
                                         https://example.com/script4.ps1
```

## NOTES

    Designer: kyle@mytech.today
    Coder: ChatGPT-4
    Created: 2023-03-29
    Updated: 2023-03-29 - initial version
    Version: 0.1
    File: ps-script-initiator.ps1

## LINK

    https://github.com/mytech-today-now/ps-script-initiator

---
