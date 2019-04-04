function Get-RundeckExecutionMode
{

    <#
        .SYNOPSIS
        n/a

        .PARAMETER Path
        n/a

        .EXAMPLE
        PS C:\> Get-RundeckExecutionMode

        .OUTPUTS
        System.Boolean

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckExecutionMode.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Boolean] )]
    Param()

    begin
    {
        $functionName = $MyInvocation.MyCommand.Name
        Write-Verbose "[${functionName}] Function started"
    }

    process
    {
        try
        {
            $systemInfo = Get-RundeckSystemInfo -ErrorAction Stop
            return [System.Boolean]$systemInfo.System.Executions.Active
        }
        catch
        {
            Write-Error "Could not get the rundeck execution mode"
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
