function Get-RundeckStorageKey
{
    <#
        .SYNOPSIS
        List storage keys and directories at the specified location

        .PARAMETER Path
        Define the directory path of your key storage

        .PARAMETER Detail
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

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckStorageKey.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
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
        [Switch]$Detail
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

        foreach($storagePath in $Path)
        {
            # Build and send request
            $request.BuildEndpoint($storagePath)
            $requestData = $request.Get()

            if($Detail)
            {
                # Return data without transformation
                $requestData
            }
            else
            {
                # Return data
                $requestData.resources
            }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
