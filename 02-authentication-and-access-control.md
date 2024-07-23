# 2 Authentication and Access Control Test Cases

## 2.1 Agent does not accept messages from its own Endpoint ID

### Purpose

The purpose of this test is to ensure the EUT does not respond to a USP message
when the `from_id` is the EUT endpoint ID.

### Functionality Tag

Mandatory

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

### Test Steps

1. Send a message to the EUT with the following record structure:

    ```{filter=pbv type=Record}
        to_id: '<EUT_ID>'
        from_id: '<EUT_ID>'

        session_context {
            # ...
        }
    ```

### Test Metrics

1. The EUT does not respond to the message.

## 2.2 Agent rejects messages that do not contain its to_id in the USP Record

### Purpose

The purpose of this test is to ensure the EUT does not respond to a USP message
when the USP record doesn't contain a the EUT `to_id`.

### Functionality Tags

Mandatory

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

### Test Steps

1. Send a message to the EUT with the following record structure:

    ```{filter=pbv type=Record}
        to_id: '<invalid ID>'
        from_id: '<EUT_ID>'

        # ...

    ```

### Test Metrics

1. The EUT does not respond to the USP message.

## 2.3 Agent does not process messages without 's certificate information  - DEPRECATED

### Purpose

The purpose of this test is to ensure that the EUT doesn't process a USP message
when the EUT does not possess the Controller's certificate information.

### Functionality Tags

Deprecated

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Simulate a second Controller whose credentials are signed by an untrusted
certificate authority.
3. Ensure that the UntrustedRole feature is either unsupported or disabled in
the EUT.

### Test Procedure

1. Send a Get message from the second simulated Controller to the EUT with the following structure:

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

1. Ensure the EUT does not respond to the Get message.

## 2.4 Agent rejects messages from Endpoint IDs that are not in subjectAltName  - DEPRECATED

### Purpose

The purpose of this test is to ensure that the EUT rejects a message from an
Endpoint ID that doesn't match the subjectAltName in the provided certificate.

### Functionality Tags

Deprecated

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

### Test Procedure

1. Send a Get message to the EUT using a certificate with a
   subjectAltName that does not match the Controller's Endpoint ID.

### Test Metrics

1. The EUT does not respond to the Get message.

## 2.5 Agent use of self-signed certificates - DEPRECATED

### Purpose

The purpose of this test is to ensure the EUT can handle self-signed certificates.

### Functionality Tags

Deprecated

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure the  is configured to use a self-signed certificate and Endpoint ID
   that the EUT has not seen.

### Test Procedure

1. Send a Get message to the EUT using a self-signed cert with the following
   structure:

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

1. The EUT responds to the Get with a GetResponse containing a
   'Device.LocalAgent.ControllerTrust.{i}.Alias' parameter.

## 2.6 Connecting without absolute time

### Purpose

The purpose of this test is to ensure the EUT can communicate with a Controller
if it cannot obtain an absolute time.

### Functionality Tags

Conditional Mandatory (Supports USP Session Context)

### Test Setup

1. The EUT is booted into a test environment where it cannot resolve absolute time.
2. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
3. Ensure the Controller is configured to use an expired certificate.

### Test Procedure

1. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header{
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

1. The EUT responds to the Get message with a GetResponse, ignoring the expired
   dates on the certificate.

## 2.7 Agent ignores unsigned or invalid Record signatures

### Purpose

The purpose of this test is to ensure the EUT will ignore a USP record when
the signature field is invalid.

### Functionality Tags

Conditional Mandatory (Supports USP Session Context)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

### Test Procedure

1. Send a Get message to the EUT with an invalid signature value.

### Test Metrics

1. The EUT does not respond to the Get message.

## 2.8 Agent ignores invalid TLS certificate

### Purpose

The purpose of this test is to ensure the EUT rejects TLS connections when
an Endpoint's TLS certificate is invalid.

### Functionality Tags

Conditional Mandatory (Supports USP Session Context)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that the EUT has obtained an absolute time reference.

### Test Procedure

1. Send a Get message to the EUT with an expired TLS certificate.

### Test Metrics

1. The EUT doesn't respond to the Get message.

## 2.9 Use of the Untrusted role

### Purpose

The purpose of this test is to ensure the EUT correctly assigns new
a Role of Untrusted.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

### Test Procedure

1. Using a secondary Controller, connect to the EUT and send an Get message.
2. Using the primary trusted Controller send a Get message to the EUT with the
   following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.'
            }
        }
    }
    ```

### Test Metrics

1. Ensure the `Device.LocalAgent.Controller.<secondary Controller instance>.AssignedRole`
   matches the value of `Device.LocalAgent.ControllerTrust.UntrustedRole`.

## 2.10 Adding a Role

### Purpose

The purpose of this test is to ensure that the Add message can be used to add
new Roles to the EUT data model.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

### Test Procedure

1. Send a Add message to the EUT with the following structure:

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.'
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                    param_settings {
                        param: 'Name'
                        value: 'Trusted'
                    }
                }
            }
        }
    }
    ```

### Test Metrics

1. The EUT correctly sent an AddResponse with a new Role instance.

## 2.11 Permissions - Object Creation Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
allow the creation of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Subscription.'
                        }
                    param_settings {
                            param: 'Obj'
                            value: 'rw--'
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
                allow_partial: false
                create_objs {
                    obj_path: 'Device.LocalAgent.Subscription.'
                }
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a oper_success element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an AddResponse with a oper_success element containing a
   new Device.LocalAgent.Subscription. object in step 2.

## 2.12 Permissions - Object Creation Not Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
restrict the creation of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

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
                obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                param_settings {
                        param: 'Targets'
                        value: 'Device.LocalAgent.Subscription.'
                    }
                param_settings {
                        param: 'Obj'
                        value: 'r---'
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
            allow_partial: false
            create_objs {
                obj_path: 'Device.LocalAgent.Subscription.'
            }
        }
    }
}
```

### Test Metrics

1. The EUT sends an AddResponse with a oper_success element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an Error containing type '7006' - Permission Denied.

## 2.13 Permissions - Object Deletion Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
allow the deletion of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is one or more Subscription object that can be deleted.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Subscription.'
                        }
                    param_settings {
                            param: 'InstantiatedObj'
                            value: 'rw--'
                        }
                }
            }
        }
    }
    ```

2. Send an Delete message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: DELETE
    }
    body {
        request {
            delete {
                allow_partial: false
                obj_paths: 'Device.LocalAgent.Subscription.<subscription to delete>'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an DeleteResponse with a `oper_success` element containing the
   Device.LocalAgent.Subscription. object in step 2.

## 2.14 Permissions - Object Deletion Not Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
restrict the deletion of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is one or more Subscription object that can be deleted.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Subscription.'
                        }
                    param_settings {
                            param: 'InstantiatedObj'
                            value: 'r---'
                        }
                }
            }
        }
    }
    ```

2. Send an Delete message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: DELETE
    }
    body {
        request {
            delete {
                allow_partial: false
                obj_paths: 'Device.LocalAgent.Subscription.<subscription to delete>'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an Error containing type '7006' - Permission Denied.

## 2.15 Permissions - Parameter Update Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
allow the update of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is one or more Subscription object that can be edited.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Subscription.<instance that can be edited>.'
                        }
                    param_settings {
                            param: 'Param'
                            value: 'rw--'
                        }
                }
            }
        }
    }
    ```

2. Send a Set message to the EUT with the following structure:

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
                        obj_path: 'Device.LocalAgent.Subscription.<instance that can be edited>.'
                        param_settings {
                                param: 'Enable'
                                value: '<negation of previous value>'
                                required: true
                            }
                    }
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends a SetResponse with a `oper_success` element containing
   Device.LocalAgent.Subscription.{i}.Enable in step 2.

## 2.16 Permissions - Parameter Update Not Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
restrict the update of a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is one or more Subscription object that can be edited.

