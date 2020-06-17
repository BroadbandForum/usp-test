## 4 General MTP Test Cases

### 4.1 Use of X.509 certificates at the MTP layer

#### Purpose

The purpose of this test is to ensure the EUT can use X.509 certificates
to secure communication at the MTP layer.

#### Functionality Tags

Conditional Mandatory (supports encryption at the MTP layer,  Device.LocalAgent.Controller.{i}.SendOnBoardRequest())

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Configure a secondary Controller outside the network boundary of the EUT.

#### Test Procedure

1. Send an Add message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: ADD
}
body {
    request {
        add {
            create_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.
                    param_settings: [
                        {
                            param: Alias
                            value: usp-113-Controller
                        },
                        {
                            param: EndpointID
                            value: <new Controller endpoint ID>
                        },
                        {
                            param: Enable
                            value: true
                        },
                        {
                            param: AssignedRole
                            value: <valid role instance>
                        }
                    ]
                }
            ]
        }
    }
}
```

2. Send an Add message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: ADD
}
body {
    request {
        add {
            obj_path: Device.LocalAgent.Controller.<new instance>.MTP.
            param_settings: [
                {
                    param: Enable
                    value: true
                },
                {
                    param: Protocol
                    value: <support MTP>
                }
                .
                .
                <Supported MTP configuration>
                .
                .
            ]
        }
    }
}
```

3. Send an Operate message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.Controller.<new instance>.SendOnBoardRequest()
        }
    }
}
```

#### Test Metrics

1. The EUT contacts the secondary EUT and establishes a secure MTP layer connection
   by employing X.509 certificates.
