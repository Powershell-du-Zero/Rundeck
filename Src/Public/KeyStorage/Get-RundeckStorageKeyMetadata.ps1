function Get-RundeckStorageKeyMetadata
{
    <#
        .SYNOPSIS
        Get the metadata about the stored key file

        .PARAMETER Path
        Define the directory path of your stored key file

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Get-RundeckStorageKeyMetadata

        .EXAMPLE
        PS C:\> Get-RundeckStorageKeyMetadata -Path 'ANVILS-ONLINE'

        .EXAMPLE
        PS C:\> Get-RundeckStorageKeyMetadata -Path @('ANVILS-ONLINE', 'E-OPTIONS')

        .EXAMPLE
        PS C:\> Get-RundeckStorageKeyMetadata -Path @('ANVILS-ONLINE', 'E-OPTIONS') -Detail

        .OUTPUTS
        System.Object

        .OUTPUTS
        RundeckStorageKeyMeta

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckStorageKeyMetadata.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
    [OutputType( [RundeckStorageKeyMeta] )]
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
        foreach ($keyPath in $Path)
        {
            # Create instance of the [RundeckRequest]
            $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)

            # Build and send request
            $request.BuildEndpoint($keyPath)
            $requestData = $request.Get()

            # Return data
            if ($Raw) { $requestData } else { [RundeckStorageKeyMeta]$requestData.meta }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
