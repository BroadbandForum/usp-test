# 4 General MTP Test Cases

## 4.1 Use of X.509 certificates at the MTP layer

### Purpose

The purpose of this test is to ensure the EUT can use X.509 certificates
to secure communication at the MTP layer.

### Functionality Tags

Mandatory

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.
2. Ensure that the use of MTP layer encryption is enabled on the EUT.

### Test Procedure

1. Send a GetSupportedProtocol message to the EUT with the following structure:

```{filter=pbv type=Msg}
header {
    msg_id: '<msg_id>'
    msg_type: GET_SUPPORTED_PROTO
}
body {
    request {
        get_supported_protocol {
            controller_supported_protocol_versions: '<comma separated list of test controller versions>'
        }
    }
}
```

### Test Metrics

1. The EUT processes the certificate and establishes a secure TLS connection at the MTP layer.
