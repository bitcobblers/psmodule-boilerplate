[CmdletBinding()]
param()

$isVerbose = ($null -ne $PSBoundParameters['Verbose'])

if (-not (Get-Module -Name PSDepend)) {
    Install-Module -Name PSDepend -RequiredVersion 0.3.8 -Scope CurrentUser -Force -ErrorAction Stop
}

Import-Module -Name PSDepend -Force
Invoke-PSDepend -Path .\MyProject.depend.psd1 -Force -Verbose:$isVerbose