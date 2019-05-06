## 5.6 STOMP Test Cases

### 5.6.1 Support of Required Profiles

#### Purpose

The purpose of this test is to ensure the EUT supports the required STOMP
profiles.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP records to each other.

#### Test Procedure

1. Send a GetSupportedDM message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_SUPPORTED_DM
}
body {
    request {
        get_supported_dm {
            obj_paths: [
                "Device.STOMP."
                "Device.LocalAgent."
            ]
            return_param: true
            first_level_only: false
        }
    }
}
```

2. Wait for the GetSupportedDMResponse.

#### Test Metrics

1. The EUT sends a GetSupportedDMResponse.
2. The GetSupportedDMReponse from the EUT contains the following parameters:
        Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Reference
        Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Destination
        Device.STOMP.ConnectionNumberOfEntries
        Device.STOMP.Connection.{i}.Alias
        Device.STOMP.Connection.{i}.Enable
        Device.STOMP.Connection.{i}.Status
        Device.STOMP.Connection.{i}.Host
        Device.STOMP.Connection.{i}.Port
        Device.STOMP.Connection.{i}.VirtualHost
        Device.STOMP.Connection.{i}.ServerRetryInitialInterval
        Device.STOMP.Connection.{i}.ServerRetryInitialMultiplier
        Device.STOMP.Connection.{i}.ServerRetryMaxInterval

### 5.6.2 STOMP session establishment

#### Purpose

The purpose of this test is to ensure the EUT can properly start a STOMP session.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure that the EUT is configured to use a STOMP server that exists
   in the test environment.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the STOMP server and subscribe to a destination.

#### Test Metrics

1. The EUT sends a STOMP frame to the STOMP server to initiate the STOMP session.

### 5.6.3 STOMP Connection Retry

#### Purpose

The purpose of this test is to ensure the EUT properly enters a retry state
when it fails to connect to the STOMP server.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure that the EUT is configured to use a STOMP server that exists
   in the test environment.

#### Test Procedure

1. Send a Get message to the EUT with the following structure

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.STOMP.Connection.
        }
    }
}
```

2. Send an Operate message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.Reboot()
        }
    }
}
```

3. Disable the STOMP server.
4. Allow the EUT to attempt to start a STOMP session with the STOMP
   server.
5. Reenable the STOMP server after the EUT fails to connect to the STOMP
   server twice.

#### Test Metrics

1. The EUT retries connecting to the STOMP server within the
   `ServerRetryInitialInterval` of the connection instance.
2. The EUT retries a second time in accordance with `ServerRetryInitialInterval`
   and `ServerRetryIntervalMultiplier`.

### 5.6.4 Successful USP message over STOMP with required headers

#### Purpose

The purpose of this test is to ensure the EUT can communicate over STOMP
using the correct headers.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure that the EUT is configured to use a STOMP server
   that exists in the test environment.

#### Test Procedure

1. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}
```

2. Allow the EUT to send a GetResponse.

#### Test Metrics

1. In the STOMP frame transporting the GetResponse the `content-length` header
   is present and contains the length of the included body of the message.
2. In the STOMP frame transporting the GetResponse the `content-type`
   header is present and contains `application/vnd.bbf.usp.msg`.
3. In the STOMP frame transporting the GetReponse the `reply-to-dest` header
   is present and contains the STOMP destination of the EUT.


### 5.6.5 STOMP destination - provided in subscribe-dest

#### Purpose

The purpose of this test is to ensure the EUT correct subscribe to a
destination found in the `subscribe-dest` header in a CONNECTED frame.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure the EUT is configured to use a STOMP server
   that is part of the test environment.

#### Test Procedure

1. Configure the STOMP server to send an unused destination via the
   `subscribe-dest` header in the CONNECTED frames.
2. Reboot the EUT.
3. Allow the EUT to reconnect to the STOMP server.
4. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}
```

5. Allow the EUT to respond to the Get message.

#### Test Metrics

1. The EUT subscribes to the destination configured in step 1.
2. The STOMP frame containing the GetResponse has a `reply-to-dest`
   header which matches the destination configured in step 1.


### 5.6.6 STOMP destination - configured in USP data model

#### Purpose

The purpose of this test is to ensure the EUT can use the
`Device.LocalAgent.MTP.{i}.STOMP.Destination` parameter to select a STOMP
destination.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Steps

1. Ensure the EUT is configured to use a STOMP server
   that is part of the test environment.

#### Test Procedure

1. Send a Set message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: SET
}
body {
    request {
        set {
            update_objs {
                obj_path: Device.LocalAgent.MTP.<active MTP instance>.STOMP.
                param_settings: [
                    {
                        param: Destination
                        value: <new unused destination>
                    }
                ]
            }
        }
    }
}
```