### Test Steps

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Subscription.<instance that can be edited>.'
                        }
                    param_settings {
                            param: 'Param'
                            value: 'r---'
                        }
                }
            }
        }
    }
    ```

2. Send a Set message to the EUT with the following structure:

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
                        obj_path: 'Device.LocalAgent.Subscription.<instance that can be edited>.'
                        param_settings {
                                param: 'Enable'
                                value: '<negation of previous value>'
                                required: true
                            }
                    }
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an Error containing type '7006' - Permission Denied.

## 2.17 Permissions - Operation Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
allow the invocation of commands on a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

### Test Steps

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.Reboot()'
                        }
                    param_settings {
                            param: 'CommandEvent'
                            value: 'r-x-'
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
                send_resp: true
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an OperateResponse with a `req_output_args` element in step 2.

## 2.18 Permissions - Operation Not Allowed

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
restrict the invocation of commands on a particular object.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

### Test Steps

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.Reboot()'
                        }
                    param_settings {
                            param: 'CommandEvent'
                            value: 'r---'
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

### Test Metrics

1. The EUT sends an AddResponse with a `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an OperateResponse message containing a `cmd_failure` element with an appropriate error code.

*NOTE: The behavior required in Metric 2 was updated in USP 1.4, and was updated here to ensure that 
implementations seeking certification would use the correct behavior. If an implementation using 
USP 1.3 or earlier is tested against this test case, it MAY respond with a USP Error Message instead.*

## 2.19 Permissions - Value Change Notification Allowed on Parameter

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
allow a Controller to subscribe to the ValueChange notification of a particular
parameter.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

### Test Steps

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'
                        }
                    param_settings {
                            param: 'Param'
                            value: 'rw-n'
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
                allow_partial: false
                create_objs {
                    obj_path: 'Device.LocalAgent.Subscription.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'NotifType'
                            value: 'ValueChange'
                        }
                    param_settings {
                            param: 'ReferenceList'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'
                        }
                }
            }
        }
      }
    ```

3. Send a Set message to the EUT, setting
   Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval to a new value.

4. Wait for a Notification from the EUT.

### Test Metrics

1. The EUT sends an AddResponse with an `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an AddResponse with an `oper_success` element containing a
   new Device.LocalAgent.Subscription. object in step 2.
3. The EUT sends a SetResponse with an `oper_success` element with the path
   'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'.
4. The EUT sends a Notify message with a `value_change` element pointing to
   'Device.LocalAgent.Controller.<Controller instance>.PeriodicNotifInterval'.

## 2.20 Permissions - Value Change Notification Not Allowed on Parameter

### Purpose

The purpose of this test is to ensure the EUT adheres to permissions set to
restrict a Controller from subscribing to the ValueChange notification of a particular
parameter.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.

### Test Steps

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'
                        }
                    param_settings {
                            param: 'Param'
                            value: 'rw--'
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
                allow_partial: false
                create_objs {
                    obj_path: 'Device.LocalAgent.Subscription.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'NotifType'
                            value: 'ValueChange'
                        }
                    param_settings {
                            param: 'ReferenceList'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'
                        }
                }
            }
        }
    }
    ```

3. Send a Set message to the EUT, setting
   Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval to a new value.

4. Wait 30 seconds.

### Test Metrics

1. The EUT sends an AddResponse with an `oper_success` element containing a
   new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.
2. The EUT sends an AddResponse with an `oper_success` element containing a
   new Device.LocalAgent.Subscription. object in step 2.
3. The EUT sends a SetResponse with an `oper_success` element with the path
   'Device.LocalAgent.Controller.<Controller instance id>.PeriodicNotifInterval'.
4. The EUT does not send a Notify message with a value_change element pointing
to 'Device.LocalAgent.Controller.<Controller instance>.PeriodicNotifInterval'.

## 2.21 Permissions - Overlapping Permissions

### Purpose

The purpose of this test is to ensure the EUT allows for the creation
of Permission instances, and when Permissions overlap the EUT behaves
correctly.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is at least one BootParameter configured.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.<Controller id>.Role.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.BootParameter.<boot parameter instance>.'
                        }
                    param_settings {
                            param: 'Param'
                            value: '----'
                        }
                    param_settings {
                            param: 'Order'
                            value: '<lowest available value>'
                        }
                    }
                create_objs {
                    obj_path: 'Device.LocalAgent.ControllerTrust.<Controller id>.Role.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.BootParameter.<boot parameter instance>.'
                        }
                    param_settings {
                            param: 'Param'
                            value: 'rw--'
                        }
                    param_settings {
                            param: 'Order'
                            value: '<value which is higher than the Order value set in the other Permission instance>'
                        }
                }
            }
        }
    }
    ```

2. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.<Controller instance ID>.BootParameter.'
            }
        }
    }
    ```

3. Send an Add message to the EUT with the following structure:

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.<Controller id>.Role.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.BootParameter.<boot parameter instance>.'
                        }
                    param_settings {
                            param: 'Param'
                            value: '----'
                        }
                    param_settings {
                            param: 'Order'
                            value: '<value which is higher than both Order values set in step 1>'
                        }
                    }
            }
        }
    }
    ```

4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.<Controller instance ID>.BootParameter.'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse message after step 1. The message contains
   two `oper_success` elements, one for each added permission.
2. The EUT sends a GetResponse with a `result_params` element containing
   parameters of the specified BootParameter instance.
3. The EUT sends an AddResponse message after step 3. The message contains
   an `oper_success` element.
4. The EUT sends a GetResponse that does not contain the specified BootParameter
   instance.


## 2.22 Using Get when no read permissions are available on some parameters

### Purpose

The purpose of this test is to ensure the EUT correctly returns parameters that are readable
while ignoring parameters that do not have read permissions.

### Functionality Tags

Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure the Controller used for testing has an assigned Role that is writable.
3. Ensure there is at least one BootParameter configured.

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
                        obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller trust instance>.Permission.'
                        param_settings {
                                param: 'Enable'
                                value: 'true'
                            }
                        param_settings {
                                param: 'Targets'
                                value: 'Device.LocalAgent.Controller.<Controller instance ID>.BootParameter.<known instance>.'
                            }
                        param_settings {
                                param: 'Param'
                                value: 'rw--'
                            }
                    }
                create_objs {
                        obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller trust instance>.Permission.'
                        param_settings {
                                param: 'Enable'
                                value: 'true'
                            }
                        param_settings {
                                param: 'Targets'
                                value: 'Device.LocalAgent.Controller.<Controller instance ID>.BootParameter.<known instance>.ParameterName'
                            }
                        param_settings {
                                param: 'Param'
                                value: '----'
                            }
                    }
            }
        }
    }
    ```

2. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.<Controller instance ID>.BootParameter.<known instance>.'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse message after step 1. The message contains
   a `oper_success` element for the added Permission.
2. The EUT sends a GetResponse with a `result_params` element containing
   parameters of the specified BootParameter instance, with the exception
   of the 'ParameterName' parameter.

## 2.23 Permissions - Add message with search path, allow partial true, required parameters fail

### Purpose

The purpose of this test is to ensure the EUT properly handles an add message
with a search path with allow_partial set to true when some objects fail to be
added.

### Functionality Tag

Conditionally Mandatory (supports the ControllerTrust:1 profile with at least
one role that allows object creation, or supports writable parameters in
Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

2. Ensure the Controller used for testing has an assigned Role that is writable.

3. Ensure that the EUT has at least two Controller instances in its
   Device.LocalAgent.Controller.{i}. table.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                    param_settings {
                        param: 'Targets'
                        value: 'Device.LocalAgent.Controller.<Controller instance id>.BootParameter.'
                    }
                    param_settings {
                        param: 'Obj'
                        value: 'rw--'
                    }
                    param_settings {
                        param: 'Order'
                        value: '1'
                    }
                }
                create_objs {
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                    param_settings {
                        param: 'Targets'
                        value: 'Device.LocalAgent.Controller.<Second Controller id>.BootParameter.'
                    }
                    param_settings {
                        param: 'Obj'
                        value: 'r---'
                    }
                    param_settings {
                        param: 'Order'
                        value: '1'
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
                allow_partial: true
                create_objs {
                    obj_path: 'Device.LocalAgent.Controller.*.BootParameter'
                }
            }
        }
    }
    ```

