# 11 MQTT Test Cases

## 11.1 Support of Required MQTT Profiles

### Purpose

The purpose of this test is to ensure the EUT supports the required MQTT
profiles.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP records to each other.

### Test Procedure

1. Send a GetSupportedDM message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET_SUPPORTED_DM
    }
    body {
        request {
            get_supported_dm {
                obj_paths: 'Device.MQTT.'
                obj_paths: 'Device.LocalAgent.'
                return_params: true
                first_level_only: false
            }
        }
    }
    ```

2. Wait for the GetSupportedDMResponse.

### Test Metrics

1. The EUT sends a GetSupportedDMResponse.
2. The GetSupportedDMResponse from the EUT contains all required parameters in
   the MQTTClientCon:1, MQTTClientSubscribe:1, MQTTAgent:1, and MQTTController:1
   data model profiles. The parameter `Device.MQTT.Client.{i}.MessageRetryTime`
   is not required to be supported for EUTs that only implement MQTT version
   5.0.

## 11.2 MQTT session establishment using a CONNECT packet

### Purpose

The purpose of this test is to ensure the EUT can properly start an MQTT session
using an MQTT CONNECT packet.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists
   in the test environment.
2. Ensure that the EUT data model is configured with
   `.MQTT.Client.{i}.Username`, `.MQTT.Client.{i}.Password` values.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the MQTT server.

### Test Metrics

1. The EUT sends an MQTT CONNECT packet to the MQTT server.  
2. The MQTT CONNECT packet Version is either 5.0 or 3.1.1.
3. If the EUT uses MQTT 5.0, the MQTT CONNECT packet contains a User Property
   name-value pair with name of “usp-endpoint-id” and value of the EUT USP
   Endpoint ID.
4. The EUT includes User Name and Password fields in the MQTT CONNECT packet.

## 11.3 MQTT Use of TLS

### Purpose

The purpose of this test is to ensure the EUT can establish secure MQTT
communication via TLS.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.
2. Ensure the EUT and MQTT server are configured with the appropriate
   certificates to communicate over TLS.

### Test Procedure

1. Reboot the EUT
2. Wait for the EUT to reconnect to the MQTT server
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo'
            }
        }
    }
    ```

4. Wait for the EUT to send a GetResponse

### Test Metrics

1. All communication between the EUT and MQTT server after step 1 are encrypted
   using TLS 1.2 or later.

## 11.4 MQTT 5.0 ClientID

### Purpose

The purpose of this test is to ensure the EUT properly sets the ClientID field
in MQTT packets.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP, version 5.0)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists in the
   test environment.

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
            allow_partial: false
            update_objs {
              obj_path: 'Device.​MQTT.​Client.<active MQTT client instance>.'
              param_settings {
               param: 'ClientID'
               value: ''
               required: true
              }
            }
          }
        }
      }
      ```

2. Reboot the EUT.
3. Wait for the EUT to reconnect to the MQTT server.
4. The MQTT server sends an MQTT CONNACK packet with an Assigned Client
   Identifier.
5. Send a Get message to the EUT with the following structure:

      ```{filter=pbv type=Msg}
      header {
        msg_id: '<msg_id>'
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: 'Device.​MQTT.​Client.<active MQTT client instance>.ClientID'
          }
        }
      }
      ```

### Test Metrics

1. The EUT MQTT CONNECT packet must include a ClientID set to an empty string.
2. The retrieved value of ClientID matches the Assigned Client Identifier from
   step 4.

## 11.5 MQTT ClientID Persistence

### Purpose

The purpose of this test is to ensure the MQTT ClientID field persists after
successful connection with an MQTT server.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists in the
   test environment.

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
            param_paths: 'Device.​MQTT.​Client.<active MQTT client instance>.ClientID'
          }
        }
      }
      ```

2. Reboot the EUT.
3. Wait for the EUT to reconnect to the MQTT server.

### Test Metrics

1. The EUT uses the same ClientID in the subsequent MQTT CONNECT packet.

## 11.6 MQTT Message Retry

### Purpose

The purpose of this test is to ensure the EUT properly enters a retry state
when it fails to connect to the MQTT server.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that is part of the test
   environment.

