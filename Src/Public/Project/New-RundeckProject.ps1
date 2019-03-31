function New-RundeckProject
{

    <#
        .SYNOPSIS
        List the existing projects on the server

        .DESCRIPTION
        n/a

        .PARAMETER Name
        Get information about a specific project

        .PARAMETER Config
        n/a

        .EXAMPLE
        PS C:\> Get-RundeckProject

        .EXAMPLE
        PS C:\> Get-RundeckProject -Name MyProject

        .INPUTS
        System.String

        .INPUTS
        System.Management.Automation.PSObject

        .OUTPUTS
        RundeckProjectDetail

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : New-RundeckProject.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [RundeckProjectDetail] )]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.String]
        $Name,

        [Parameter(
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.Collections.Hashtable]
        $Config
    )

    begin
    {
        $functionName = $MyInvocation.MyCommand.Name
        Write-Verbose "[${functionName}] Function started"
        Write-Verbose "[${functionName}] Parameters: $( $PSBoundParameters | Out-String )'"
    }

    process
    {
        if( $null -eq ( Get-RundeckProject -Name $Name -ErrorAction SilentlyContinue ) )
        {
            # Create instance of the [RundeckRequest]
            $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)

            # Build and send request
            $request = [Rundeckrequest]::new($script:RundeckSession, $functionName)
            $request.BuildEndpoint()
            $request.BuildBody($PSBoundParameters)
            $requestData = $request.Post()

            # Return Executions data
            [RundeckProjectDetail]$requestData
        }
        else
        {
            Write-Error "This project can not be created because it already exists."
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
