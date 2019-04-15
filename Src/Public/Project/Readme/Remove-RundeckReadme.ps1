function Remove-RundeckReadme
{

    <#
        .SYNOPSIS
        n/a

        .PARAMETER Project
        n/a

        .EXAMPLE
        PS C:\> Remove-RundeckReadme -Name MyProject

        .INPUTS
        System.String

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Remove-RundeckReadme.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Project
    )

    begin
    {
        $functionName = $MyInvocation.MyCommand.Name
        Write-Verbose "[${functionName}] Function started"
        Write-Verbose "[${functionName}] Parameters: $( $PSBoundParameters | Out-String )'"
    }

    process
    {
        # Create instance of the [RundeckRequest]
        $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)

        # Build and send request
        $request.BuildEndpoint($Project)
        $requestData = $request.Delete()

        # Return Executions data
        return $requestData.contents
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
