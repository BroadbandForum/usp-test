## 7 WebSocket Test Cases

### 7.1 Session Establishment

#### Purpose

The purpose of this test is to ensure the EUT can establish a session
using WebSocket as the MTP.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket and to communicate to the controller
   that exists in the test environment.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the controller.
3. Send a Get message to the EUT with the following structure:

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

4. Wait for a GetResponse from the EUT

#### Test Metrics

1. The EUT is able to establish a WebSocket connection to the controller
2. The EUT sends a GetResponse to the Get message sent in step 3

### 7.2 Use of only one session

#### Purpose

The purpose of this test is to ensure the EUT maintains
only one WebSocket connection to a controller at a time.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP with requirement R-WS.6)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket and to comminucate to the controller
   that exists in the test environment.

#### Test Procedure

1. Send a Get message to the EUT using the following structure:

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

2. Open a second WebSocket connection to the EUT
3. Attempt to send the same message from step 1 over the second WebSocket connection

#### Test Metrics

1. After the second WebSocket connection is opened the EUT closes either
   the first or second WebSocket connection.

### 7.3 Agent session acceptance from Controller

#### Purpose

This test has been DEPRECATED as of version 1.0.1 of this test plan.

#### Functionality Tags

N/A

#### Test Setup

N/A

#### Test Procedure

N/A

#### Test Metrics

N/A

### 7.4 Closing a WebSocket Connection

#### Purpose

The purpose of this test is to ensure the EUT correctly implements the
procedure to close a WebSocket connection.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket.
2. Ensure there is an active WebSocket connection between the
   EUT and the controller that was initiated by the EUT.

#### Test Procedure

1. Send a `Close` WebSocket control frame to the EUT.
2. Wait for the EUT to close the underlying TCP session.

#### Test Metrics

1. The EUT closes the underlying TCP session after step 1.

### 7.5 Rejection of Session Establishment

#### Purpose

The purpose of this test is to ensure the EUT will correctly
reject WebSocket sessions.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket.
2. Configure the controller to reject WebSocket connections
   from the EUT.

#### Test Procedure

1. Configure he controller to not include the `Sec-WebSocket-Protocol`
   when opening new WebSocket connections.
2. Reboot the EUT
3. Attempt to start a WebSocket connection to the EUT.

#### Test Metrics

1. The EUT rejects the WebSocket connection with the missing
   `Sec-WebSocket-Protocol` header.

### 7.6 Error Handling - Unprocessed Records

#### Purpose

The purpose of this test is to ensure the EUT correctly closes
the WebSocket connection when a malformed USP Record is receieved.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket
2. Ensure there is an active WebSocket connection between
   the EUT and controller.

#### Test Procedure

1. Send a malformed USP record to the EUT.

#### Test Metrics

1. After step 1 the EUT closes the WebSocket connection with
   a WebSocket `Close` control frame containing status code 1003.

### 7.7 Use of Ping and Pong frames

#### Purpose

The purpose of this test is to ensure the EUT correctly
uses `Ping` and `Pong` control frames to keep the WebSocket
session alive.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket
2. Ensure there is an active WebSocket session between the
   EUT and the Controller.

#### Test Procedure

1. Send a `Ping` control frame to the EUT.
2. Wait up to 60 seconds for a `Pong` control frame from the EUT.
3. Send a `Pong` control frame to the EUT.

#### Test Metrics

1. The EUT sends a `Pong` control frame in response to the
   `Ping` control frame.
2. The EUT doesn't terminate the WebSocket connection after
   recieving an unsolicited `Pong` control frame.

### 7.8 WebSocket Session Retry

#### Purpose

The purpose of this test is to ensure the EUT will correctly
attempt to reestablish a WebSocket session if a session is
unexpectedly closed.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket.
2. Ensure there is an active WebSocket connection between the
   EUT and controller.

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
            param_paths: Device.LocalAgent.Controller.<test controller instance>.MTP.<active MTP instance>.
        }
    }
}
```

1. Configure the controller to reject new WebSocket connections.
2. Terminate the underlying TCP connection on the existing WebSocket connection.
3. Wait for the EUT to attempt to establish a WebSocket connection.
4. Configure the controlle to accept new WebSocket connections.
5. Wait for the EUT to attempt to establish a WebSocket connection.

#### Test Metrics

1. The EUT attempts to start a new WebSocket connection in conformance
   with the `SessionRetryMinimumWaitInterval` parameter.
2. The EUT makes a second attempt to start a new WebSocket connection
   in confromance with the `SessionRetryMinimumWaitInterval` and
   `SessionRetryIntervalMultiplier` parameters.

### 7.9 Use of TLS

#### Purpose

The purpose of this test is to ensure the EUT can establish and use
a secure WebSocket connection.

#### Functionality Tags

Conditional Mandatory (supports the WebSocket MTP)

#### Test Setup

1. Ensure the EUT is configured to use WebSocket.
2. Ensure the EUT and controller both have the required
   certificates to secure a websocket connection.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to connect to the controller.
3. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    mgs_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}
```

4. Wait for GetResponse from the EUT.

#### Test Metrics

1. The EUT starts a WebSocket connection with the controller
   using TLS.
2. The EUT sends a GetReponse in step 4.
