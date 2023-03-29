<#
.SYNOPSIS
    This script displays a dialog box containing a checkbox list of PowerShell scripts 
    imported from an external URL. The user can select one or more scripts to run, and 
    then execute them in sequential order by clicking the "Run" button. An error message 
    is displayed if a script fails to execute. 

.DESCRIPTION
    This PowerShell script imports a list of PowerShell scripts from an external URL 
    specified in the $url variable. The scripts are added to a checkbox list control, 
    and the user can select one or more scripts to run by checking the corresponding 
    checkboxes. The selected scripts are executed in sequential order when the "Run" 
    button is clicked. If a script fails to execute, an error message is displayed.

.PARAMETER Url
    Specifies the URL of the text file containing the list of PowerShell scripts to import.

.EXAMPLE

    .\base-install.ps1 -Url "http://example.com/scripts.txt"


.NOTES
    Designer: kyle@mytech.today
    Coder: ChatGPT-4
    Created: 2023-03-29
    Updated: 2023-03-31 - Added progress bar, improved error handling, and accessibility

.LINK
    https://github.com/username/repo

#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [Uri]$Url
)

# Import list of PowerShell scripts from external URL in a .txt file
try {
    $scripts = Invoke-RestMethod -Uri $Url
} catch {
    Write-Error "Error importing script list from URL: $Url`nError message: $_"
    exit
}

# Create a checkbox list control for the script names
$checkBoxList = New-Object System.Windows.Forms.CheckedListBox
$checkBoxList.Location = New-Object System.Drawing.Point(10,10)
$checkBoxList.Size = New-Object System.Drawing.Size(200,200)

# Add the script names to the checkbox list
foreach ($script in $scripts) {
    $checkBoxList.Items.Add($script) | Out-Null
}

# Create a "Run" button
$runButton = New-Object System.Windows.Forms.Button
$runButton.Location = New-Object System.Drawing.Point(10,220)
$runButton.Size = New-Object System.Drawing.Size(100,30)
$runButton.Text = "Run"
$runButton.Add_Click({
    # Initialize progress bar
    $progressBar.Maximum = $selectedScripts.Count
    $progressBar.Value = 0

    # Execute the check-marked scripts in sequential order
    $i = 1
    foreach ($script in $selectedScripts) {
        try {
            # Update progress bar
            $progressBar.Value = $i

            # Execute script
            & $script
        } catch {
            # Display an error message if a script fails to execute
            [System.Windows.Forms.MessageBox]::Show("Error executing script: $script`nError message: $_", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        } finally {
            # Update progress bar
            $progressBar.Value = $i++
        }
    }

    # Close the dialog box
    $form.Close()
})

# Create a "Cancel" button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(120,220)
$cancelButton.Size = New-Object System.Drawing.Size(100,30)