### Test Procedure

1. Send a Get message to the EUT with the following structure

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.MQTT.Client.'
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

3. Disable the MQTT server.
4. Allow the EUT to attempt to start an MQTT session with the MQTT server.
5. Reenable the MQTT server after the EUT fails to connect to the MQTT server
   twice.

### Test Metrics

1. The EUT retries connecting to the MQTT server within the `ConnectRetryTime`
   of the connection instance.
2. The EUT retries a second time in accordance with `ConnectRetryTime` and
   `ConnectRetryIntervalMultiplier`.

## 11.7 MQTT Keep Alive

### Purpose

The purpose of this test is to ensure the EUT can correctly implement the MQTT
keep alive mechanism and the relevant parameters in the data model.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP, version 5.0)

### Test Setup

1. The EUT is configured to use an MQTT server which exists in the test
   environment.

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
                        obj_path: 'Device.​MQTT.​Client.​<active MQTT client instance>.'
                        param_settings {
                                param: 'KeepAliveTime'
                                value: '60'
                            }
                    }
            }
        }
    }
    ```

2. Reboot the EUT.
3. Wait for the EUT to reconnect to the MQTT server.
4. The MQTT server sends an MQTT CONNACK packet with a Keep Alive value of 30
   seconds.
5. Wait 45 seconds.

### Test Metrics

1. The EUT sends an MQTT CONNECT packet on boot with the Keep Alive property set
   to 60 seconds.
2. The EUT sends an MQTT PINGREQ packet within 45 seconds of the last MQTT
   message. This represents 1.5 times the Keep Alive value.

## 11.8 MQTT SUBSCRIBE Packet

### Purpose

The purpose of this test is to ensure the EUT includes the correct fields in an
MQTT SUBSCRIBE packet.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP, version 5.0)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the MQTT server.
3. The MQTT server sends an MQTT CONNACK packet containing a User Property of
   subscribe-topic.
4. For an EUT using MQTT 5.0, the MQTT CONNACK packet contains a Response
   Information property.
5. Wait for the EUT to send an MQTT SUBSCRIBE packet.

### Test Metrics

1. The EUT sends an MQTT CONNECT packet to the MQTT server. If the EUT uses MQTT
   5.0, the Request Response Information property must be set to 1.
2. The EUT sends an MQTT SUBSCRIBE packet to the MQTT server. The MQTT SUBSCRIBE
   packet includes the subscribe-topic sent in step 3.
3. If the EUT uses MQTT 5.0, the MQTT SUBSCRIBE packet includes the Response
   Information property sent in step 4.

## 11.9 MQTT New Subscription

### Purpose

The purpose of this test is to ensure the EUT sends an MQTT SUBSCRIBE packet
when a new `Device.MQTT.Client.{i}.Subscription.{i}.` object is added.

### Functionality Tags

Conditional Mandatory (supports MQTT MTP)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Metrics

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
                  obj_path: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.'
                  param_settings {
                          param: 'Enable'
                          value: 'true'
                      }
                  param_settings {
                          param: 'Topic'
                          value: '<newTopic-11-9 OR newTopic-11-9/# for USP Agents using MQTT version 3.1.1>'
                      }
                  }
            }
        }
    }
    ```
2. Wait for the EUT to send an MQTT SUBSCRIBE packet.
3. The MQTT server sends an MQTT SUBACK packet indicating the QoS level that was
   granted for the subscription.
4. Send a Get message with topic `newTopic-11-9` with the following structure:

     ```{filter=pbv type=Msg}
     header {
       msg_id: '<msg_id>'
       msg_type: GET
     }
     body {
       request {
         get {
           param_paths: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.<instance identifier from step 1>.'
         }
       }
     }
     ```

5. Send a Set message to the EUT with the following structure:
   ```{filter=pbv type=Msg}
   header {
     msg_id: "<msg_id>"
     msg_type: SET
   }

   body {
     request {

       set {
         allow_partial: false
         update_objs {
           obj_path: "Device.MQTT.Client.<active MQTT client instance>.Subscription.<instance identifier from step 1>"
           param_settings: {
            param: "Enable"
            value: "false"
            required: true
           }
         }
       }
     }
   }
   ```
