function Get-RundeckProject
{

    <#
        .SYNOPSIS
        List the existing projects on the server

        .PARAMETER Name
        Get information about a specific project

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Get-RundeckProject

        .EXAMPLE
        PS C:\> Get-RundeckProject -Name MyProject

        .EXAMPLE
        PS C:\> Get-RundeckProject -Name @(MyProject01', 'MyProject02')

        .INPUTS
        System.String

        .INPUTS
        System.Management.Automation.PSObject

        .OUTPUTS
        RundeckProjectSummary

        .OUTPUTS
        RundeckProjectDetail

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckProject.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [RundeckProjectSummary[]] )]
    [OutputType( [RundeckProjectDetail] )]
    Param(
        [Parameter(
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        $Name,

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
        Write-Verbose "[${functionName}] Parameters: $( $PSBoundParameters | Out-String )'"
    }

    process
    {
        # Create instance of the [RundeckRequest]
        $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)

        if ( $null -ne $Name )
        {
            foreach ($projectName in $Name)
            {
                # Build and send request
                $request.BuildEndpoint($projectName)
                $requestData = $request.Get()

                # Return Executions data
                if ($Raw) { $requestData } else { [RundeckProjectDetail]$requestData }
            }
        }
        else
        {
            # Build and send request
            $request.BuildEndpoint()
            $requestData = $request.Get()

            # Return data
            if ($Raw) { $requestData } else { [RundeckProjectSummary[]]$requestData }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
