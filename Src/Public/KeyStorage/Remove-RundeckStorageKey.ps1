function Remove-RundeckStorageKey
{
    <#
        .SYNOPSIS
        Remove storage keys at the specified location

        .PARAMETER Path
        Define the directory path of your key storage

        .EXAMPLE
        PS C:\> Remove-RundeckStorageKey -Path 'ANVILS-ONLINE'

        .EXAMPLE
        PS C:\> Remove-RundeckStorageKey -Path @('ANVILS-ONLINE', 'E-OPTIONS')

        .OUTPUTS
        System.Object

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Remove-RundeckStorageKey.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding( SupportsShouldProcess = $true, ConfirmImpact = 'High' )]
    [OutputType( [System.Object] )]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.String[]]$Path
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
            if ( $PSCmdlet.ShouldProcess( $storagePath, 'Remove Storage Key' ) )
            {
                # Build and send request
                $request.BuildEndpoint($storagePath)
                $request.Delete()
            }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
