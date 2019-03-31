#region Classes with no dependencies
Class RundeckProjectSummary
{
    [System.String]$Name
    [System.String]$Description
    [System.String]$Label

    # Constructor
    RundeckProject( [System.Object] $Source )
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
    [System.Collections.Generic.Dictionary[String,string]]$Config = [System.Collections.Generic.Dictionary[String,string]]::new()

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
#endregion