6. The MQTT Server sends an MQTT UNSUBACK packet indicating success.

### Test Metrics

1. The EUT sends an MQTT SUBSCRIBE packet that includes the new Topic from step 1.
2. The EUT sends a GetResp for the Subscription.
3. The EUT sends an MQTT UNSUBSCRIBE packet for the configured Topic after Enable
   is set to false.

## 11.10 MQTT No Topic in CONNACK

### Purpose

The purpose of this test is to ensure the EUT will disconnect from the MQTT
server if it receives no subscribe-topic.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP, version 5.0)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists
   in the test environment.
2. Ensure that all instances of `Device.MQTT.Client.<active MQTT client instance>.Subscription.`
   are removed from the EUT.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the MQTT server.
3. The MQTT server sends an MQTT CONNACK packet that does not include a
   subscribe-topic User Property.

### Test Metrics

1. The EUT sends an MQTT DISCONNECT packet to the MQTT server.

## 11.11 MQTT Failure to Subscribe

### Purpose

The purpose of this test is to ensure the EUT will disconnect from the MQTT
server if it is unable to subscribe to a Topic.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure that the EUT is configured to use an MQTT server that exists
   in the test environment.
2. Ensure that the EUT is configured to send a Device.LocalAgent.Periodic! event
   to the Controller every 60 seconds through the Device.
   LocalAgent.Controller.<i>.PeriodicNotifInterval parameter.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to send an MQTT SUBSCRIBE packet.
3. The MQTT server sends an MQTT SUBACK packet that includes an error for each
   Topic in the SUBSCRIBE packet.
4. Wait 120 seconds.

### Test Metrics

1. The EUT sends an MQTT DISCONNECT packet to the MQTT server.
2. The EUT does not publish a USP record to the MQTT server for any Topic in the
   MQTT SUBSCRIBE packet.

## 11.12 MQTT PUBLISH Packet

### Purpose

The purpose of this test is to ensure the EUT can send a properly formatted an
MQTT PUBLISH packet.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to reconnect to the MQTT server.
3. The MQTT server sends a CONNACK packet.
4. For an EUT using MQTT 5.0, the  CONNACK packet contains a Response
   Information property.
3. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo'
            }
        }
    }
    ```

4. Wait for the EUT to send a GetResponse

### Test Metrics

1. The EUT sends an MQTT PUBLISH packet containing a GetResponse.
2. If the EUT uses MQTT 5.0, the Response Topic is set to the Response
   Information property from step 4.
3. If the EUT uses MQTT 3.1.1, the "reply to" is included after `/reply-to=` at
   the end of the PUBLISH Topic Name, with any `/` character in the Topic
   replaced by `%2F`.
4. If the EUT uses MQTT 5.0, the Content Type property is set to `usp.msg`

## 11.13 MQTT QoS

### Purpose

The purpose of this test is to ensure the EUT supports at least MQTT QoS levels
0 and 1.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

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
                  obj_path: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.'
                  param_settings {
                          param: 'Enable'
                          value: 'true'
                      }
                  param_settings {
                          param: 'Topic'
                          value: '<newTopic-11-13-QoS0 OR newTopic-11-13-QoS0/# for USP Agents using MQTT version 3.1.1>'
                      }
                  param_settings {
                          param: 'QoS'
                          value: '0'
                      }
                  }
            }
        }
    }
    ```
2. Wait for the EUT to send an MQTT SUBSCRIBE packet.
3. The MQTT server sends an MQTT SUBACK packet indicating a QoS level of 0 for
   the subscription.
