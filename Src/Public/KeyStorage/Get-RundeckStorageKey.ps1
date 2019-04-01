function Get-RundeckStorageKey
{
    <#
        .SYNOPSIS
        List storage keys and directories at the specified location

        .PARAMETER Path
        Define the directory path of your key storage

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Get-RundeckStorageKey

        .EXAMPLE
        PS C:\> Get-RundeckStorageKey -Path 'ANVILS-ONLINE'

        .EXAMPLE
        PS C:\> Get-RundeckStorageKey -Path @('ANVILS-ONLINE', 'E-OPTIONS')

        .EXAMPLE
        PS C:\> Get-RundeckStorageKey -Path @('ANVILS-ONLINE', 'E-OPTIONS') -Detail

        .OUTPUTS
        System.Object

        .OUTPUTS
        RundeckStorageKey

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckStorageKey.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
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
            if ($Raw) { $requestData } else { [RundeckStorageKey[]]$requestData.resources }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
