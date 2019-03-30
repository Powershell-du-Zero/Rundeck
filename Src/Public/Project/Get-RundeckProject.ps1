function Get-RundeckProject
{

    <#
        .SYNOPSIS
        List the existing projects on the server

        .PARAMETER Name
        Get information about a specific project

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
        System.Object

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckProject.ps1
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
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        $Name
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

        if( $null -ne $Name )
        {
            foreach($projectName in $Name)
            {
                # Build and send request
                $request.BuildEndpoint($projectName)
                $requestData = $request.Get()

                # Return Executions data
                $requestData
            }
        }
        else
        {
            # Build and send request
            $request.BuildEndpoint()
            $requestData = $request.Get()

            # Return data
            $requestData
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
