# 9 Functionality Test Cases

## 9.1 Use of the Timer! Event (DEPRECATED by 9.11)

### Purpose

The purpose of this test is to ensure the Timer! event can
be configured, and the EUT correctly triggers the event.

### Functionality Tags

Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.ScheduleTimer() command)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.LocalAgent.Controller.<Controller ID>.ScheduleTimer()'
                input_args {
                    key: 'DelaySeconds'
                    value: '60'
                }
            }
        }
    }
    ```

2. Wait for the EUT to send a Notification.

### Test Metrics

1. The EUT sends an OperateResponse with 'ScheduleTimer()' in the `executed_command` element.
2. The EUT sends a Notify message with an `event` element containing Timer!

## 9.2 Use of Device.LocalAgent.AddCertificate()

### Purpose

The purpose of this test is to ensure the AddCertificate() operation
on the EUT functions correctly.

### Functionality Tags

Conditional Mandatory (supports Device.LocalAgent.AddCertificate() command)

### Test Setups

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Have an alternate certificate that the EUT hasn't seen.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.LocalAgent.AddCertificate()'
                send_resp: true
                input_args {
                    key: 'Alias'
                    value: 'addedCert'
                }
                input_args {
                    key: 'Certificate'
                    value: '<new certificate>'
                }
            }
        }
    }
    ```

2. Reconfigure the Controller to use the new certificate.
3. Reestablish a connection to the EUT.
4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Certificate.'
            }
        }
    }
    ```

5. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.LocalAgent.Certificate.<cert instance>.Delete()'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an OperateResponse after step 1.
2. The EUT accepts the connection after the Controller has been reconfigured
   to use the new certificate.
3. The EUT returns a GetResponse after step 4 which contains an instance with
   an Alias which matches the certificate added in step 1.
4. The EUT sends an OperateResponse after step 5.

## 9.3 Upgraded the Agent's Firmware - Autoactivate enabled

### Purpose

The purpose of this test is to ensure the EUT can download firmware and
automatically activate it using the AutoActivate parameter.

### Functionality Tags

Conditional Mandatory (supports Firmware:1 profile)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that the EUT has a Subscription to the TransferComplete! and Boot!
   events with the Recipient being the Controller instance used for testing.
3. Ensure that the EUT has a Subscription instance for the OperationComplete
notification with a NotifType equal to 'OperationComplete' and a ReferenceList that matches 
the path of the 'Download()' command with the Controller used for testing set as the Recipient.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command:  'Device.DeviceInfo.FirmwareImage.<inactive instance>.Download()'
                input_args {
                    key: 'AutoActivate'
                    value: 'true'
                }
                input_args {
                    key: 'URL'
                    value: '<firmware URL>'
                }
                input_args {
                    key: 'Username'
                    value: '<optional username>'
                }
                input_args {
                    key: 'Password'
                    value:'<optional password>'
                }
                input_args {
                    key: 'FileSize'
                    value: '<file size>'
                }
            }
        }
    }
    ```

2. Wait for the EUT to send a Notification
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

### Test Metrics

1. The EUT sends a Notify message after step 1 containing a `oper_complete`
   element with a `command_name` of 'Download()'
2. The EUT sends a Notify message with a TransferComplete! event.
3. The EUT sends a Notify message with a Boot! event, with the
   'FirmwareUpdated' argument set to true.
4. The EUT sends a GetResponse message after step 3 which shows that
   Device.DeviceInfo.ActiveFirmwareImage matches the FirmwareImage instance
   on which the Download() operation was called; also that
   Device.DeviceInfo.SoftwareVersion matches the expected version.

## 9.4 Upgrading the Agent's Firmware - Using TimeWindow, Immediate

### Purpose

The purpose of this test is to ensure the EUT can activate a firmware image when
a TimeWindow object is used with Immediately mode.

### Functionality Tags

Conditional Mandatory (supports Firmware:1 profile with Activate() operation)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the EUT has a FirmwareImage instance containing inactive firmware.
3. Ensure the EUT has a Subscription instance for Boot! with the Controller
   used for testing set as the Recipient.
