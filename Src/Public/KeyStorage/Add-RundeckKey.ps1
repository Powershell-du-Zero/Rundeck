function Add-RundeckKey
{
    <#
        .SYNOPSIS
        List storage keys and directories at the specified location

        .PARAMETER Path
        Define the directory path of your key storage

        .PARAMETER Raw
        Switch to return data without transformation

        .EXAMPLE
        PS C:\> Add-RundeckKey -Path RemotePathOfMyPrivateKey -PrivateKey C:\\PrivateKey.key

        .EXAMPLE
        PS C:\> Add-RundeckKey -Path RemotePathOfMyPublicKey -PublicKey C:\\PublicKey.crt

        .EXAMPLE
        PS C:\> Add-RundeckKey -Path RemotePathOfMyPassword -Password "Password"

        .OUTPUTS
        System.Object

        .OUTPUTS
        System.String

        .OUTPUTS
        RundeckStorageKey

        .COMPONENT
        Rundeck API

        .NOTES
        - File Name : Add-RundeckKey.ps1
        - Author    : Thomas ILLIET
    #>

    [CmdletBinding()]
    [OutputType( [System.Object] )]
    [OutputType( [System.String] )]
    [OutputType( [RundeckStorageKey] )]
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [System.String]$Path,

        [Parameter(
            Position = 1,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'PrivateKey'
        )]
        [ValidateScript( {Test-Path $_ })]
        [System.String]$PrivateKey,

        [Parameter(
            Position = 2,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'PublicKey'
        )]
        [ValidateScript( {Test-Path $_ })]
        [System.String]$PublicKey,

        [Parameter(
            Position = 3,
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Password'
        )]
        [System.String]$Password,

        [Parameter(
            Position = 4,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Switch]$Raw
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
        $request.BuildEndpoint($Path)
        switch ($PSCmdlet.ParameterSetName)
        {
            PrivateKey
            {
                $request.Config.ContentType = 'application/octet-stream'
                $request.Body = [System.IO.File]::ReadAllText($PrivateKey)
            }
            PublicKey
            {
                $request.Config.ContentType = 'application/pgp-keys'
                $request.Body = Get-Content -Path $PublicKey -Raw
            }
            Password
            {
                $request.Config.ContentType = 'application/x-rundeck-data-password'
                $request.Body = $Password
            }
        }
        $requestData = $request.Upload()

        # Return data
        if ( $Raw )
        {
            return $requestData
        }
        else
        {
            switch ($PSCmdlet.ParameterSetName)
            {
                PublicKey
                {
                    return [System.Text.Encoding]::ASCII.GetString($requestData)
                }
                Default
                {
                    return [RundeckStorageKey]$requestData
                }
            }
        }
    }

    end
    {
        Write-Verbose "[${functionName}] Complete"
    }
}
