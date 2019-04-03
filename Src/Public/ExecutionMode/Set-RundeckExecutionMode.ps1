function Set-RundeckExecutionMode
{

    <#
        .SYNOPSIS
        n/a

        .PARAMETER Mode
        n/a

        .EXAMPLE
        PS C:\> Set-RundeckExecutionStatus -Mode $true

        .EXAMPLE
        PS C:\> Set-RundeckExecutionStatus -Mode $false

        .OUTPUTS
        System.Void

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Set-RundeckExecutionStatus.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Void] )]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.Boolean]$Mode
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
        switch ($Mode)
        {
            $true
            {
                $request.BuildEndpoint('enable')
                $desiredExecutionMode = 'active'
            }
            $false
            {
                $request.BuildEndpoint('disable')
                $desiredExecutionMode = 'passive'
            }
        }
        $requestData = $request.Post()

        # Check output
        if ($requestData.executionMode -ne $desiredExecutionMode)
        {
            Write-Error 'Could not change execution mode'
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
