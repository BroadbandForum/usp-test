# 3 USP Record Test Cases

## 3.1 Bad request outside a session context

### Purpose

The purpose of this test is to ensure the EUT correctly responds to a
bad request outside a session context.

### Functionality Tags

Mandatory

### Test Setup

1. Ensure the EUT is configured to not use a session context.
2. Ensure that the EUT and test equipment have the necessary
   information to send and receive USP Records to each other.

### Test Procedure

1. Send a malformed USP Record to the EUT.

### Test Metrics

1. After the EUT receives the malformed USP record, it exibits the expected
   'bad request' behavior for the applicable MTP.

## 3.2 Agent Verifies Non-Payload Field Integrity

### Purpose

The purpose of this test is to ensure the EUT verifies the integrity
of the non-payload fields in a USP record.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Ensure the relevant equipment are configured to NOT provide integrity protection
   at the MTP layer.
2. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP records to each other.

### Test Procedure

1. Send a Get message to the EUT with a `payload_security` of PLAINTEXT.

### Test Metrics

1. After the EUT receives the USP record, it
exhibits the expected 'bad request' behavior for the applicable MTP.

## 3.3 Agent rejects invalid signature starting a session context

### Purpose

The purpose of this test is to ensure the EUT handles an attempt to start
a session context with an invalid mac_signature.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
  send and receive USP records to each other.

### Test Procedure

1. Send a TLS 'client hello' to the EUT to begin a session context as described
in '[End to End Message Exchange](https://usp.technology/specification/e2e-message-exchange/)'
in TR-369 with an invalid mac_signature.

### Test Metrics

1. After the EUT receives the USP record, it
exhibits the expected 'bad request' behavior for the applicable MTP.

## 3.4 Using TLS for USP Record Integrity

### Purpose

The purpose of this test is to ensure the EUT uses TLS to validate the
integrity of USP records when the `payload_security` is TLS and the TLS
handshake has completed.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Ensure the EUT and controller are configured to secure the USP record
   payload with TLS.

### Test Procedure

1. Start a E2E session with the EUT using TLS to secure the payload.
2. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.'
            }
        }
    }
    ```

### Test Metrics

1. In the GetResponse sent by the EUT, the `mac_signature` in the
   USP Record secures the non-payload fields via the MAC mechanism.
2. The `mac_signature` in the USP record sent by the EUT validates the
   integrity of the non-payload fields.

## 3.5 Failure to Establish TLS

### Purpose

The purpose of this test is to ensure the EUT behaves correctly when the
TLS session used to encapsulate the payload cannot be established.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Configure the controller to use TLS12 as a `payload_security`.
2. Ensure `PeriodicNotifInterval` is 60, and the controller used for
   testing is subscribed to Periodic Event Notification.

### Test Procedure

1. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
            }
        }
    }
    ```

2. Attempt to establish a new secure session with the EUT using
   TLS payload encapsulation.
3. Configure the controller to send TLS alerts during the TLS handshake
   process.
4. Wait for the EUT to attempt to start a session with the controller.
5. Allow the controller to send a TLS alert to the EUT and for the session
   to terminate.
6. Configure the controller to not send a TLS alert.
7. Wait for the EUT to retry establishing a E2E session.


### Test Metrics

1. After sending the client certificate to the EUT, the
   EUT sends a TLS alert, terminating the session.
2. After step 5, the EUT waits before retrying the session in
   accordance with the `SessionRetry` parameters found in step 1.

## 3.6 Agent does not accept TLS renegotiation for E2E message exchange

### Purpose

The purpose of this test is to ensure the EUT does not accept TLS renegotiation.
frames during a E2E message exchange.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Ensure both the EUT and the controller are configured to use TLS payload security.

### Test Procedure

