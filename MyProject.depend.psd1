@{
    Pester       = @{
        Target     = 'CurrentUser'
        Version    = '5.5.0'
        Parameters = @{
            SkipPublisherCheck = $true
            Import             = $true
        }
    }
    BuildHelpers = @{
        Target     = 'CurrentUser'
        Version    = '2.0.16'
        Parameters = @{
            Import = $true
        }
    }
    InvokeBuild  = @{
        Target     = 'CurrentUser'
        Version    = '5.10.4'
        Parameters = @{
            Import = $true
        }
    }
}