4. Ensure that the EUT has a Subscription instance for the OperationComplete
notification with a NotifType equal to 'OperationComplete' and a ReferenceList that matches the path of the 'Activate()' command with the Controller
used for testing set as the Recipient.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: "Device.DeviceInfo.FirmwareImage.<instance>.Activate()"
                input_args: {
                    key: 'TimeWindow.1.Start'
                    value: '1'
                }
                input_args: {
                    key: 'TimeWindow.1.End'
                    value: '100'
                }
                input_args: {
                    key: 'TimeWindow.1.Mode'
                    value: 'Immediately'
                }
            }
        }
    }
    ```

2. Wait for Notify message from the EUT.
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.SoftwareVersion'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends a Notify message within 5 seconds with an
   OperationComplete element with a `command_name` of 'Activate()'.
2. The EUT sends a Notify message with a Boot! event and a
   FirmwareUpdated argument set to true.
3. The EUT responds to the Get message with a GetResponse
   containing a SoftwareVersion element with the expected
   software version.

## 9.5 Upgrading the Agent's Firmware - Using TimeWindow, AnyTime

### Purpose

The purpose of this test is to ensure the EUT can activate a firmware image
when a TimeWindow instance used with the AnyTime mode.

### Functionality Tags

Conditionally Mandatory (implements Firmware:1 and Activate() operation)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the EUT has a FirmwareImage instance containing inactive firmware.
3. Ensure the EUT has a Subscription to the Boot! event with the Controller
   used for testing set as the Recipient.
 4. Ensure that the EUT has a Subscription instance for the OperationComplete
 notification with a NotifType equal to 'OperationComplete' and a ReferenceList
 that matches the path of the 'Activate()' command with the Controller
 used for testing set as the Recipient.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.DeviceInfo.FirmwareImage.<inactive instance>.Activate()'
                input_args: {
                    key: 'TimeWindow.1.Start'
                    value: '0'
                }
                input_args: {
                    key: 'TimeWindow.1.End'
                    value: '120'
                }
                input_args: {
                    key: 'TimeWindow.1.Mode'
                    value: 'AnyTime'
                }
            }
        }
    }
    ```

2. Wait for a Notify message from the EUT.
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.SoftwareVersion'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends a Notify message within 2 minutes after step 1.
2. The Notify message has a OperationComplete element.
3. The EUT sends a Notify message with a Boot! event and a
   FirmwareUpdated argument set to true.
3. The EUT sends a GetResponse after step 3 with a SoftwareVersion
   parameter that matches the expected version.


## 9.6 Upgrading the Agent's Firmware - Validated Firmware

### Purpose

The purpose of this test is to ensure the EUT can validate the integrity of
downloaded firmware.

### Functionality Tags

Conditional Mandatory (supports Firmware:1 profile)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that the EUT has Subscriptions to the TransferComplete! event
notification with the Controller used for testing set as the Recipient.

### Test Procedure

1. Send an Operate message to the EUT with the following structure using an invalid checksum:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.DeviceInfo.FirmwareImage.<inactive slot>.Download()'
                input_args {
                    key: 'URL'
                    value: '<firmware URL>'
                }
                input_args {
                    key: 'CheckSumAlgorithm'
                    value: 'SHA-1'
                }
                input_args {
                    key: 'CheckSum'
                    value: '<invalid checksum>'
                }
            }
        }
    }
    ```

2. Wait for a Notify message from the EUT.
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo.FirmwareImage.<previously used instance>.'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends a Notify message with a TransferComplete! event.
2. The EUT sends a Get response with a Status parameter of ValidationFailed.

## 9.7 Upgrading the Agent's Firmware - Download to Active Bank

### Purpose

The purpose of this test is to ensure the EUT is capable downloading and
installing new firmware for EUTs that may support only the active firmware bank.

### Functionality Tags

Conditional Mandatory (supports Firmware:1 profile)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that the EUT has a Subscription to the TransferComplete! event with
   the recipient being the  instance used for testing.
3. Ensure the EUT has a Subscription to the Boot! event and the
   Controller used for testing is set as the Recipient.
4. Record the number of firmware banks the EUT supports.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.DeviceInfo.FirmwareImage.<active firmware slot>.Download()'
                input_args {
                    key: 'URL'
                    value: '<firmware URL>'
                }
                input_args {
                    key: 'AutoActivate'
                    value: 'true'
                }
            }
        }
    }
    ```

2. Wait for a Notify message from the EUT.

### Test Metrics

If the EUT supports only one firmware bank:
1. The EUT sends a Notify message with a TransferComplete! event.
2. the EUT sends a Notify message with a Boot! event and a FirmwareUpdated
   argument set to true.

If the EUT supports multiple firmware banks:
3. The EUT may send an error indicating that downloading to an active firmware
slot is not allowed. 
4. If the EUT did not send an error message in Test Metric 3, the EUT sends a
   Notify message with a TransferComplete! event.
5. If the EUT did not send an error message in Test Metric 3, the EUT sends a
   Notify message with a Boot! event and a FirmwareUpdated argument set to true.

## 9.8 Upgrading the Agent's Firmware - Cancelling a request using the Cancel() command

### Purpose

The purpose of this test is to ensure the EUT can correctly
cancel a Download() operation.

### Functionality Tags

Conditional Mandatory (supports Firmware:1 profile and Device.LocalAgent.Request.{i}.Cancel() operation)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the EUT has inactive firmware in one of FirmwareImage slots.
3. Ensure the EUT has a subscription to the Boot! event with the
   Controller used for testing set as the Recipient.

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.DeviceInfo.FirmwareImage.<valid instance>.Activate()'
                input_args {
                    key: 'TimeWindow.1.Start'
                    value: '120'
                }
                input_args {
                    key: 'TimeWindow.1.End'
                    value: '500'
                }
                input_args {
                    key: 'TimeWindow.1.Mode'
                    value: 'AnyTime'
                }
                send_resp: true
            }
        }
    }
    ```

2. Send an  message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.LocalAgent.Request.<returned in step 1>.Cancel()'
            }
        }
    }
    ```

