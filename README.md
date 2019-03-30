# The Rundeck Community PowerShell Module

This is a community project that provides a powerful command-line interface for managing and monitoring your Rundeck instance through a Powershell module with cmdlets that interact with published [RESTful APIs](https://docs.rundeck.com/docs/api/).

Every successful build is published on the [PowerShell Gallery](https://www.powershellgallery.com/packages/Rundeck).

## Instructions

```powershell
# One time setup
    # Download the repository
    # Unblock the zip
    # Extract the Rundeck folder to a module path (e.g. $env:USERPROFILE\Documents\WindowsPowerShell\Modules\)
# Or, with PowerShell 5 or later or PowerShellGet:
    Install-Module Rundeck

# Import the module.
    Import-Module Rundeck #Alternatively, Import-Module \\Path\To\Rundeck

# Get commands in the module
    Get-Command -Module Rundeck

# Get help
    Get-Help Get-RundeckProject -Full
    Get-Help about_Rundeck
```

## Example Usage

### Connect to your rundeck instance

```powershell
# This example shows how to connect to your rundeck instance

# Connect with user credential
Connect-Rundeck -Protocol http -Server '1.1.1.1' -Port '4440' -Credential (Get-Credential)

# Connect with token
Connect-Rundeck -Protocol http -Server '1.1.1.1' -Port '4440' -Token 'wbh4thTlW6r53gkBJ29SNYuU6Zn7JQli'
```

## Spec Progress

- [x] System Info
- [x] List Metrics
    - [x] Metrics Data
    - [x] Metrics Healthcheck
    - [x] Metrics Threading
    - [x] Metrics Ping
- [ ] User Profile
- [ ] Log Storage
- [ ] Execution Mode
- [ ] Cluster Mode
- [ ] ACLs
- [ ] Jobs
- [ ] Executions
    - [ ] Get Executions for a Job
    - [ ] Delete all Executions for a Job
    - [ ] Listing Running Executions
    - [ ] Execution Info
    - [ ] List Input Files for an Execution
    - [ ] Delete an Execution
    - [ ] Bulk Delete Executions
    - [ ] Execution Query
    - [ ] Execution State
    - [ ] Execution Output
    - [ ] Execution Output with State
    - [ ] Aborting Executions
- [ ] Adhoc
- [ ] Key Storage
    - [ ] Upload keys
    - [ ] List keys
    - [ ] Get Key Metadata
    - [ ] Get Key Contents
    - [ ] Delete Keys
- [ ] Projects
    - [x] Listing Projects
    - [x] Project Creation
    - [x] Getting Project Info
    - [ ] Project Deletion
    - [ ] Project Configuration
    - [ ] Project Configuration Keys
    - [ ] Project Archive Export
    - [ ] Project Archive Export Async
    - [ ] Project Archive Export Status
    - [ ] Project Archive Import
    - [ ] Updating and Listing Resources for a Project
    - [ ] Project Readme File
    - [ ] Project ACLs
- [ ] Listing History
- [ ] Resources/Nodes
