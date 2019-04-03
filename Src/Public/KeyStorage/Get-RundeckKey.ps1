function Get-RundeckKey
{
    <#
        .SYNOPSIS
        List storage keys and directories at the specified location

        .PARAMETER Path
        Define the directory path of your key storage

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Get-RundeckKey

        .EXAMPLE
        PS C:\> Get-RundeckKey -Path 'ANVILS-ONLINE'

        .EXAMPLE
        PS C:\> Get-RundeckKey -Path @('ANVILS-ONLINE', 'E-OPTIONS')

        .EXAMPLE
        PS C:\> Get-RundeckKey -Path @('ANVILS-ONLINE', 'E-OPTIONS') -Detail

        .OUTPUTS
        System.Object

        .OUTPUTS
        RundeckStorageKey

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckKey.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
    [OutputType( [RundeckStorageKeyMeta] )]
    [OutputType( [RundeckStorageKey[]] )]
    Param(
        [Parameter(
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.String[]]$Path = [System.String]::Empty,

        [Parameter(
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Switch]$Raw
    )

    begin
    {
        $functionName = $MyInvocation.MyCommand.Name
        Write-Verbose "[${functionName}] Function started"
    }

    process
    {
        # Create instance of the [RundeckRequest]
        $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)

        foreach ($storagePath in $Path)
        {
            # Build and send request
            $request.BuildEndpoint($storagePath)
            $requestData = $request.Get()

            # Return data
            if ($Raw)
            {
                $requestData
            }
            else
            {
                if ($requestData.resources)
                {
                    [RundeckStorageKey[]]$requestData.resources
                }
                else
                {
                    [RundeckStorageKeyMeta]$requestData.meta
                }

            }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
