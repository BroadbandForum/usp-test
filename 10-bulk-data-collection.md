# 10 Bulk Data Collection Test Cases

## 10.1 Use BulkData collection using HTTP and JSON

### Purpose

The purpose of this test is to verify that EUT supports JSON BulkData collection
over HTTP.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols, "JSON" ∈ Device.BulkData.EncodingTypes)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured to support receiving JSON BulkData transfers.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: 'JSON'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```
2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the BulkData transfer is JSON and is well formed (parseable).
3. The BulkData transfer contains the one parameter configured in step 4
   and the name of the parameter matches the expected name "UpTime".
4. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are encoded as URI parameters in the request.


## 10.2 Use BulkData collection using HTTPS and JSON

### Purpose

The purpose of this test is to verify that EUT supports JSON BulkData collection
over HTTPS.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols, "JSON" ∈ Device.BulkData.EncodingTypes)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTPS endpoint that is accessible by the EUT
   is configured to support receiving JSON BulkData transfers.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: 'JSON'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```
5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the BulkData transfer is JSON and is well formed (parseable).
3. The BulkData transfer contains the one parameter configured in step 4
   and the name of the parameter matches the expected name "UpTime".
4. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are encoded as URI parameters in the request.

## 10.3 Use BulkData collection using HTTP and CSV

### Purpose

The purpose of this test is to verify that EUT supports CSV BulkData collection
over HTTP.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols, "CSV" ∈ Device.BulkData.EncodingTypes)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured to support receiving CSV BulkData transfers.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: 'CSV'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the BulkData transfer is CSV and is well formed (parseable).
3. The BulkData transfer contains the one parameter configured in step 4
   and the name of the parameter matches the expected name "UpTime".
4. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are encoded as URI parameters in the request.


## 10.4 Use BulkData collection using HTTPS and CSV

### Purpose

The purpose of this test is to verify that EUT supports CSV BulkData collection
over HTTPS.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols, "CSV" ∈ Device.BulkData.EncodingTypes)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTPS endpoint that is accessible by the EUT
   is configured to support receiving CSV BulkData transfers.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: 'CSV'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the BulkData transfer is CSV and is well formed (parseable).
3. The BulkData transfer contains the one parameter configured in step 4
   and the name of the parameter matches the expected name "UpTime".
4. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are encoded as URI parameters in the request.


## 10.5 Use BulkData collection using HTTP with URI Parameters

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
over HTTP with extra URI parameters

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<Supported Encoding type>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.HTTP.RequestURIParameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.UpTime'
               }
            }
        }
      }
    }
    ```

6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

7. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The EUT includes the EUT's UpTime encoded into the URI using the
   name "UpTime"
3. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are also encoded as URI parameters in the request.

## 10.6 Use BulkData collection using HTTPS with URI Parameters

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
over HTTPS with extra URI parameters

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTPS endpoint that is accessible by the EUT
   is configured.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<Supported Encoding type>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of https endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.HTTP.RequestURIParameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.UpTime'
               }
            }
        }
      }
    }
    ```

6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

7. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The EUT includes the EUT's UpTime encoded into the URI using the
   name "UpTime"
3. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are also encoded as URI parameters in the request.


## 10.7 BulkData collection retry mechanism over HTTP

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
retry mechanism.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<Supported Encoding type>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
              param_settings {
                   param: 'HTTP.RetryEnable'
                   value: 'true'
               }
              param_settings {
                   param: 'HTTP.RetryMinimumWaitInterval'
                   value: '5'
               }
              param_settings {
                   param: 'HTTP.RetryIntervalMultiplier'
                   value: '2000'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Disable the HTTP BulkData collection endpoint.
6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Allow the EUT to attempt to send a BulkData transfer.
7. Wait for 13 seconds for the EUT to retry the BulkData transfer.
8. Wait for 23 seconds for the EUT to retry the BulkData transfer.
8. Enable the HTTP BulkData collection endpoint
9. Wait for 43 seconds for the EUT to retry the BulkData transfer.
10. Wait for the EUT to send a BulkData transfer

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The EUT retries sending the BulkData transfer 3 times with each time
   occuring within the expected retry interval.
4. The EUT does not attempt to retry the BulkData transfer after receiving
   a positive response in step 9.
3. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are encoded as URI parameters in each request.


## 10.8 Use BulkData collection using HTTP with wildcard parameter

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
over HTTP with a wildcarded parameter

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured.
3. Ensure there are at least 2 BootParameters configured for
   the test controller.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<Supported Encoding type>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'Enabled'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.Controller.*.BootParameter.*.Enable'
               }
            }
        }
      }
    }
    ```

5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. Ensure at least two "Enable" are in the BulkData transfer with the
   parameter names matching the following expression: `Enabled\.[1-9][0-9]*\.[1-9][0-9]*`
3. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are also encoded as URI parameters in the request.


## 10.9 Use BulkData collection using HTTP with Object Path

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
over HTTP with an Object Path

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure a HTTP endpoint that is accessible by the EUT
   is configured.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'HTTP'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<Supported Encoding type>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'TestController'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.Controller.<controller instance>.'
               }
            }
        }
      }
    }
    ```

5. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

6. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfers
   to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. Ensure that all the parameters included in the BulkData transfer
   match `TestController.<parameter>` and that all expected parameters are
   present.
3. Ensure the Manufacturer OUI, Product Class and Serial Number or the USP
   Endpoint ID are also encoded as URI parameters in the request.


## 10.10 Use BulkData collection Push event

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
via the Push event.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'USPEventNotif'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<JSON or CSV>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'UpTime'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.DeviceInfo.UpTime'
               }
            }
        }
      }
    }
    ```

5. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.LocalAgent.Subscription.'
              param_settings {
                   param: 'NotifType'
                   value: 'Event'
               }
              param_settings {
                   param: 'ReferenceList'
                   value: 'Device.BulkData.Profile.<instance identifier>.Push!'
               }
              param_settings {
                   param: 'Enable'
                   value: 'true'
               }
            }
        }
      }
    }
    ```

6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

7. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfer
   Push! events to the controller within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the Data parameter in the Push! notification is well
   formed (parseable).
3. The BulkData transfer contains the one parameter configured in step 4
   and the name of the parameter matches the expected name "UpTime".

## 10.11 Use BulkData collection Push event with Wildcard path

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
via the Push event using a wildcard path.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.
2. Ensure that there are at least 2 BootParameters configured
   for the test Controller.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'USPEventNotif'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<JSON or CSV>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'Enabled'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.Controller.*.BootParameter.*.Enable'
               }
            }
        }
      }
    }
    ```

5. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.LocalAgent.Subscription.'
              param_settings {
                   param: 'NotifType'
                   value: 'Event'
               }
              param_settings {
                   param: 'ReferenceList'
                   value: 'Device.BulkData.Profile.<instance identifier>.Push!'
               }
              param_settings {
                   param: 'Enable'
                   value: 'true'
               }
            }
        }
      }
    }
    ```

6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

7. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfer
   Push! events to the controller within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the Data parameter in the Push! notification is well
   formed (parseable).
3. The BulkData transfer contains at least 2 parameters, one for each
   of the configured BootParameters and the name of the parameters match
   the expected name `Enabled\.[1-9][0-9]*\.[1-9][0-9]*`.

## 10.12 Use BulkData collection Push event with Object path

### Purpose

The purpose of this test is to verify that EUT supports BulkData collection
via the Push event using an object path.

### Functionality Tags

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈ Device.BulkData.Protocols)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.

### Test Procedure

1. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.'
              param_settings {
                   param: 'Protocol'
                   value: 'USPEventNotif'
               }
              param_settings {
                   param: 'EncodingType'
                   value: '<JSON or CSV>'
               }
              param_settings {
                   param: 'ReportingInterval'
                   value: 'max(60, Device.BulkData.MinReportingInterval)'
               }
              param_settings {
                   param: 'HTTP.URL'
                   value: '<URL of http endpoint>'
               }
            }
        }
      }
    }
    ```

2. Allow the EUT to send an AddResponse
3. Record the instance identifiers of the created objects as reported by the EUT.
4. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
              param_settings {
                   param: 'Name'
                   value: 'Controller'
               }
              param_settings {
                   param: 'Reference'
                   value: 'Device.LocalAgent.Controller.'
               }
            }
        }
      }
    }
    ```

5. Send a Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
              obj_path: 'Device.LocalAgent.Subscription.'
              param_settings {
                   param: 'NotifType'
                   value: 'Event'
               }
              param_settings {
                   param: 'ReferenceList'
                   value: 'Device.BulkData.Profile.<instance identifier>.Push!'
               }
              param_settings {
                   param: 'Enable'
                   value: 'true'
               }
            }
        }
      }
    }
    ```

6. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
      msg_id: '<msg_id>'
      msg_type: SET
    }
    body {
      request {
        set {
            allow_partial: false
            update_objs {
                obj_path: 'Device.BulkData.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
            update_objs {
                obj_path: 'Device.BulkData.Profile.<instance identifier>.'
                param_settings {
                  param: 'Enable'
                  value: 'true'
                }
              }
        }
      }
    }
    ```

7. Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

### Test Metrics

1. After enabling the BulkData profile the EUT sent 2 BulkData transfer
   Push! events to the controller within 130 (`(ReportingInterval * 2) + 10`) seconds.
2. The encoding of the Data parameter in the Push! notification is well
   formed (parseable).
3. The BulkData transfer contains at parameters with names using the
   prefix "Controller".
