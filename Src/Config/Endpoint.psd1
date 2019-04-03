
@{
    'Get-RundeckProject'            = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/projects/'
            '/api/30/project/{first}'
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
            '/api/30/projects'
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
            '/api/30/project/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckJob'                = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/project/{first}/jobs'
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
            '/api/30/execution/{first}'
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
            '/api/30/execution/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = ''
        SuccessCode = 204
    }
    'Get-RundeckJobExecutionList'   = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/job/{first}/executions'
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
            '/api/30/execution/{first}/output'
            '/api/30/execution/{first}/output/node/{second}'
            '/api/30/execution/{first}/output/node/{second}/step/{third}'
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
            '/api/30/system/info'
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
            '/api/30/metrics/healthcheck'
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
            '/api/30/metrics/ping'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'text/plain'
        SuccessCode = 200
    }
    'Get-RundeckMetricThreading'    = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/metrics/threads'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'text/plain'
        SuccessCode = 200
    }
    'Get-RundeckMetricData'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/metrics/metrics'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Add-RundeckStorageKey' = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 201
    }
    'Get-RundeckStorageKey'         = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckStorageKeyMetadata' = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/storage/keys/{first}'
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
            '/api/30/storage/keys/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckToken'              = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/tokens/'
            '/api/30/{first}/{second}'
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
            '/api/30/tokens/'
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
            '/api/30/token/{first}'
        )
        Header      = @{}
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 204
    }
    'Get-RundeckUser'              = @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/user/list/'
            '/api/30/user/info/{first}'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
    'Get-RundeckUserRole'= @{
        Method      = 'GET'
        Endpoint    = @(
            '/api/30/user/roles'
        )
        Header      = @{
            Accept = 'application/json'
        }
        Body        = @{}
        ContentType = 'application/json'
        SuccessCode = 200
    }
}