2. Reboot the EUT.
3. Wait for the EUT to reconnect to the STOMP server.
4. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}
```

5. Wait for a GetResponse from the EUT.

#### Test Metrics

1. The EUT subscribes to the destination configured in step 1.
2. The STOMP frame containing the GetResponse has a `reply-to-dest`
   header which contains the STOMP destination configured in step 1.


### 5.6.7 STOMP Destination - terminates unconfigured session

#### Purpose

The purpose of this test is to ensure the EUT terminates a STOMP
session when no destination id configured.

#### Functionality Tags

Conditionally Mandatory (Implements STOMP)

#### Test Setup

1. The EUT is configured to use a STOMP server which
   exists in the test environment.
2. Configure the STOMP server to not provide a `subscribe-dest`
   header in the CONNECTED frame.

#### Test Procedure

1. Send a Set message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.MTP.<active MTP instance>.STOMP.
                    param_settings: [
                        {
                            param: Destination
                            value: ""
                        }
                    ]
                }
            ]
        }
    }
}
```

2. Reboot the EUT.
3. Wait for the EUT to attempt to reconnect to the STOMP server.

#### Test Metrics

1. The EUT terminates the STOMP session after the STOMP server sends
   a CONNECTION to the EUT.

### 5.6.8 Use of STOMP heartbeat mechanism

#### Purpose

The purpose of this test is to ensure the EUT can correctly implements
the STOMP heartbeat mechanism and the relavent parameters in the data model.

#### Functionality Tags

Conditional Mandatory (supports STOMPHeartbeat:1 profile)

#### Test Setup

1. The EUT is configured to use a STOMP server which
   exists in the test environment.
2. Ensure the STOMP server supports heartbeats.

#### Test Metrics

1. Send a Set message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.STOMP.Connection.<STOMP server in use>.
                    param_settings: [
                        {
                            param: EnableHeartbeats
                            value: true
                        },
                        {
                            param: IncomingHeartbeat
                            value: 10
                        },
                        {
                            param: OutgoingHeartbeat
                            value: 15
                        }
                    ]
                }
            ]
        }
    }
}
```

2. Reboot the EUT.
3. Wait for the EUT to reconnect to the STOMP server.
4. Wait for 60 seconds

#### Test Metrics

1. In the STOMP frame sent to the STOMP server during step 2, the `heart-beat` header
   sent by the EUT contains "15, 10".
2. After the EUT is connected to the STOMP server, the EUT sends heartbeat messages
   every 15 seconds.

### 5.6.9 Error Handling - Unprocessed Record

#### Purpose

The purpose of this test is to ensure the EUT will correctly
send an ERROR STOMP frame when a malformed USP record is received.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure the EUT is configured to use a STOMP server that exists
   in the test environment.

#### Test Procedure

1. Send a malformed USP record to the EUT.
2. Wait 60 seconds for the EUT to send a response.

#### Test Metrics

1. The EUT does not send a response to the malformed record.

### 5.6.10 Agent's STOMP destination is changed

#### Purpose

The purpose of this test is to ensure that when the EUT's destination is altered it
properly unsubscribes and subscribes to the new destination.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure the EUT is configured to use a STOMP server that exists
   in the test environment.
2. Ensure the STOMP server is configured to not provide a destination
   via the `subscribe-dest` header.

#### Test Procedure

1. Send a Set message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.MTP.<active MTP instance>.STOMP.
                    param_settings: [
                        {
                            param: Destination
                            value: <new destination>
                        }
                    ]
                }
            ]
        }
    }
}
```

#### Test Metrics

1. After the STOMP destination was changed the EUT sent an UNSUBSCRIBE message
   message to the STOMP server.
2. After the EUT sent an UNSUBSCRIBE to the STOMP server it sent a SUBSCRIBE
   message with the new destination to the STOMP server.

### 5.6.11 STOMP - Use of TLS

#### Purpose

The purpose of this test is to ensure the EUT can secure STOMP communication
via TLS.

#### Functionality Tags

Conditional Mandatory (supports the STOMP MTP)

#### Test Setup

1. Ensure the EUT is configured to the use a STOMP server that exists
   in the test environment.
2. Ensure the EUT and STOMP server are configured with the appropriate
   certificates to communicate over TLS.

#### Test Procedure

1. Reboot the EUT
2. Wait for the EUT to reconnect to the STOMP server
3. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo
        }
    }
}
```

4. Wait for the EUT to send a GetResponse

#### Test Metrics

1. All communication between the EUT and STOMP server after
   step 1 are encrypted using TLS
