function Get-RundeckUser
{

    <#
        .SYNOPSIS
        n/a

        .PARAMETER User
        n/a

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Get-RundeckUser

        .EXAMPLE
        PS C:\> Get-RundeckUser -Name @('admin', 'user)

        .EXAMPLE
        PS C:\> Get-RundeckUser -Name 'admin' -Raw

        .INPUTS
        System.String

        .INPUTS
        System.Management.Automation.PSObject

        .OUTPUTS
        System.Object

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Get-RundeckUser.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
    [OutputType( [RundeckUser] )]
    [OutputType( [RundeckUser[]] )]
    Param(
        [Parameter(
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.String[]]
        $User,

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

        # Build and send request
        $request.BuildEndpoint()
        $requestData = $request.Get()

        # Return data
        if ($User)
        {
            foreach ($UserName in $User)
            {
                $UserInformation = $requestData | Where-Object { $_.Login -eq $UserName}
                if ($Raw)
                {
                    $UserInformation
                }
                else
                {
                    [RundeckUser]$UserInformation
                }
            }
        }
        else
        {
            if ($Raw)
            {
                $requestData
            }
            else
            {
                [RundeckUser[]]$requestData
            }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
