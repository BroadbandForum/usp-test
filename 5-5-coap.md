## 5.5 CoAP Test Cases

### 5.5.1 Mapping a USP Record to a CoAP message

#### Purpose

The purpose of this test is to ensure the EUT can properly use
CoAP to transport USP Records.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

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
            param_paths: Device.LocalAgent.
        }
    }
}
```

2. Wait for a GetResponse

#### Test Metrics

1. The GetResponse is encapsulated in a CoAP message.
2. The CoAP message used transport the GetResponse uses application/octet-stream
   for Content-Format.

### 5.5.2 USP Records that exceed CoAP message size

#### Purpose

The purpose of this test is to ensure the EUT properly segments large
USP records and transports them using block encapsulation.

#### Funtionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

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
            param_path: Device.
        }
    }
}
```

2. Wait for a GetResponse

#### Test Metrics

1. The EUT sends the GetResponse message using multiple
   block encapsulated CoAP messages.

### 5.5.3 Successful CoAP exchange

#### Purpose

The purpose of this test is to ensure the EUT correctly
sends a 2.04 Changed response to CoAP messages.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

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
            param_paths: Device.LocalAgent.
        }
    }
}
```
#### Test Metrics

1. After the transmission of the Get message the EUT sends a 2.04 Changed
   message.

### 5.5.4 Failed CoAP exchange - timeout

#### Purpose

The purpose of this test is to ensure the EUT behaves correctly when a timeout
occurs at the MTP layer when using CoAP.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

#### Test Procedure

1. Configure the  to not send 2.04 Changed responses to CoAP messages
2. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_path: Device.LocalAgent.
        }
    }
}
```

3. Wait for a GetResponse message from the EUT.
4. Prevent the Controller from sending a 2.04 Changed CoAP response.
5. Wait for EUT to retry sending the GetResponse.
6. Allow the Controller to send a 2.04 Changed CoAP response.

#### Test Metrics

1. The EUT attempts to retransmit the GetResponse message after
   not receieving a 2.04 Changed from the Controller.

### 5.5.5 Failed CoAP Exchange - Invalid Method

#### Purpose

The purpose of this test is to ensure the EUT correctly responds when it receives
a CoAP message with an invalid method.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP records to each other.
2. The EUT the Controller are configured to communicate over CoAP.

#### Test Procedure

1. Send a USP record to the EUT using a CoAP message with method code `0x06`.
2. Wait up to 60 seconds for the EUT to send a CoAP response.

#### Test Metrics

1. The EUT sends a reply to the CoAP message with an invalid method code.
2. The EUT's CoAP response uses code `4.05` to indicate an invalid CoAP method.

### 5.5.6 Failed CoAP Exchange - Invalid Content-Format

#### Purpose

The purpose of this test is to ensure the EUT properly responds to
CoAP messages that feature invalid Content-Format options.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

#### Test Procedure

1. Send a USP record to the EUT using a CoAP message with Content-Format option `0x113a`.
2. Wait up to 60 second for the EUT to respond.

#### Test Metrics

1. The EUT sends a reply to the CoAP message with an invalid Content-Format.
2. The EUT's CoAP response uses code `4.15` to indicate an invalid Content-Format.

### 5.5.7 Failed CoAP Exchange - Invalid USP Record

#### Purpose

The purpose of this is to ensure the EUT properly responds to a
CoAP message containing a malformed USP record.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP records to each other.
2. The EUT and Controller are configured to communicate over CoAP.

#### Test Procedure

1. Send a malformed USP record to the EUT in a CoAP message.
2. Wait up to 60 seconds for the EUT to send a CoAP reply.

#### Test Metrics

1. The EUT sends a reply to the CoAP message with the malformed USP record.
2. The EUT's CoAP response uses code `4.00` to indicate the USP record is
   invalid or not understandable.

### 5.5.8 Use of DTLS

#### Purpose

The purpose of this test is to ensure the EUT can secure communication
with another CoAP endpoint at the CoAP layer.

#### Functionality Tags

Conditional Mandatory (supports the CoAP MTP)

#### Test Setup

1. Ensure that the EUT and test equiment have the nessesary information to send
   and receive USP records to each other.
2. The EUT and Controller are configured to communicate over CoAP using DTLS.
3. The EUT and Controller have the necessary information about one another
   to establish an encrypted channel of communication.

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
            param_paths: Device.LocalAgent.
        }
    }
}
```

2. Wait for the EUT to send a GetReponse.

#### Test Metrics

1. The Controller is able to establish a DTLS session with the EUT.
2. The EUT established a DTLS session and sends a GetResponse.