4. Send an Add message to the EUT with the following structure:

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
                  obj_path: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.'
                  param_settings {
                          param: 'Enable'
                          value: 'true'
                      }
                  param_settings {
                          param: 'Topic'
                          value: 'newTopic-11-13-QoS1'
                      }
                  param_settings {
                          param: 'QoS'
                          value: '1'
                      }
                  }
            }
        }
    }
    ```
5. The MQTT server sends an MQTT SUBACK packet indicating a QoS level of 1 for the
   subscription.
6. Send a Get message with topic 'newTopic-11-13-QoS0' to the EUT with the following structure:

     ```{filter=pbv type=Msg}
     header {
       msg_id: '<msg_id>'
       msg_type: GET
     }
     body {
       request {
         get {
           param_paths: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.<instance from step 1>.'
         }
       }
     }
     ```
7. Send a Get message with topic 'newTopic-11-13-QoS1' to the EUT with the following structure:

     ```{filter=pbv type=Msg}
     header {
       msg_id: '<msg_id>'
       msg_type: GET
     }
     body {
       request {
         get {
           param_paths: 'Device.MQTT.Client.<active MQTT client instance>.Subscription.<instance from step 4>.'
         }
       }
     }
     ```

### Test Metrics

1. The EUT sends a GetResp for the Get message sent to topic 'newTopic-11-13-QoS0'.
2. The EUT sends a GetResp for the Get message sent to topic 'newTopic-11-13-QoS1'.


## 11.14 MQTT Reply to Topic

### Purpose

The purpose of this test is to ensure the EUT can process and set the "reply to" Topic in MQTT PUBLISH packets.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

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
                param_paths: 'Device.DeviceInfo'
            }
        }
    }
    ```

2. Wait for the EUT to send a GetResponse.

### Test Metrics

1. If the EUT uses MQTT 5.0, the EUT must send an MQTT PUBLISH packet that
   includes a GetResponse. The Topic Name must be set to the "reply to" Topic
   from the controller's MQTT PUBLISH packet Response Topic property. The EUT
   must include a Response Topic property that has a "reply to" Topic set.
2. If the EUT uses MQTT 3.1.1, the EUT must send an MQTT PUBLISH packet that
   includes a GetResponse. The Topic must be set to the reply to topic at the
   end of the Topic Name in the Controller's MQTT PUBLISH packet. All instances
   of `%2F` must be replaced by `/` in the Topic Name. The EUT must set a reply
   to topic by including it at the end of the Topic Name after `/reply-to=` and replacing all instances of `/` with `%2F`.

## 11.15 MQTT 5.0 Content Type

### Purpose

The purpose of this test is to ensure the EUT can accept valid values of the
MQTT Content Type property.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP, version 5.0)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Procedure

1. Configure the Controller to include an MQTT Content Type property of `usp.msg`
   in its MQTT packets.
2. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo'
            }
        }
    }
    ```

3. Wait for the EUT to send a GetResponse.
4. Configure the Controller to include an MQTT Content Type property of
   `application/vnd.bbf.usp.msg` in its MQTT packets.
5. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
    header {
        msg_id: '<msg_id>'
        msg_type: GET
    }
    body {
        request {
            get {
                param_paths: 'Device.DeviceInfo'
            }
        }
    }
    ```

3. Wait for the EUT to send a GetResponse.

### Test Metrics

1. The EUT must send a GetResponse for both Get messages, indicating that it
   processed the Controller's MQTT PUBLISH packets.

## 11.16 MQTT Connection Retry

### Purpose

The purpose of this test is to ensure the EUT retries its connection with the
MQTT server after the server terminates the connection.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Procedure

1. Send an MQTT DISCONNECT packet to the EUT.
2. Allow the EUT to start a new MQTT session with the MQTT server.

### Test Metrics

1. The EUT retries connecting to the MQTT server between ConnectRetryTime of the
   connection instance and
   ConnectRetryTime*(ConnectRetryIntervalMultiplier/1000).

## 11.17 MQTT - Use of Connect Record

### Purpose

The purpose of this test is to ensure the EUT correctly sends a Connect record
after it has established a communications channel to the controller.

### Functionality Tags

Conditional Mandatory (supports the MQTT MTP)

### Test Setup

1. Ensure the EUT is configured to use an MQTT server that exists
   in the test environment.

### Test Procedure


1. Reboot the EUT.
2. Wait for the EUT to establish an MQTT session with the MQTT server.

### Test Metrics

1. After reconnecting to the MQTT server, the EUT transmits an MQTTConnectRecord
   within 30 seconds. The EUT includes the MQTTVersion field set to the correct
   MQTT version and the subscribed_topic field set to a Topic that the EUT is
   subscribed to.
