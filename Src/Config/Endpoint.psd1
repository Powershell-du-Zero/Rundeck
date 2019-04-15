
@{
    'Get-RundeckProject'            = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/projects/'
            '/api/{version}/project/{first}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'New-RundeckProject'            = @{
        Method      = 'POST'
        Endpoint    = @(
            '/api/{version}/projects'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{
            Name   = 'name'
            Config = 'config'
        }
        ContentType = 'application/json'
        SuccessCode = 201
    }
    'Remove-RundeckProject'         = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/project/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckJob'                = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/project/{first}/jobs'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckJobExecution'       = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/execution/{first}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Remove-RundeckJobExecution'    = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/execution/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = ''
        SuccessCode = 204
    }
    'Get-RundeckJobExecutionList'   = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/job/{first}/executions'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckJobExecutionOutput' = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/execution/{first}/output'
            '/api/{version}/execution/{first}/output/node/{second}'
            '/api/{version}/execution/{first}/output/node/{second}/step/{third}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckSystemInfo'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/system/info'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckMetricHealthcheck'  = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/metrics/healthcheck'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckMetricPing'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/metrics/ping'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'text/plain'
        SuccessCode = 200
    }
    'Get-RundeckMetricThreading'    = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/metrics/threads'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'text/plain'
        SuccessCode = 200
    }
    'Get-RundeckMetricData'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/metrics/metrics'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Add-RundeckStorageKey'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 201
    }
    'Get-RundeckStorageKey'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckStorageKeyMetadata' = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/storage/keys/{first}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Remove-RundeckStorageKey'      = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckToken'              = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/tokens/'
            '/api/{version}/{first}/{second}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'New-RundeckToken'              = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/tokens/'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{
            Username = 'user'
            Role     = 'roles'
            Duration = 'duration'
        }
        ContentType = 'application/json'
        SuccessCode = 204
    }
    'Remove-RundeckToken'           = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/token/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 204
    }
    'Get-RundeckUser'               = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/user/list/'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckUserRole'           = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/user/roles'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Set-RundeckExecutionMode'      = @{
        Method      = 'POST'
        Endpoint    = @(
            '/api/14/system/executions/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckReadme'      = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/{version}/project/{first}/readme.md'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Set-RundeckReadme'      = @{
        Method      = 'PUT'
        Endpoint    = @(
            '/api/{version}/project/{first}/readme.md'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{
            Content = 'contents'
        }
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Remove-RundeckReadme'   = @{
        Method      = 'DELETE'
        Endpoint    = @(
            '/api/{version}/project/{first}/readme.md'
        )
        Header      = @{}
        Body        = @{}
        ContentType = ''
        SuccessCode = 200
    }
}
