function Set-RundeckReadme
{

    <#
        .SYNOPSIS
        n/a

        .PARAMETER Project
        n/a

        .PARAMETER Content
        n/a

        .EXAMPLE
        PS C:\> Set-RundeckReadme -Project MyProject -Content MyBeatifullReadme

        .INPUTS
        System.String

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Set-RundeckReadme.ps1
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
        $Project,

        [Parameter(
            Position = 1,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Content
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
        $request.BuildBody($PSBoundParameters)
        $requestData = $request.Put()

        # Return Executions data
        return $requestData.contents
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