3. Wait up to 500 seconds for a Boot! event from the EUT.
4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Request.'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends a OperationResponse after step 1 with a `executed_command`
   element of 'Activate()' and a `req_obj_path` referencing an entry in the
   Device.LocalAgent.Request table.
2. The EUT never sends a Boot! event.
3. In the GetResponse from the EUT after step 4, the Request instance is
   either non-existent or the Status parameter of the relevant request is
   either Cancelled or Cancelling.

## 9.9 Adding a New Controller - OnBoardRequest

### Purpose

The purpose of this test is to ensure the EUT can handle the
manual adding of a new Controller.

### Functionality Tags

Conditional Mandatory (supports Controller:1 profile with the ability to create instances of the Device.LocalAgent.Controller. object, supports SendOnBoardRequest())

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. A valid role instance is configured on the EUT for use with the new certificate.
3. A valid certificate instance is configured on the EUT
4. A secondary Controller is configured and ready to communicate with another endpoint.

### Test Procedure

1. Send an Add message to the EUT with the following structure.

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: ADD
    }
    body {
        request {
            add {
                create_objs {
                    obj_path: 'Device.LocalAgent.Controller.'
                    param_settings {
                            param: 'Alias'
                            value: 'usp-111-Controller'
                        }
                    param_settings {
                            param: 'EndpointID'
                            value: '<new Controller endpoint ID>'
                        }
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'AssignedRole'
                            value: '<valid role instance>'
                        }
                }
            }
        }
    }
    ```

2. Send an Add message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: ADD
    }
    body {
        request {
            add {
              create_objs {
                obj_path: 'Device.LocalAgent.Controller.<new Controller instance>.MTP.'
                param_settings: {
                        param: 'Enable'
                        value: 'true'
                    }
                param_settings: {
                        param: 'Protocol'
                        value: '<supported MTP>'
                    }
               }
                  #  .
                  #  .
                  #  <further parameters to configure supported MTP>
                  #  .
                  #  .
            }
        }
    }
    ```

3. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.LocalAgent.Controller.<new instance>.SendOnBoardRequest()'
            }
        }
    }
    ```

4. Allow the secondary Controller to receive the OnBoardRequest() and send a
   NotifyResponse.

### Test Metrics

1. The EUT is able to start a session with the secondary Controller.
2. The EUT sends a Notify message to the secondary Controller containing an
   OnBoardRequest element.

## 9.10 Use of the Boot! event and BootParameters

### Purpose

The purpose of this test is to ensure the EUT correctly triggers the Boot!
event and correctly includes the configured BootParameters.

### Functionality Tags

Conditional Mandatory (supports Reboot:1 profile, supports Device.DeviceInfo.BootFirmwareImage)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

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
                create_objs {
                        obj_path: 'Device.LocalAgent.Subscription.'
                        param_settings {
                                param: 'NotifType'
                                value: 'Event'
                            }
                        param_settings {
                                param: 'ReferenceList'
                                value: 'Device.Boot!'
                            }
                        param_settings {
                                param: 'Enable'
                                value: 'true'
                            }
                    }
                create_objs {
                        obj_path: 'Device.LocalAgent.Controller.<Controller instance>.BootParameter.'
                        param_settings {
                                param: 'Enable'
                                value: 'true'
                            }
                        param_settings {
                                param: 'ParameterName'
                                value: 'Device.DeviceInfo.BootFirmwareImage'
                            }
                    }
            }
        }
    }
    ```

2. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.Reboot()'
            }
        }
    }
    ```

3. Wait for a Notify message from the EUT.

### Test Metrics

1. After step 2 the EUT sends a Notify message with an event element
   containing a ParameterMap argument with 'Device.DeviceInfo.BootFirmwareImage'

## 9.11 Use of the Timer! Event

### Purpose

The purpose of this test is to ensure the Timer! event can
be configured, and the EUT correctly triggers the event.

### Functionality Tags

Conditional Mandatory (supports Device.ScheduleTimer() command)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that a Subscription object exists on the EUT with NotifType
   OperationComplete on Device.ScheduleTimer().

### Test Procedure

1. Send an Operate message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: OPERATE
    }
    body {
        request {
            operate {
                command: 'Device.ScheduleTimer()'
                send_resp: true
                input_args {
                    key: 'DelaySeconds'
                    value: '60'
                }
            }
        }
    }
    ```

2. Wait for the EUT to send a Notification.

### Test Metrics

1. The EUT sends an OperateResponse with ScheduleTimer() in the executed_command
   element.
2. The EUT sends an OperationComplete Notify message with an event element
   containing ScheduleTimer().