3. Allow the EUT to send an AddResp.

###  Test Metrics

1. The EUT sends an AddResponse message after step 1. The message contains two
   oper_success elements, one for each added permission.

2. The AddResp in step 3 contains two CreatedObjectResults. One
CreateObjectResult is an element of type OperationSuccess. The OperationSuccess
element contains an instantiated_path element containing the new BootParameter
object under Device.LocalAgent.Controller.<Controller instance id>.

3. The other CreateObjectResult is an element of type OperationFailure. The
   OperationFailure element contains an err_code of ‘7006’, ‘Permission Denied’

## 2.24 Permissions - Add message with search path, allow partial false, required parameters fail

### Purpose

The purpose of this test is to ensure the EUT properly handles an add message
with a search path with allow_partial set to false when some objects fail to be
added.

### Functionality Tag

Conditionally Mandatory (supports the ControllerTrust:1 profile with at least
one role that allows object creation, or supports writable parameters in
Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

2. Ensure the Controller used for testing has an assigned Role that is writable.

3. Ensure that the EUT has at least two Controller instances in its
   Device.LocalAgent.Controller.{i}. table.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Controller instance id>.BootParameter.'
                        }
                    param_settings {
                            param: 'Obj'
                            value: 'rw--'
                        }
        param_settings {
                            param: 'Order'
                            value: '1'
                        }
                }
        create_objs {
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                            param: 'Enable'
                            value: 'true'
                        }
                    param_settings {
                            param: 'Targets'
                            value: 'Device.LocalAgent.Controller.<Second Controller id>.BootParameter.'
                        }
                    param_settings {
                            param: 'Obj'
                            value: 'r---'
                        }
        param_settings {
                            param: 'Order'
                            value: '1'
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
                allow_partial: false
                create_objs {
                    obj_path: 'Device.LocalAgent.Controller.*.BootParameter'
                }
            }
        }
    }
    ```

3. Allow the EUT to send an Error.

4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Controller.*.BootParameter.'
            }
        }
    }
    ```

5. Allow the EUT to send a GetResp.

### Test Metrics

1. The EUT sends an AddResponse message after step 1. The message contains two
   oper_success elements, one for each added permission.

2. The EUT sends an Error message in step 3. The Error message contains an
   err_code of 7006, ‘Permission Denied’, with the param_errs element containing
   a single error with a param_path of ‘Device.LocalAgent.Controller.<Secondary
   Controller id>.BootParameter’, and an err_code of 7006, ‘Permission Denied’.

3. The EUT did not create any new BootParameter objects.

## 2.25 Permissions - Parameter within added object not allowed, omitted

### Purpose

The purpose of this test is to ensure the EUT properly handles an add message
when a parameter within the added object cannot be written to and the parameter
is omitted from the Add message.

### Functionality Tag

Conditionally Mandatory (supports the ControllerTrust:1 profile with at least
one role that allows object creation, or supports writable parameters in
Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

2. Ensure the Controller used for testing has an assigned Role that is writable.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                    param_settings {
                        param: 'Targets'
                        value: 'Device.LocalAgent.Subscription.*.Enable'
                    }
                    param_settings {
                        param: 'Obj'
                        value: 'r---'
                    }
                    param_settings {
                        param: 'Order'
                        value: '1'
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
                allow_partial: false
                create_objs {
                    obj_path: 'Device.LocalAgent.Subscription.'
                    param_settings {
                        param: 'ID'
                        value: 'add1'
                    }
                    param_settings {
                        param: 'NotifType'
                        value: 'ValueChange'
                    }
                    param_settings {
                        param: 'ReferenceList'
                        value: 'Device.LocalAgent.SoftwareVersion'
                        required: true
                    }
                }
            }
        }
    }
    ```

3. Allow the EUT to send an AddResp.

4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.LocalAgent.Subscription.<instance from step 3>.Enable'
            }
        }
    }
    ```

