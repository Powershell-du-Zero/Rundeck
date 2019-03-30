function Get-RundeckMetricThreading
{
    <#
        .SYNOPSIS
        Get dump of running JVM Threads

        .EXAMPLE
        PS C:\> Get-RundeckMetricThreading

        .OUTPUTS
        System.Object

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckMetricThreading.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
    Param()

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
        $request.BuildEndpoint()
        $requestData = $request.Get()

        # Return data
        $requestData
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
