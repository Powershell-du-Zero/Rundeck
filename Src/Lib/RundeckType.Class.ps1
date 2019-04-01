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
    [System.String]$ContentSize
    [Nullable[DateTime]]$CreationTime
    [Nullable[DateTime]]$LastWriteTime
    [System.String]$CreatedBy
    [System.String]$ModifyBy
    [System.String]$Type

    RundeckStorageKeyMeta( $Source )
    {
        $this.ContentType = $Source.'Rundeck-content-type'
        $this.ContentSize = $Source.'Rundeck-content-size'
        $this.CreationTime = $Source.'Rundeck-content-creation-time'
        $this.LastWriteTime = $Source.'Rundeck-content-modify-time'
        $this.CreatedBy = $Source.'Rundeck-auth-created-username'
        $this.ModifyBy = $Source.'Rundeck-auth-modified-username'
        $this.Type = $Source.'Rundeck-key-type'
    }
}

Class RundeckStorageKey
{
    [System.String]$Path
    [System.String]$Type
    [System.String]$Name
    [RundeckStorageKeyMeta]$Meta

    RundeckStorageKey( [System.Object] $Source )
    {
        $this.Path = $Source.Path -replace 'keys/'
        $this.Type = $Source.Type
        $this.Name = $Source.Name
        if ($Source.Meta)
        {
            $this.Meta = [RundeckStorageKeyMeta]$Source.Meta
        }
    }
}
#endregion