### Test Metrics

1. The EUT sends an AddResponse with a oper_success element containing a new
   Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.

2. The EUT sends an AddResp message with an oper_success element containing a
   new Device.LocalAgent.Subscription. object.

3. The EUT sends a GetResp with a value of “false” for the Enable parameter of the new Subscription object.

## 2.26 Permissions - Parameter within added object not allowed, included

### Purpose

The purpose of this test is to ensure the EUT properly handles an add message
when a parameter within the added object cannot be written to and the parameter
is included in the Add message.

### Functionality Tag

Conditionally Mandatory (supports the ControllerTrust:1 profile with at least
one role that allows object creation, or supports writable parameters in
Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

2. Ensure the Controller used for testing has an assigned Role that is writable.

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.Role.<Controller Role instance>.Permission.'
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                    }
                    param_settings {
                        param: 'Targets'
                        value: 'Device.LocalAgent.Subscription.*.Enable'
                    }
                    param_settings {
                        param: 'Obj'
                        value: 'r---'
                    }
                    param_settings {
                        param: 'Order'
                        value: '1'
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
                allow_partial: true
                create_objs {
                    obj_path: 'Device.LocalAgent.Subscription.'
                    param_settings {
                        param: 'ID'
                        value: 'add26'
                        }
                    param_settings {
                        param: 'NotifType'
                        value: 'ValueChange'
                    }
                    param_settings {
                        param: 'ReferenceList'
                        value: 'Device.LocalAgent.SoftwareVersion'
                        required: true
                    }
                    param_settings {
                        param: 'Enable'
                        value: 'true'
                        required: true
                    }
                }
            }
        }
    }
    ```

3. Allow the EUT to send an AddResp.

4. Send a Get message to the EUT with the request path of
   ‘Device.LocalAgent.Subscription.’.

### Test Metrics

1. The EUT sends an AddResponse with an oper_success element containing a new
   Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.

2. The AddResp contains a single CreatedObjectResult that has an OperationStatus
   that is an element of type OperationFailure. The OperationFailure element
   contains an err_code of ‘7006’ ‘Permission Denied’.

3. The GetResp from the EUT does not contain a Subscription instance with ID
   ‘add26’.

## 2.27 Use of SecuredRole

### Purpose

The purpose of this test is to ensure the EUT shares secured parameters with a
Controller which is assigned the SecuredRole.

### Functionality Tag

Conditional Mandatory (supports the ControllerTrust:1 profile,
Device.LocalAgent.ControllerTrust.SecuredRoles, and a parameter with the secured
attribute)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

2. Ensure that the EUT has two Controller instances in its
   Device.LocalAgent.Controller.{i}. table, and that both Controllers can be
   simulated by the test equipment. Consider one to be the primary Controller,
   and the other to be the secondary Controller.

3. Ensure that the EUT supports a parameter with the secured attribute. Ensure
   that the secondary Controller is assigned a Role that can read the secured
   parameter. The Role is not added to the
   Device.LocalAgent.ControllerTrust.SecuredRoles parameter.

### Test Procedure

1. The secondary Controller sends a Get message to the EUT for the secured
   parameter from test setup.

2. Allow the EUT to send a GetResp.

3. Send a Set message to the EUT with the following structure:

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
                    obj_path: 'Device.LocalAgent.ControllerTrust.'
                    param_settings {
                        param:  'SecuredRoles'
                        value: '<Role object from test setup>'
                        required: true
                    }
                }
            }
        }
    }
    ```

4. The secondary Controller sends a Get message to the EUT for the secured
   parameter from test setup.

5. Allow the EUT to send a GetResp.

### Test Metrics

1. The EUT sends a GetResp that contains an empty string in place of a value for
   the secured parameter when the Controller’s Role is not in the SecuredRoles
   list.

2. The EUT sends a GetResp that contains the value for the secured parameter
   when the Controller’s Role is in the SecuredRoles list.
