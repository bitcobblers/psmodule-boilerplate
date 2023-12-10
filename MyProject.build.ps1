[CmdletBinding()]
param(
    [string]$Configuration = 'Debug',
    [string]$NuGetApiKey,
    [string]$PesterVersion = '5.5.0'
)

Enter-Build {
    Set-BuildEnvironment -Force
}

# Synopsis: Removes any previous build outputs.
Task Clean {
    dotnet clean .\src\MyProject.sln --configuration $Configuration
}

# Synopsis: Builds the module.
Task Build {
    dotnet restore .\src\MyProject.sln
    dotnet build --no-restore .\src\MyProject.sln --configuration $Configuration
}

# Synopsis: Runs the .net test suite.
Task Test_DotNet Build, {
    dotnet test --no-build .\src\MyProject.sln --configuration $Configuration
}

# Synopsis: Runs the PowerShell test suite.
Task Test_PowerShell Build, {
    $config = [PesterConfiguration]@{
        Run = @{
            Path = Join-Path $BuildRoot 'test'
        }
    }

    Invoke-Pester -Configuration $config
}

# Synopsis: Builds and runs all tests.
Task Test Test_DotNet, Test_PowerShell

# Synopsis: Builds and publishes package to NuGet.
Task Publish Build, Clean, {

}

# Synopsis: Builds the module.
Task . Build