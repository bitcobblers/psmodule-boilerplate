$publicScripts = @(Get-ChildItem -Recurse -Include *.ps1 -Path $PSScriptRoot\public)
$privateScripts = @(Get-ChildItem -Recurse -Include *.ps1 -Path $PSScriptRoot\private)
$allScripts = $publicScripts + $privateScripts

foreach ($script in $allScripts) {
    try {
        Write-Verbose "Processing [$($script.FullName)]."
        . $script.FullName
    }
    catch {
        Write-Error "Unable to process [$($script.FullName)]: $_"
    }
}

foreach ($script in $publicScripts) {
    Write-Verbose "Exporting function [$($script.BaseName)]."
    Export-ModuleMember $script.BaseName
}