1. Establish a E2E session with the EUT.
2. Send a request to renegotiate TLS in place of the payload.
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.'
            }
        }
    }
    ```

4. Wait for a GetResponse from the EUT.

### Test Metrics

1. Between sending the TLS renegotiation request and receiving the
   GetResponse, the EUT either sends no records, or sends a TLS alert of type `no_renegotiation(100)`.

## 3.7 Use of X.509 Certificates

### Purpose

The purpose of this test is to ensure the EUT correctly uses
X.509 certificates to authenticate other endpoints, and in turn
provides a X.509 certificate for the purpose of authentication.

### Functionality Tags

'Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)'

### Test Setup

1. Ensure the EUT and controller are configured to use TLS payload security.

### Test Procedure

1. Configure the controller to provide a X.509 certificate with a `subjectAltName`
   that does not match the controller's USP endpoint ID.
2. Attempt to start a session with the EUT and send a Get message with the
   following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.'
            }
        }
    }
    ```

### Test Metrics

1. During the TLS handshake the EUT provides a X.509 certificate with a
   `subjectAltName` that matches the endpoint ID of the EUT.
2. During the TLS handshake the EUT requests a X.509 certificate from the
   controller.
3. The EUT rejects the controller's certificate.

## 3.8 Establishing a Session Context

### Purpose

The purpose of this test is to ensure the EUT can use a session context
to exchange USP messages.

### Functionality Tag

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information
   to establish a connection and exchange USP messages.
2. Ensure at the start of the test there is no existing session
   context between the EUT and controller.

### Test Procedure

1. Start a session context with the EUT and send a Get message
   with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.'
            }
        }
    }
    ```

### Test Metrics

1. After step 1, the EUT responds with a USP record containing
   a session context, a `sequence_number` of 1 and a `session_id`
   that matched the session identifier sent to the EUT.

## 3.9 Receipt of a Record out of a Session Context

### Purpose

The purpose of this test is to ensure the EUT correctly handles the receiving
of a USP record outside of a session context.

### Functionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to
   establish a session and exchange USP messages.

### Test Procedure

1. Start a session with the EUT using a session context.
2. Send a Get message to the EUT for `Device.DeviceInfo.` using a
   USP Record with the following structure:

    ```
    Record {
          session_context {
            session_id: <new_session_id>
            sequence_id:  <expected sequence_id>
            expected_id:  <expected expected_id>
            payload {
                #  ...
              }
            }
          }
    ```

### Test Metrics

1. The EUT sends the GetResponse in a USP Record using the new `session_id`
   and a `sequence_id` of 1.

## 3.10 Session Context Expiration

### Purpose

The purpose of this test is to ensure the EUT correctly adheres to the
`SessionExpiration` parameter.

### Fuctionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information required
   to start a session and exchange USP records.
2. Ensure the controller is subscribed to Periodic! event.

### Test Procedure

1. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: SET
    }
    body {
        request {
            set {
                update_objs {
                        obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                        param_settings {
                                param: 'SessionExpiration'
                                value: '60'
                            }
                    }
                update_objs {
                        obj_path: 'Device.LocalAgent.Controller.<controller instance>.'
                        param_settings {
                                param: 'PeriodicNotifInterval'
                                value: '10'
                            }
                    }
            }
        }
    }
    ```

