function Get-RundeckStorageKeyMetadata
{
    <#
        .SYNOPSIS
        Get the metadata about the stored key file

        .PARAMETER Path
        Define the directory path of your stored key file

        .PARAMETER Detail
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

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckStorageKeyMetadata.ps1
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

        # Build and send request
        $request.BuildEndpoint($Path)
        $requestData = $request.Get()

        if($Detail)
        {
            # Return data without transformation
            $requestData
        }
        else
        {
            # Return data
            $requestData.meta
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
