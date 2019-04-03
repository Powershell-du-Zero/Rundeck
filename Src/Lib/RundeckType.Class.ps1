#region Classes with no dependencies
Class RundeckProjectSummary
{
    [System.String]$Name
    [System.String]$Description
    [System.String]$Label

    # Constructor
    RundeckProjectSummary( [System.Object] $Source )
    {
        $this.Name = $Source.Name
        $this.Description = $Source.Description
        $this.Label = $Source.Label
    }
}

Class RundeckProjectDetail
{
    [System.String]$Name
    [System.String]$Description
    [System.Collections.Generic.Dictionary[System.String, System.String]]$Config = [System.Collections.Generic.Dictionary[System.String, System.String]]::new()

    # Constructor
    RundeckProjectDetail( [System.Object] $Source )
    {
        $this.Name = $Source.Name
        $this.Description = $Source.Description
        $Source.config.PSObject.Properties | ForEach-Object {
            $this.Config.Add($_.Name, $_.Value)
        }
    }
}

Class RundeckStorageKeyMeta
{
    [System.String]$ContentType

    [Nullable[DateTime]]$ContentCreationTime

    [Nullable[DateTime]]$ContentLastWriteTime

    [System.String]$ContentMask

    [System.String]$CreatedBy

    [System.String]$ModifyBy

    [System.String]$KeyType

    # Constructors
    RundeckStorageKeyMeta( $Source )
    {
        $this.ContentType = $Source.'Rundeck-content-type'
        $this.ContentCreationTime = $Source.'Rundeck-content-creation-time'
        $this.ContentLastWriteTime = $Source.'Rundeck-content-modify-time'
        $this.ContentMask = $Source.'Rundeck-content-mask'
        $this.CreatedBy = $Source.'Rundeck-auth-created-username'
        $this.ModifyBy = $Source.'Rundeck-auth-modified-username'
        $this.KeyType = $Source.'Rundeck-key-type'
    }
}

Class RundeckStorageKey
{
    [System.String]$Path

    [System.String]$Type

    [System.String]$Name

    [RundeckStorageKeyMeta]$Meta

    # Constructors
    RundeckStorageKey( [System.Object] $Source )
    {
        $this.Path = $Source.Path -replace 'keys/'
        $this.Type = $Source.Type
        $this.Name = $Source.Name
        if ( [string]::IsNullOrEmpty($Source.Meta) -eq $false )
        {
            $this.Meta = [RundeckStorageKeyMeta]$Source.Meta
        }
    }
}
#endregion