2. Wait for 3 Notify messages from the EUT containing a Periodic! event.
3. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: SET
    }
    body {
        request {
            set {
                update_objs {
                        obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                        param_settings: {
                                param: 'SessionExpiration'
                                value: '5'
                            }
                    }
                update_objs {
                        obj_path: 'Device.LocalAgent.Controller.<controller instance>.'
                        param_settings {
                                param: 'PeriodicNotifInterval'
                                value: '10'
                            }
                    }
            }
        }
    }
    ```

4. Wait for 3 Notify messages from the EUT containing a Periodic! event.

### Test Metrics

1. All three Notify messages received in step 2 use the same session context.
2. None of the three Notify messages received in step 4 shared the same session
   context.

## 3.11 Use of Sequence ID and Expected ID

### Purpose

The purpose of this test is to ensure the EUT correctly uses the `sequence_id`
and `expected_id` attributes found in a session context.

### Functionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to start
   a session and exchange USP messages.
2. Ensure the controller is not subscribed to any events on the EUT.

### Test Procedure

1. Start a session with the EUT.
2. Send a Get message to the EUT with the expected `sequence_id` and `expected_id`
   for `Device.DeviceInfo.ModelNumber`.
3. Send a Get message to the EUT with the `sequence_id` set to the expected value
   plus 2 for `Device.DeviceInfo.SoftwareVersion`.
4. Send a Get message to the EUT with the `sequence_id` set to 2 less than the
   expected value for `Device.DeviceInfo.HardwareVersion`.
5. Send a Get message to the EUT with the expected `sequence_id` and `expected_id`
   for `Device.DeviceInfo.HardwareVersion`.

### Test Metrics

1. After step 1 the EUT returns a GetResponse with a `sequence_id` that matches
   the `expected_id` in the record that was sent.
2. After step 3 the EUT returns a GetResponse with a `sequence_id` that matches
   the `expected_id` in the record that was sent in step 4.
4. The EUT never sends a GetResponse with a `sequence_id` that matches the
   `expected_id` in the record sent in step 3.
5. After step 5 the EUT returns a GetResponse with a `sequence_id` that matches
   the `expected_id` in the record that was sent.
6. After step 5 The EUT sends a GetResponse containing the parameter
   `Device.DeviceInfo.SoftwareVersion`.

## 3.12 Preservation of USP Records

The purpose of this test is to ensure the EUT preserves a sent record in
the event the receiving endpoint requests a retransmission.

### Functionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to
   start a session an exchange USP messages.

### Test Procedures

1. Start a new session.
2. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.'
            }
        }
    }
    ```

3. Wait 60 seconds.
4. Send a USP record to the EUT with a `retransmit_id` set to the
   `expected_id` value in the record sent in step 1.

### Test Metrics

1. The EUT sends the same GetResponse twice, once after step 2 and once
   after step 4.

## 3.13 Agent Rejects Records with Different Payload Security than the Established Context

### Purpose

The purpose of this test is to ensure the EUT does not accept USP Records that
have a different `payload_security` value than the that of the established
session context.

### Functionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to start a
   session and exchange USP messages.
2. Ensure the EUT and controller have the necessary information to
   secure the USP record payload using TLS.

### Test Procedure

1. Starts a session with the EUT using `payload_security` TLS12.
2. After the session is established, send the following Get message
   for any valid parameter using `payload_security` PLAINTEXT and
   a plaintext.

### Test Metrics

1. The EUT does not send a GetResponse.
2. The EUT starts a new session after step 2.

## 3.14 Use of retransmit_id

### Purpose

The purpose of this test is to ensure the EUT correctly
uses the `retransmit_id` value in a USP record and adheres to
the related parameters in the data model.

### Functionality Tags

Conditionality Mandatory (supports session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to
   start a session and exchange USP messages.

### Test Procedure

1. Send a Set message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: SET
    }
    body {
        request {
            set {
                update_objs {
                        obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                        param_settings {
                                param: 'MaxRetransmitTries'
                                value: '2'
                            }
                    }
            }
        }
    }
    ```

2. Wait for a SetResponse
3. Send a USP record with a `retransmit_id` set to the value of the `sequence_id` found in the
   SetResponse in step 2.
4. Repeat steps 2 and 3 twice more.

### Test Metrics

1. The first three SetResponse messages are sent in the same session context.
2. On the third retransmit request, the EUT doesn't send a SetResponse and
   instead starts a new session with the controller.

## 3.15 Handling Duplicate Records

### Purpose

The purpose of this test is to ensure the EUT can correctly handle receiving
duplicate records.

### Functionality Tags

Conditional Mandatory (supports USP session context)

### Test Setup

1. Ensure the EUT and controller have the necessary information to start
   session and exchange USP messages.

### Test Procedure

1. Start a session with the EUT.
2. Send a Get message to the EUT requesting a parameter that is
   known to exist.
3. Retransmit the same USP record sent in step 2 to the EUT, using
   the same non-payload USP record field values.
4. Repeat step 3 twice more.

### Test Metrics

1. The EUT send only one GetResponse.
