# USP Agent Test Cases

## 1 Messages and Path Names

### 1.1 Add message with allow partial false, single object, required parameters succeed

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, and all
required parameters to be set upon Object Creation succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add1"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

3.  Record the instance identifier of the created object as reported by
    the EUT.

4.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```
5.  Allow the EUT to send a GetResp.

6.  Clean-up: Send a Delete message to the EUT with the following
    structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }
      body {
        request {
          delete {
            allow_partial: false
            obj_paths:
            "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```

7.  Allow the EUT to send a DeleteResp

#### Test Metrics

1.  The EUT's sends an AddResp.

2.  The AddResp contains a single CreatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains no parameter errors and 3 elements in the
    unique key map: Alias, Recipient, and ID. Alternatively, the
    OperationSuccess contains 2 elements in the unique key map if the
    Alias parameter is not supported: Recipient, and ID.

3.  The EUT creates the Subscription object.

4.  The Subscription object's values match the values set in the
    param_settings element.

### 1.2 Add message with allow partial true, single object, required parameters succeed

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to true, and all
required parameters to be set upon Object Creation succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: true
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add2"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

3.  Record the instance identifier of the created object as reported by
    the EUT.

4.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```

5.  Allow the EUT to send a GetResp.

6.  Clean-up: Send a Delete message to the EUT with the following
    structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }
      body {
        request {
          delete {
            allow_partial: false
            obj_paths: "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```

7.  Allow the EUT to send a DeleteResp

#### Test Metrics

1.  The EUT's AddResp is valid.

2.  The AddResp contains a single CreatedObjectResult that has an
    OperationStatus of OperationSuccess. The OperationSuccess contains
    no parameter errors and 3 elements in the unique key map: Alias,
    Recipient, and ID. Alternatively, the OperationSuccess contains 2
    elements in the unique key map if the Alias parameter is not
    supported: Recipient, and ID.

3.  The EUT creates the Subscription object.

4.  The Subscription object's values match the values set in the
    param_settings element.

### 1.3 Add message with allow partial false, single object, required parameters fail

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, and at
least one required parameter fails, and only a single object is set.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add3"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"}

               {
                 param: "InvalidParameter"
                 value: "IrrelevantValue"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error message.

#### Test Metrics

1.  The EUT sends an Error message.

2.  The Error message contains an err_code of 7004, "Invalid
    Arguments", with the param_errs element containing a single error
    with a param_path of "Device.LocalAgent.Subscription.{i}.InvalidParameter", and an err_code of 7010, "Unsupported Parameter".

### 1.4 Add message with allow partial false, single invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, and a
single invalid object is set.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.InvalidObject."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add3"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error message.

#### Test Metrics

1.  The EUT sends an Error message.

2.  The Error message contains an err_code of 7004, "Invalid
    Arguments", with the param_errs element containing a single error
    with a param_path of "Device.LocalAgent.InvalidObject.", and an
    err_code of 7026, "Invalid Path".

### 1.5 Add message with allow partial false, multiple objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, multiple
objects are attempted, and all required parameters to be set upon Object
Creation succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add41"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }

              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add42"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.EndpointID"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

3.  Record the instance identifiers of the created objects as reported
    by the EUT.

4.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths:
            "Device.LocalAgent.Subscription.<instance identifier 1>."
            "Device.LocalAgent.Subscription.<instance identifier 2>."
          }
        }
      }
      ```

5.  Allow the EUT to send a GetResp.

6.  Clean-up: Send a Delete message to the EUT with the following
    structure:

  ```
  header {
    msg_id: "<msg_id>"
    msg_type: DELETE
    }
    body {
      request {
        delete {
          allow_partial: false
          obj_paths:
          "Device.LocalAgent.Subscription.<instance identifier 1>."
          "Device.LocalAgent.Subscription.<instance identifier 2>."
        }
      }
    }
  ```

7.  Allow the EUT to send a DeleteResp.

#### Test Metrics

1.  The EUT's AddResp is valid.

2.  The AddResp contains two CreatedObjectResults that each have an
    OperationStatus of OperationSuccess. The OperationSuccess elements
    contains no parameter errors and 3 elements in the unique key map:
    Alias, Recipient, and ID. Alternatively, the OperationSuccess
    contains 2 elements in the unique key map if the Alias parameter is
    not supported: Recipient, and ID.

3.  The EUT creates the Subscription objects.

4.  The first Subscription object's values match the values set in the
    param_settings element.

5.  The second Subscription object's values match the values set in the
    param_settings element.

### 1.6 Add message with allow partial false, multiple objects with an invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, multiple
objects are attempted, and one of the objects are invalid.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add51"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }

              obj_path: "Device.LocalAgent.InvalidObject."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add52"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.EndpointID"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error.

#### Test Metrics

1.  The EUT sends an Error message.

2.  The Error message contains an err_code of 7004, "Invalid
    Arguments", with the param_errs element containing a single error
    with a param_path of "Device.LocalAgent.InvalidObject.", and an
    err_code of 7026, "Invalid Path".

### 1.7 Add message with allow partial false, multiple objects, required parameters fail in single object

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to false, and at
least one required parameter fails in one of multiple objects.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add61"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }

              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "true"}
               {
                 param: "ID"
                 value: "add62"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "InvalidParameter"
                 value: "IrrelevantValue"
                 required: true}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error.

#### Test Metrics

1.  The EUT sends an Error message.

2.  The Error message contains an err_code of 7004, "Invalid
    arguments", with the param_errs element containing a single error
    with a param_path of
    "Device.LocalAgent.Subscription.{i}.InvalidParameter", and an
    err_code of 7010, "Unsupported Parameter".

### 1.8 Add message with allow partial true, required parameters fail, invalid type, single object

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to true, and at least
one required parameter fails (with an invalid value) in a single object.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: true
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

               {
                 param: "Enable"
                 value: "InvalidValue"
                 required: true}
               {
                 param: "ID"
                 value: "add7"}
               {
                 param: "NotifType"
                 value: "ValueChange"}
               {
                 param: "ReferenceList"
                 value: "Device.LocalAgent.SoftwareVersion"
                 required: true}
              }

            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

#### Test Metrics

1.  The EUT sends an AddResp message.

2.  The AddResp contains a single CreatedObjectResult that has an
    OperationStatus that is an element of type OperationFailure. The
    OperationFailure element contains an err_code of "7011", "Invalid Type".

### 1.9 Add message with allow partial true, required parameters fail, multiple objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the allow_partial element is set to true, and at least
one required parameter fails in one of multiple objects.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: true
            create_objs {
              obj_path: "Device.LocalAgent.Subscription."
              param_settings {

                {
                  param: "Enable"
                  value: "true"}
                {
                  param: "ID"
                  value: "add81"}
                {
                  param: "NotifType"
                  value: "ValueChange"}
                {
                  param: "ReferenceList"
                  value: "Device.LocalAgent.SoftwareVersion"}
              }

              obj_path: "Device.LocalAgent.Subscription."
              param_settings {
                {
                  param: "Enable"
                  value: "true"}
                {
                  param: "ID"
                  value: "add81"}
                {
                  param: "NotifType"
                  value: "ValueChange"}
                {
                  param: "ReferenceList"
                  value: "Device.LocalAgent.SoftwareVersion"}

                {
                  param: "InvalidParameter"
                  value: "IrrelevantValue"
                  required: true}

              }

            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

3.  Record the instance identifier of the created object as reported by
    the EUT.

4.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```

5.  Allow the EUT to send a GetResp.

6.  Clean-up: Send a Delete message to the EUT with the following
    structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }
      body {
        request {
          delete {
            allow_partial: false
            obj_paths:
            "Device.LocalAgent.Subscription.<instance identifier>."
          }
        }
      }
      ```

7.  Allow the EUT to send a DeleteResp.

#### Test Metrics

1.  The EUT sends an AddResp message.

2.  The AddResp contains two CreatedObjectResults.

    a.  One CreateObjectResult is an element of type OperationSuccess. The OperationSuccess elements contains no parameter errors and 3 elements in the unique key map: Alias, Recipient, and ID. Alternatively, the OperationSuccess contains 2 elements in the unique key map if the Alias parameter is not supported: Recipient, and ID.

    b.  The other CreateObjectResult is an element of type
    OperationFailure. The OperationFailure element contains an err_code of
    "7010" ("Unsupported Parameter"), "7017" ("Object could not be created"),
    or "7026" ("Invalid Path").

3.  The EUT creates the first Subcription object, and does not create
    the second Subscription object.

4.  The Subscription object's values match the values set in the
    param_settings element.

### 1.10 Add message with unique key addressing in path

#### Purpose

The purpose of this test is to validate that the EUT properly handles an
Add message when the  uses unique key addressing.

#### Functionality Tag

Conditional Mandatory (Product supports at least one nested multi-instance object)

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  If the EUT has a limit on the number of instances of the
    Subscription object, ensure that the number of existing Subscription
    object instances is less than the maximum supported.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: ADD
      }

      body {
        request {
          add {
            allow_partial: false
            create_objs {
              obj_path: "Device.LocalAgent.Controller.[EndpointID=="< EndpointID>"&&Alias=="<Alias if supported>"].BootParameter.
              param_settings {
                {
                  param: "Enable"
                  value: "true"}
                {
                  param: "ParameterName"
                  value: "Device.LocalAgent.SoftwareVersion"}
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an AddResp.

3.  Record the instance identifier of the created object as reported by
    the EUT.

4.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.<instance identifier>."
          }
        }
      }
      ```

5.  Allow the EUT to send a GetResp.

6.  Clean-up: Send a Delete message to the EUT with the following
    structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }
      body {
        request {
          delete {
            allow_partial: false
            obj_paths:
            "Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.<instance identifier>."
          }
        }
      }
      ```

7.  Allow the EUT to send a DeleteResp.

#### Test Metrics

1.  The EUT's sends an AddResp.

2.  The AddResp contains a single CreatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains no parameter errors and 2 elements in the
    unique key map: Alias and ParameterName. Alternatively, the
    OperationSuccess contains one element in the unique key map if the
    Alias parameter is not supported: ParameterName.

3.  The EUT creates the BootParameter object.

4.  The BootParameter object's values match the values set in the
    param_settings element.

### 1.11 Set message with allow partial false, required parameters pass

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to false, and all
required parameters to be updated succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the instance identifier is known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry"
          }
        }
      }
      ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains a single UpdatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdateInstanceResult, with the
    affected_path equal to "Device.LocalAgent.Subscription.&lt;instance
    number&gt;.", and a single entry in the updated_params map
    containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element.

### 1.12 Set message with allow partial true, required parameters pass

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to true, and all
required parameters to be updated succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the instance identifier is known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: true
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
        body {
          request {
            get {
              param_paths: "Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry"
            }
          }
      }
      ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains a single UpdatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdateInstanceResult, with the
    affected_path equal to "Device.LocalAgent.Subscription.<instance
    number>.", and a single entry in the updated_params map
    containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element.

### 1.13 Set message with allow partial false, multiple objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to false, and all
required parameters to be updated succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT, and
    the instance identifiers are known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<first instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true

              obj_path: "Device.LocalAgent.Subscription.<second instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry"
            param_paths: "Device.LocalAgent.Subscription.<second instance identifier from test setup>.NotifRetry"
          }
        }
      }
      ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains two UpdatedObjectResults that each have an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdateInstanceResult, with the
    affected_path equal to "Device.LocalAgent.Subscription.&lt;instance
    number&gt;.", and a single entry in the updated_params map
    containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element for each object.

### 1.14 Set message with allow partial false, required parameters fail

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to false, and a
required parameter fails.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the instance identifier is known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<instance identifier from test setup>."

              param_settings {
               param: "InvalidParameter"
               value: "IrrelevantValue"
               required: true
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a Error.

#### Test Metrics

1.  The EUT's sends an Error.

2.  The Error contains err_code "7004", "Invalid Arguments", and a
    single ParamError element. The ParamError element contains a
    param_path of "Device.LocalAgent.Subscription.&lt;instance
    identifier&gt;.InvalidParameter" and an err_code of "7010",
    "Unsupported Parameter".

### 1.15 Set message with allow partial false, multiple objects, required parameters fail in single object

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to false, and
required parameters in one of multiple objects fail.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT, and
    the instance identifiers are known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<first instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true

              obj_path: "Device.LocalAgent.Subscription.<second instance identifier from test setup>."

              param_settings {
               param: "InvalidParameter"
               value: "IrrelevantValue"
               required: true}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error.

#### Test Metrics

1.  The EUT's sends an Error.

2.  The Error contains err_code "7004", "Invalid Arguments", and a
    single ParamError element. The ParamError element contains a
    param_path of "Device.LocalAgent.Subscription.&lt;instance
    identifier&gt;.InvalidParameter" and an err_code of "7010",
    "Unsupported Parameter".

### 1.16 Set message with allow partial true, required parameter fails, multiple objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to true, and a
required parameter on one of multiple objects fails.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT, and
    the instance identifiers are known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: true
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<first instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true

              obj_path: "Device.LocalAgent.Subscription.<second instance identifier from test setup>."

              param_settings {
               param: "InvalidParameter"
               value: "IrrelevantValue"
               required: true}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: "<msg_id>"
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: "Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry"
      }
    }
  }
  ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains two UpdatedObjectResults.

    a.  The first UpdatedObjectResult has an OperationStatus that is an
        element of type OperationSuccess. The OperationSuccess contains
        a single UpdatedInstanceResult, with the affected_path equal to
        "Device.LocalAgent.Subscription.&lt;instance number&gt;.", and a
        single entry in the updated_params map containing "NotifRetry"
        as the key.

    b.  The second UpdatedObjectResult has an OperationStatus that is an
        element of type OperationFailure. The OperationFailure contains
        an err_code of "7021", "Required parameter failed", and a
        single UpdatedInstanceFailure element. The
        UpdatedInstanceFailure has an affected_path with a value of
        "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.",
        and a single ParameterError element.

    c.  The ParameterError has a param element with a value of
        "NotifRetry", an err_code of "7010", "Unsupported Parameter"

3.  The retrieved value matches the value set in the param_settings
    element for the first object.

### 1.17 Set message with allow partial true, non-required parameter fails, multiple parameters

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the allow_partial element is set to true, and one of
multiple non-required parameters fail.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the instance identifier is known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: true
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<first instance
      identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"}

              param_settings {

               param: "InvalidParameter"
               value: "IrrelevantValue"}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry"
          }
        }
      }
      ```

1.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains a single UpdatedObjectResult with an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdatedInstanceResult element.

    a.  The UpdatedInstanceResult affected_path is equal to
        "Device.LocalAgent.Subscription.&lt;instance number&gt;.".

    b.  The UpdatedInstanceResult has a single entry in the
        updated_params map containing "NotifRetry" as the key.

    c.  The UpdatedInstanceResult has a single ParameterError element,
        with the "param" field set to "InvalidParameter", and an
        err_code of "7010", "Unsupported Parameter".

3.  The retrieved value of NotifRetry matches the value set in the
    param_settings element.

### 1.18 Set message with unique key addressing in path

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the  uses unique key addressing.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the unique keys and their values are known by the traffic generator.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.<unique key instance identifier from test setup>."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true
              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: "<msg_id>"
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: "Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry"
      }
    }
  }
  ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains a single UpdatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdateInstanceResult, with the
    affected_path equal to "Device.LocalAgent.Subscription.&lt;instance
    number&gt;.", and a single entry in the updated_params map
    containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element.

### 1.19 Set message with wildcard search path, allow partial false, required parameters pass

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the  uses a wildcard search path and the
requested updates succeed.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.*."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

3.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry"
            param_paths: "Device.LocalAgent.Subscription.<second instance identifier from test setup>.NotifRetry"
          }
        }
      }
      ```

4.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains an UpdatedObjectResults element that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains at least two UpdateInstanceResults, each with the
    affected_path equal to "Device.LocalAgent.Subscription.&lt;instance
    number&gt;." of the respective instance, and a single entry in the
    updated_params map containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element for each object.

### 1.20 Set message with wildcard search path, allow partial false, required parameters fail

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the  uses a wildcard search path,
allow_partial element is set to false, and required parameters multiple
objects fail.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {

              obj_path: "Device.LocalAgent.Subscription.*."

              param_settings {
               param: "InvalidParameter"
               value: "IrrelevantValue"
               required: true}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send an Error.

#### Test Metrics

1.  The EUT's sends an Error.

2.  The Error contains err_code "7004", "Invalid Arguments", and at
    least two ParamError elements. The ParamError elements contains a
    param_path of "Device.LocalAgent.Subscription.&lt;instance
    identifier of relevant object&gt;.InvalidParameter" and an err_code
    of "7010", "Unsupported Parameter".

### 1.21 Set message with wildcard search path, allow partial true, required parameters fail

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the  uses a wildcard search path, the
allow_partial element is set to true, and a required parameter on
multiple objects fails.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least two Subscription objects exist on the EUT.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: true
            update_objs {

              obj_path: "Device.LocalAgent.Subscription.*."

              param_settings {
               param: "InvalidParameter"
               value: "IrrelevantValue"
               required: true}

              }
            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains an UpdatedObjectResults element.

    a.  The UpdatedObjectResults has an OperationStatus that is an
        element of type OperationFailure. The OperationFailure contains
        an err_code of "7021", "Required Parameter Failed", and
        at least two UpdatedInstanceFailure elements. The
        UpdatedInstanceFailures each have an affected_path with a value of
        "Device.LocalAgent.Subscription.&lt;instance identifier&gt;." for the
        respective failed instance,
        and a single ParameterError element. The ParameterError has a
        param element with a value of "InvalidParameter", and an
        err_code of "7010", "Unsupported Parameter"

### 1.22 Set message with search expression search path

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses a search path.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT with
    a value for the NotifExpiration that is greater than 0.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: false
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.[NotifExpiration>0]."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true
              }
            }
          }
        }
      }
      ```

1.  Allow the EUT to send a SetResp.

2.  Send a Get message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: GET
      }
      body {
        request {
          get {
            param_paths: "Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry"
          }
        }
      }
      ```

3.  Allow the EUT to send a GetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains at least one UpdatedObjectResult that has an
    OperationStatus that is an element of type OperationSuccess. The
    OperationSuccess contains a single UpdateInstanceResult, with the
    affected_path equal to "Device.LocalAgent.Subscription.&lt;instance
    number&gt;.", and a single entry in the updated_params map
    containing "NotifRetry" as the key.

3.  The retrieved value matches the value set in the param_settings
    element.

### 1.23 Set message with path that matches no objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Set message when the requested path does not match any objects.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

#### Test Procedure

1.  Send a Set message to the EUT with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: SET
      }

      body {
        request {

          set {
            allow_partial: true
            update_objs {
              obj_path: "Device.LocalAgent.Subscription.[Recipient=="InvalidValue"]."

              param_settings {
               param: "NotifRetry"
               value: "<Valid Value>"
               required: true

              }

            }
          }
        }
      }
      ```

2.  Allow the EUT to send a SetResp.

#### Test Metrics

1.  The EUT's sends a SetResp.

2.  The SetResp contains one UpdatedObjectResult. UpdatedObjectResult
    have an OperationStatus that is an element of type OperationFailure.
    The OperationFailure contains an err_code of "7016", "Object does
    not exist".

### 1.24 Delete message with allow partial false, valid object instance

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to false, and the
object to be deleted is valid.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT, and the instance identifiers are known by the traffic generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }
      body {
        request {
          delete {
            allow_partial: false
            obj_paths {
              "Device.LocalAgent.Subscription.<instance identifier>."
            }
          }
        }
      }
      ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains a single deleted_obj_response with
a requested_path equal to "Device.LocalAgent.Subscription.&lt;instance
identifier&gt;." and an oper_success element, with one affected_path
element equal to the path name of the Deleted object.

### 1.25 Delete message with allow partial false, object instance doesn't exist

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to false, and the
object instance to be deleted does not exist.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned any existing
Subscription objects and their instance identifiers.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
      }

     body {
       request {
         delete {
           allow_partial: false
           obj_paths {
             "Device.LocalAgent.Subscription.<non-existant instance
             identifier>."
           }
         }
       }
     }
    ```

2. Allow the EUT to send an DeleteResp.

#### Test Metrics

1. The EUT sends a DeleteResp containing an empty oper_success element.

### 1.26 Delete message with allow partial false, invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to false, and the
object to be deleted is invalid.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
     }

     body {
       request {
         delete {
           allow_partial: false
           obj_paths {
             "Device.LocalAgent.InvalidObject."
           }
         }
       }
     }
    ```

2. Allow the EUT to send an Error message.

#### Test Metrics

1. The EUT's sends an Error message.

2. The Error contains an err_code of 7004, "Invalid
arguments", with the param_errs element containing a single error with
a param_path of "Device.LocalAgent.InvalidObject.", and an err_code of
7026, "InvalidPath".

### 1.27 Delete message with allow partial false, multiple objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to false, with
multiple valid objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT, and the instance identifiers are known by the traffic generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
      }

     body {
       request {
         delete {
           allow_partial: false
           obj_paths {
             {
               "Device.LocalAgent.Subscription.<first instance identifier>."
             }
             {
               "Device.LocalAgent.Subscription.<second instance identifier>."
             }
           }
         }
       }
      }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains two deleted_obj_results, each with
a requested_path equal to the obj_paths of the Delete message, and an
oper_success element containing an affected_path element equal to the
path name of the deleted object.

### 1.28 Delete message with allow partial false, multiple objects, invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to false, and one
of the objects to be deleted is invalid.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and the instance identifier is known by the traffic generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
      }

     body {
       request {
         delete {
           allow_partial: false
           obj_paths {
             {
               "Device.LocalAgent.Subscription.<instance identifier.>"
             }
             {
               "Device.LocalAgent.InvalidObject."
             }
           }
         }
       }
     }
    ```

2. Allow the EUT to send an Error message.

#### Test Metrics

1. The EUT's sends an Error message.

2. The Error contains an err_code of 7004, "Invalid
arguments", with the param_errs element containing a single error with
a param_path of "Device.LocalAgent.InvalidObject.", and an err_code of
7026, "InvalidPath".

### 1.29 Delete message with allow partial true, object instance doesn't exist

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to true, and the
object instance to be deleted does not exist.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
      }

     body {
       request {
         delete {
           allow_partial: true
           obj_paths {
             "Device.LocalAgent.Subscription.<invalid instance identifier>."
           }
         }
       }
     }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT sends a DeleteResponse containing an empty oper_success element.

### 1.30 Delete message with allow partial true, invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to true, and the
object is not valid in the Agent's supported data model.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
     header {
       msg_id: "<msg_id>"
       msg_type: DELETE
     }

     body {
       request {
         delete {
           allow_partial: true
           obj_paths {
             "Device.LocalAgent.InvalidObject."
           }
         }
       }
     }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains a single deleted_obj_result
message with a requested_path of "Device.LocalAgent.InvalidObject." and an oper_failure element, with
err_code "7026", "Invalid Path".

### 1.31 Delete message with allow partial true, multiple objects, invalid object

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to true, and one
of multiple objects is invalid.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and the instance identifier is known by the traffic generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

```
 header {
   msg_id: "<msg_id>"
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: true
       obj_paths {
         {
           "Device.LocalAgent.Subscription.<instance identifier>."
         }
         {
           "Device.LocalAgent.InvalidObject."
         }
       }
     }
   }
 }
```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains two deleted_obj_results elements,
one with an oper_success element, containing an affected_path element
with the value Device.LocalAgent.Subscription.&lt;instance
identifier&gt;.", and the other with an oper_failure element containing
an err_code of "7026", "InvalidPath".

### 1.32 Delete message with allow partial true, multiple objects, object doesn't exist

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the allow_partial element is set to true, and one
of multiple objects does not exist in the Agent's instantiated data
model.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and the instance identifier is known by the traffic generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
    header {
       msg_id: "<msg_id>"
       msg_type: DELETE
      }
    body {
      request {
        delete {
          allow_partial: true
          obj_paths {
               {
                   "Device.LocalAgent.Subscription.<instance identifier>."
               }
               {
                    "Device.LocalAgent.Subscription.<invalid instance identifier>."
               }
           }
          }
         }
        }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains two deleted_obj_results elements. One contains an
oper_success element with an affected_paths element listing "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.", and the other with an empty oper_success element.

### 1.33 Delete message with unique key addressing

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the  uses unique key addressing.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Obtain the unique key values of the
Device.LocalAgent. object that correlates with the
that equates to the source of the test USP messages.

3. Ensure that at least one
Device.LocalAgent.Controller.{i}.BootParameter. object exists on the
EUT, and the instance identifier of the object is known by the traffic
generator.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: DELETE
    }

    body {
      request {

        delete {
          allow_partial: false
          obj_paths {
            "Device.LocalAgent.Controller.[EndpointID=="< EndpointID>"&&Alias=="<Alias if supported>"].BootParameter.<instance identifier>."
            }
          }
        }
      }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains a single deleted_obj_result with a
requested path equal to the path specified in the obj_path of the
Delete message, containing an oper_success element, with one
affected_path element equal to the path name of the Deleted object.

3. The affected_path element uses instance number addressing.

### 1.34 Delete message with wildcard search path, valid objects

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the  uses a wildcard search to delete
multiple valid objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: DELETE
    }

    body {
      request {

        delete {
          allow_partial: false
          obj_paths {
              "Device.LocalAgent.Subscription.*."
            }
          }
        }
      }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains a single deleted_obj_result with a
requested path equal to "Device.LocalAgent.Subscription.&ast;." and an
oper_success element  with one or more affected_path elements equal to
the path names of the Deleted objects.

### 1.35 Delete message with search expression search path

#### Purpose

The purpose of this test is to validate that the EUT properly handles a
Delete message when the  uses a search expression to delete
one or more valid objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the instance identifier of the  object
that represents the traffic generator is known by the traffic generator.

3. Ensure that at least two
Device.LocalAgent.Controller.&lt;instance identifier&gt;.BootParameter.
objects exist on the EUT. At least one of these BootParameter objects
has a value of "false" for its "Enable" parameter, and at least one of
these BootParameter objects has a value of "true" for its "Enable"
parameter.

#### Test Procedure

1. Send a Delete message to the EUT with the following
structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: DELETE
    }

    body {
      request {

        set {
          allow_partial: false
          obj_paths {
              Device.LocalAgent.Controller.<instance identifier>.BootParameter.[Enable=="true"]
            }
          }
        }
      }
    ```

2. Allow the EUT to send a DeleteResp.

#### Test Metrics

1. The EUT's sends a DeleteResp.

2. The DeleteResp contains a single deleted_obj_results
element, with a requested path equal to
"Device.LocalAgent.Controller.&lt;instance
identifier&gt;.BootParameter.[Enable=="true"]" and an oper_success
element with the affected_path elements equal to the path names of the
successfully Deleted objects.

3. The BootParameter whose Enable parameter was equal to
"false" was not deleted.

### 1.36 Get message with full parameter path

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when a
single full parameter path is specified.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

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
          param_paths: "Device.LocalAgent.EndpointID"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, and contains a single
resolved_path_results element. The resolved_path_results element
contains a requested_path equal to "Device.LocalAgent.EndpointID", a
single resolved_path equal to "Device.LocalAgent.", and a single
result_params element with a key of "EndpointID" and a value equal to
the EUT's EndpointID.

### 1.37 Get message with multiple full parameter paths, same object

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when
multiple full parameter paths are specified within the same object.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

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
          param_paths: "Device.LocalAgent.EndpointID"
          param_paths: "Device.LocalAgent.SoftwareVersion"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains two req_path_results elements. The
requested_path_results have no errors. Each contains a single
resolved_path_results element. One resolved_path_result element
contains a requested_path equal to "Device.LocalAgent.EndpointID", a
single resolved_path equal to "Device.LocalAgent.", and a single
result_params element with a key of "EndpointID" and a value equal to
the EUT's EndpointID. The other resolved_path_result element contains
a requested_path equal to "Device.LocalAgent.SoftwareVersion", a single
resolved_path equal to "Device.LocalAgent.", and a single
result_params element with a key of "SoftwareVersion" with a valid
value.

### 1.38 Get message with multiple full parameter paths, different objects

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when
multiple full parameter paths are specified within multiple objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and its instance identifier is known by the traffic generator.

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
          param_paths: "Device.LocalAgent.EndpointID"
          param_paths: "Device.LocalAgent.Subscription.<instance identifier>.Enable"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains two req_path_results elements. The
requested_path_results have no errors. Each contains a single
resolved_path_results element. One resolved_path_result element
contains a requested_path equal to "Device.LocalAgent.EndpointID", a
single resolved_path equal to "Device.LocalAgent.", and a single
result_params element with a key of "EndpointID" and a value equal to
the EUT's EndpointID. The other resolved_path_result element contains
a requested_path equal to "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.Enable", a
single resolved_path equal to "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.", and a
single result_params element with a key of "Enable" with a valid value.

### 1.39 Get message with object path

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when an
object path is specified.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

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
          param_paths: "Device.LocalAgent."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.", and a set of resolved_path_results elements.
One containins a resolved_path of "Device.LocalAgent.", and a number
result_params elements contain keys and values of the parameters of
"Device.LocalAgent.". Additional resolved_path_results exist for each
of the sub-objects of Device.LocalAgent., with result_params containing
the keys and values of each sub-object's parameters.

3. The keys of all result_params elements are relative paths.

### 1.40 Get message with object instance path

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when a path
to an object instance is specified.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and its instance identifier is known by the traffic generator.

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
          param_paths: "Device.LocalAgent.Subscription.<instance identifier>."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.", and a single
resolved_path_results element, with a resolved_path of
"Device.LocalAgent.Subscription.", and a number result_params elements
contain keys and values of the parameters of
"Device.LocalAgent.Subscription.".

3. The keys of all result_params elements are relative paths.

### 1.41 Get message with invalid parameter

#### Purpose

The purpose of this test is to ensure the Agent can properly handle a Get message when a single invalid parameter is requested.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

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
          param_paths: "Device.LocalAgent.InvalidParameter"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has a requested_path equal to
"Device.LocalAgent.InvalidParameter", and an err_code of "7026",
"Invalid Path".

### 1.42 Get message with invalid parameter and valid parameter

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when both a
valid and invalid parameter are requested.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

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
           param_paths: "Device.LocalAgent.EndpointID"
           param_paths: "Device.LocalAgent.InvalidParameter"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains two req_path_results elements. One
requested_path_results has no errors, and contains a single
resolved_path_results element. The resolved_path_results element
contains a requested_path equal to "Device.LocalAgent.EndpointID", a
single resolved_path equal to "Device.LocalAgent.", and a single
result_params element with a key of "EndpointID" and a value equal to
the EUT's EndpointID. The other requested_path_results has a
requested_path equal to "Device.LocalAgent.InvalidParameter", and an
err_code of "7026", "Invalid Path".

### 1.43 Get message using unique key addressing

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses unique key addressing.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least one Subscription object exists on the
EUT, and the unique keys and their values are known by the traffic
generator.

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
          param_paths: "Device.LocalAgent.Subscription.<unique key identifier>.Enable"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.Enable", and a single
resolved_path_results element, with a resolved_path of
"Device.LocalAgent.Subscription.", and a result_params element contain
with a key of "Enable" and a valid value.

### 1.44 Get message using wildcard search path on full parameter

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a wildcard to retrieve a single parameter from
multiple objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT.

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
          param_paths: "Device.LocalAgent.Subscription.*.Enable"
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.&ast;.Enable", and at least two
resolved_path_results elements, each with a resolved_path of
"Device.LocalAgent.Subscription.", and a result_params element contain
with a key of "Enable" and a valid value.

### 1.45 Get message using wildcard search path on object path

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a wildcard to retrieve all parameters from multiple
object instances.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT.

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
          param_paths: "Device.LocalAgent.Subscription.*."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.&ast;.", and a set of
resolved_path_results elements. Each containins a resolved_path of
"Device.LocalAgent.Subscription.&lt;instance identifier&gt;.", and a number of
result_params elements containing keys and values of the parameters of each
Subscription object.

3. The keys of all result_params elements are relative paths.

### 1.46 Get message using search expression search path (equivalence)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that match a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"true" for its Enable parameter, and at least one should have a value of
"false" for its Enable parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[Enable=="true"]."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[Enable=="true"].", and a set of
resolved_path_results elements. Each containins a resolved_path of
"Device.LocalAgent.Subscription.&lt;instance identifier&gt;.", and a number of
result_params elements containing keys and values of the parameters of each
Subscription object where the Enable parameter is "true".

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose Enable parameter is "false".

### 1.47 Get message using search expression search path (non-equivelance)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that do not match a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"true" for its Enable parameter, and at least one should have a value of
"false" for its Enable parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[Enable!="true"]."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[Enable=="true"].", and a set of
resolved_path_results elements. Each containins a resolved_path of
"Device.LocalAgent.Subscription.&lt;instance identifier&gt;.", and a number of
result_params elements containing keys and values of the parameters of each
Subscription object where the Enable parameter is "true".

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose Enable parameter is "false".

### 1.48 Get message using search expression search path (exclusive greater comparison)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are greater than a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"10" for its NotifExpiration parameter, and at least one with a value of
"20" for its NotifExpiration parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[NotifExpiration>10]."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[NotifExpiration>10].", and a
set of resolved_path_results elements. Each containins a
resolved_path of "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.",
and a number of result_params elements containing keys and values of the
parameters of each Subscription object where the NotifExpiration parameter is
greater than 10.

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose NotifExpiration parameter is equal to or less than 10.

### 1.49 Get message using search expression search path (exclusive lesser comparison)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are less than a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least two Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"10" for its NotifExpiration parameter, and at least one with a value of
"5" for its NotifExpiration parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[NotifExpiration<10]."
        }
      }
    }
```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[NotifExpiration<10].", and a
set of resolved_path_results elements. Each containins a
resolved_path of "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.",
and a number result_params elements contain keys and values of the parameters of
each Subscription object where the NotifExpiration parameter is less
than 10.

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose NotifExpiration parameter is equal to or greater than 10.

### 1.50 Get message using search expression search path (inclusive greater comparison)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are greater than or equal to a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least three Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"10" for its NotifExpiration parameter, at least one with a value of
"20" for its NotifExpiration parameter, and at least one with a value of "5"
for its NotifExpiration parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[NotifExpiration>=10]."
        }
      }
    }
    ```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[NotifExpiration>=10].", and a
set of resolved_path_results elements. Each containins a
resolved_path of "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.",
and a number of result_params elements containing keys and values of the
parameters of each Subscription object where the NotifExpiration parameter is
greater than or equal to 10.

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose NotifExpiration parameter is less than 10.

### 1.51 Get message using search expression search path (inclusive lesser comparison)

#### Purpose

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent's Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are less than or equal to a particular value.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that at least three Subscription objects exist on the
EUT. At least one of these Subscription objects should have a value of
"10" for its NotifExpiration parameter, at least one with a value of
"20" for its NotifExpiration parameter, and at least one with a value of "5"
for its NotifExpiration parameter.

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
          param_paths: "Device.LocalAgent.Subscription.[NotifExpiration<=10]."
        }
      }
    }
```

2. Allow the EUT to send a GetResp.

#### Test Metrics

1. The EUT's sends a GetResp.

2. The GetResp contains a single req_path_results element.
The requested_path_results has no errors, has a requested_path equal
to "Device.LocalAgent.Subscription.[NotifExpiration<=10].", and a
set of resolved_path_results elements. Each containins a
resolved_path of "Device.LocalAgent.Subscription.&lt;instance identifier&gt;.",
and a number of result_params elements containing keys and values of the
parameters of each Subscription object where the NotifExpiration parameter is
less than or equal to 10.

3. The keys of all result_params elements are relative paths.

4. The EUT does not return any parameters from Subscription
objects whose NotifExpiration parameter is greater than 10.

### 1.52 Notify - Subscription creation using Value Change

#### Purpose

The purpose of this test is to ensure that the Agent will create and
acknowledge Subscriptions requested by the , and notifies the
 when the conditions of the subscription are triggered. This
test uses the ValueChange event to exercise these functions, validating
the behavior of ValueChange in the process.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned the instance
identifier of the Device.LocalAgent.Controller. object that represents
the Controller simulated by the traffic generator.

3. Set the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.ProvisioningCode to an arbitrary value that is not
"TestValue52".

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify52"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}

              {
                param: "NotifRetry"
                value: "True"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp

3.  Send a Set message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: SET
    }
    body {
      request {
        set {
          allow_partial: false
          update_objs {
            obj_path: "Device.LocalAgent.Controller.<instance identifier>."
            param_settings {
              param: "ProvisioningCode"
              value: "TestValue52"
              required: true}
            }
          }
        }
      }
    }
    ```

1.  Allow the EUT to send a Notify message.

2.  Send a NotifyResp to the EUT.

#### Test Metrics

1.  The EUT sends a successful AddResp.

2.  The EUT sends a Notify message with a subscription_id field equal
    to "Notify52", and an event element of value_change with a
    param_path of "Device.LocalAgent.Controller.&lt;instance
    identifier&gt;.ProvisioningCode" and a param_value of
    "TestValue52".

### 1.53 Notify - Subscription Deletion Using Value Change

#### Purpose

The purpose of this test is to ensure that the Agent will remove and
terminate a Subscription when the  uses the Delete message.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned the instance
identifier of the Device.LocalAgent.Controller. object that represents
the Controller simulated by the traffic generator.

3. Set the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.ProvisioningCode to an arbitrary value that is not
"TestValue53".

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }
    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {
              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify53"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}
              {
                param: "NotifRetry"
                value: "True"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp, and store the instance identifier
    of the Subscription object.

3.  Send a Set message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: SET
    }

    body {
      request {

        set {
          allow_partial: false
          update_objs {

            obj_path: "Device.LocalAgent.Controller.<instance identifier>."



            param_settings {
              param: "ProvisioningCode"
              value: "TestValue53"
              required: true}

            }
          }
        }
      }
    }
    ```

4.  Allow the EUT to send a Notify message.

5.  Send a NotifyResp to the EUT.

6.  Send a Delete message with the following structure:

      ```
      header {
        msg_id: "<msg_id>"
        msg_type: DELETE
      }

      body {
        request {

          set {
            allow_partial: false
            obj_paths {
              "Device.LocalAgent.Subscription.<instance identifier>."
              }
            }
          }
        }
      ```

7.  Allow the EUT to send a DeleteResp.

8.  Repeat step 3, changing the value of ProvisioningCode to
    "notify53-2".

9.  Wait 20 seconds.

#### Test Metrics

1.  The EUT sends a successful DeleteResp.

2.  The EUT does not send a Notify message based on the activity in the
    ProvisioningCode parameter.

### 1.54 Notification Retry using Value Change

#### Purpose

The purpose of this test is to ensure that the Agent will attempt to
resend Notify messages when the NotifRetry parameter in a Subscription
object is set to true and the  does not send a NotifyResp.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned the instance
identifier of the Device.LocalAgent.Controller. object that represents
the Controller simulated by the traffic generator.

3. Set the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.ProvisioningCode to an arbitrary value that is not
"TestValue54".

4. Ensure that the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.USPNotifRetryMinimumWaitInterval is set to its default
value (5).

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify54"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}

              {
                param: "NotifRetry"
                value: "True"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp

3.  Send a Set message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: SET
    }

    body {
      request {

        set {
          allow_partial: false
          update_objs {

            obj_path: "Device.LocalAgent.Controller.<instance identifier>."



            param_settings {
              param: "ProvisioningCode"
              value: "TestValue54"
              required: true}

            }
          }
        }
      }
    }
    ```

4.  Allow the EUT to send a Notify message.

5.  Do not send a NotifyResp to the EUT.

6.  Wait 10 seconds to allow the EUT to send a Notify message.

7.  Do not send a NotifyResp to the EUT.

8.  Wait 20 seconds to allow the EUT to send a Notify message.

9.  Send a NotifyResp to the EUT.

#### Test Metrics

1.  The EUT retries the Notify message.

2.  The first retry occurs within 5-10 seconds. The second retry occurs
    within 10-20 seconds.

### 1.55 Subscription Expiration using Value Change

#### Purpose

The purpose of this test is to ensure that the Agent removes a
Subscription from the Subscription table after its TimeToLive has
expired.

#### Functionality Tag

Conditionally Mandatory (Supports TimeToLive in Device.LocalAgent.Subscription.)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned the instance
identifier of the Device.LocalAgent.Controller. object that represents
the Controller simulated by the traffic generator.

3. Set the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.ProvisioningCode to an arbitrary value that is not
"TestValue55".

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify55"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}

              {
                param: "NotifRetry"
                value: "True"}

              {
                param: "TimeToLive"
                value: "20"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp

3.  Send a Set message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: SET
    }
    body {
      request {
        set {
          allow_partial: false
          update_objs {
            obj_path: "Device.LocalAgent.Controller.<instance identifier>."
            param_settings {
              param: "ProvisioningCode"
              value: "TestValue55"
              required: true}
            }
          }
        }
      }
    }
    ```

4.  Allow the EUT to send a Notify message.

5.  Send a NotifyResp to the EUT.

6.  Wait 20 seconds.

7.  Send a GetInstances message to the EUT with the following structure:

    ```
    header {
          msg_id: "<msg_id>"
          msg_type: GET_INSTANCES
        }
    body {
          request {
            get_instances {
              obj_paths: "Device.LocalAgent.Subscription."
            }
          }
        }
    ```

8.  Allow the EUT to send a GetInstancesResponse.

9.  Repeat step 3 with a value of "TestValue55-2".

10.  Wait 10 seconds.

#### Test Metrics

1.  The EUT sends a Notify message after step 3.

2.  The GetInstancesReponse does not list the instance of the
    Subscription object created in step 1.

3.  The EUT does not send a Notify message after step 9.

### 1.56 Notification Retry Expiration using Value Change

#### Purpose

The purpose of this test is to ensure that the Agent will cease attempts
to retry Notify messages after an amount of time specified in value of
the NotifExpiration parameter in the Subscription object has passed.

#### Functionality Tag

Conditional Mandatory (supports Subscription.{i}.NotifExpiration parameter).

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

2. Ensure that the traffic generator has learned the instance
identifier of the Device.LocalAgent.Controller. object that represents
the Controller simulated by the traffic generator.

3. Set the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.ProvisioningCode to an arbitrary value that is not
"TestValue56".

4. Ensure that the Device.LocalAgent.Controller.&lt;instance
identifier&gt;.USPNotifRetryMinimumWaitInterval is set to its default
value (5).

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify56"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}

              {
                param: "NotifRetry"
                value: "True"}

              {
                param: "NotifExpiration"
                value: "20"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp

3.  Send a Set message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: SET
    }

    body {
      request {
        set {
          allow_partial: false
          update_objs {
            obj_path: "Device.LocalAgent.Controller.<instance identifier>."
            param_settings {
              param: "ProvisioningCode"
              value: "TestValue56"
              required: true}
            }
          }
        }
      }
    }
    ```

4.  Allow the EUT to send a Notify message.

5.  Do not send a NotifyResp to the EUT.

6.  Wait 10 seconds to allow the EUT to send a Notify message.

7.  Do not send a NotifyResp to the EUT.

8.  Wait 20 seconds to allow the EUT to send a Notify message.

9.  Do not send a Notify Response to the EUT.

10.  Wait 30 seconds.

#### Test Metrics

1.  The EUT retries the Notify message within 20 seconds.

2.  The EUT does not retry the Notify message after 20 seconds.

### 1.57 ObjectCreation Notification

#### Purpose

The purpose of this test is to ensure that the Agent will send a Notify
message to the  when the  is Subscribed to the
ObjectCreation event.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary
information to send and receive USP Records to each other.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify57"}
              {
                param: "NotifType"
                value: "ObjectCreation"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Subscription."
                required: true}

              {
                param: "NotifRetry"
                value: "True"}
            }
          }
        }
      }
    }
    ```

2.  Allow the EUT to send an AddResp

3.  Send an Add message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: ADD
    }

    body {
      request {
        add {
          allow_partial: false
          create_objs {
            obj_path: "Device.LocalAgent.Subscription."
            param_settings {

              {
                param: "Enable"
                value: "true"}
              {
                param: "ID"
                value: "notify57-2"}
              {
                param: "NotifType"
                value: "ValueChange"}
              {
                param: "ReferenceList"
                value: "Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode"
                required: true}

              {
                param: "NotifRetry"
                value: "True"}
            }
          }
        }
      }
    }
    ```

4.  Allow the EUT to send an AddResp

5.  Allow the EUT to send a Notify message.

6.  Send a NotifyResp to the EUT.

#### Test Metrics

1.  The EUT sends a successful AddResp.

2.  The EUT sends a Notify message with a subscription_id field equal
    to "Notify57", and an event element of obj_creation with a
    obj_path of "Device.LocalAgent.Subscription.&lt;instance
    number&gt;." and a map element of unique_keys with values of "ID,
    "Notify57-2" and "Recipient, Device.LocalAgent.Controller.&lt;instance
    identifier&gt;.".

### 1.58 ObjectDeletion Notification

#### Purpose

The purpose of this test is to ensure that the Agent will send a Notify
message to the  when the  is Subscribed to the
ObjectDeletion event.

#### Functionality Tag

Mandatory

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

2.  Ensure that at least one Subscription object exists on the EUT, and
    the unique keys and their values are known by the traffic generator.

#### Test Procedure

1.  Send an Add message to the EUT with the following structure:

```
header {
  msg_id: "<msg_id>"
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: "Device.LocalAgent.Subscription."
        param_settings {

          {
            param: "Enable"
            value: "true"}
          {
            param: "ID"
            value: "notify58"}
          {
            param: "NotifType"
            value: "ObjectDeletion"}
          {
            param: "ReferenceList"
            value: "Device.LocalAgent.Subscription."
            required: true}

          {
            param: "NotifRetry"
            value: "True"}
        }
      }
    }
  }
}
```

2.  Allow the EUT to send an AddResp

3.  Send a Delete message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: DELETE
    }

    body {
      request {

        delete {
          allow_partial: false
          obj_paths {
            "Device.LocalAgent.Subscription.<instance identifier from test setup 2>."
            }
          }
        }
      }
    ```

4.  Allow the EUT to send a DeleteResp

5.  Allow the EUT to send a Notify message.

6.  Send a NotifyResp to the EUT.

#### Test Metrics

1.  The EUT sends a successful AddResp.

2.  The EUT sends a Notify message with a subscription_id field equal
    to "Notify58", and an event element of obj_deletion with a
    obj_path of "Device.LocalAgent.Subscription.&lt;instance
    number&gt;."

### 1.59 Event Notification using Periodic!

#### Purpose

The purpose of this test is to ensure that the Agent will send a Notify
message to the  when the  is Subscribed to an Event
notification that correlates with an event defined in its supported data
model.

#### Functionality Tag

Conditional Mandatory (supports Controller:1 profile and Device.LocalAgent.Controller.{i}.PeriodicNotifTime parameter)

### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send
   and receive USP Records to each other.

### Test Procedure

1. Send a Set message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: SET
}
body {
    request {
        set {
            allow_partial: true
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.<Controller ID>.
                    param_settings: [
                        {
                            param: PeriodicNotifInterval
                            value: 60
                        },
                        {
                            param: PeriodicNotifTime
                            value: "2019-01-01T00:00:00Z"
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
            allow_partial: true
            create_objs: [
                {
                    obj_path: Device.LocalAgent.Subscription.
                    param_settings: [
                        {
                            param: Enable
                            value: true
                        },
                        {
                            param: ID
                            value: "sub-103"
                        },
                        {
                            param: NotifType
                            value: Event
                        },
                        {
                            param: ReferenceList
                            value: Device.LocalAgent.Periodic!
                        }
                    ]
                }
            ]
        }
    }
}
```

3. Wait for a Notification from the EUT.
4. Wait for a Notification from the EUT.

### Test Metrics

1. The EUT sends a SetResponse with an oper_success after step 1.
2. The EUT sends an AddResponse with an oper_success after step 2.
3. The EUT sends a Notification with an Periodic! event element.
4. A second Periodic event is sent by the EUT 60 (+/- 4) seconds after
   the first.

### 1.60 OnBoardRequest Notification

#### Purpose

The purpose of this test is to ensure that the Agent will send a Notify
message to the  when the  initiates a
SendOnBoardRequest() operation.

#### Functionality Tag

Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.SendOnBoardRequest() command)

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

#### Test Procedure

1.  Send an Operate message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: OPERATE
    }

    body {
      request {
        operate {
          command: "Device.LocalAgent.Controller.<instance identifier of traffic generator>.SendOnBoardRequest()"
          command_key: "test60"
          send_resp: false
        }
      }
    }
    ```

2.  Allow the EUT to send a Notify message.

3.  Send a NotifyResp to the EUT.

#### Test Metrics

1.  The EUT sends a Notify message with (at minimum) a subscription_id
    field equal to "Notify60", and an event element of on_board_req
    with a obj_path of "Device.LocalAgent.Controller.&lt;instance
    identifier of traffic generator&gt;.", and appropriate values for
    the oui, product_class, serial_number, and
    agent_supported_protocol_versions fields.

### 1.61 Operate message using Reboot() with send_resp true

#### Purpose

The purpose of this test is to ensure that the Agent will correctly
process an Operate message using the Reboot() operation as a trigger
when send_resp is true.

#### Functionality Tag

Conditional Mandatory (supports Reboot:1 or any other command)

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

#### Test Procedure

1.  Send an Operate message to the EUT with the following structure:

  ```
  header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
  }

  body {
    request {
      operate {
        command: "Device.Reboot()"
        command_key: "test61"
        send_resp: true
      }
    }
  }
  ```

2.  Allow the EUT to send an OperateResp

3.  Allow the EUT to reboot.

#### Test Metrics

1.  The EUT sends an OperateResp message with a single
    operation_results element containing an executed_command of
    "Device.Reboot()" and a req_output_args element containing an
    empty output_args element.

2.  The EUT reboots and resumes connectivity with the test system.

### 1.62 Operate message using Reboot() with send_resp false

#### Purpose

The purpose of this test is to ensure that the Agent will correctly
process an Operate message using the Reboot() operation as a trigger
when send_resp is false.

#### Functionality Tag

Conditional Mandatory (supports Reboot:1 or any other command)

#### Test Setup

1.  Ensure that the EUT and test equipment have the necessary
    information to send and receive USP Records to each other.

#### Test Procedure

1.  Send an Operate message to the EUT with the following structure:

    ```
    header {
      msg_id: "<msg_id>"
      msg_type: OPERATE
    }

    body {
      request {
        operate {
          command: "Device.Reboot()"
          command_key: "test62"
          send_resp: false
        }
      }
    }
    ```

1.  Allow the EUT to reboot.

#### Test Metrics

1.  The EUT reboots and resumes connectivity with the test system.

### 1.63 Operate message using input arguments

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process an Operate
message with input arguments.

#### Functionality Tag

Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.ScheduleTimer() command or at least one operation that contains input arguments)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to send and
   receive USP Records to each other.
2. Ensure that a Subscription object exists on the EUT, subscribed to the Timer! event.

#### Test Procedure

1. Send an Operate message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: "Device.LocalAgent.Controller.<Controller instance>.ScheduleTimer()"
            command_key: "test63"
            send_resp: true
            input_args {
                "DelaySeconds": "30"
            }
        }
    }
}
```

2. Allow the EUT to send a Timer! event.

#### Test Metrics

1. The EUT sends an OperateResp message with a single operation\_results element
   containing an executed\_command of
   "Device.LocalAgent.Controller.&lt;Controller instance&gt;.ScheduleTimer()" and a
   req\_output\_args element containing an empty output\_args element.
2. The EUT sends a Notify message containing a Event message with obj\_path of
   "Device.LocalAgent.Controller.&lt;Controller instance&gt;.ScheduleTimer()".


### 1.64 Asynchronous operation with send_resp true

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process an
Operate message where the operation is asynchronous and send_resp is set to true.

#### Functionality Tag

Conditional Mandatory (supports the TraceRoute:1 profile or at least one other asynchronous operation)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure that a Subscription object exists on the EUT that is subscribed to the OperationComplete notification for TraceRoute().


#### Test Procedure

1. Send an Operate message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: "Device.IP.Diagnostics.TraceRoute()"
            command_key: "test64"
            send_resp: "true"
            input_args {
                "Host": <remote host IP>
            }
        }
    }
}
```

2. Allow the EUT to send an Operate Response message with a req\_object\_path
   which matches the command sent in the Operate message
3. Allow the EUT to send a Notify message with an inner OperationComplete
message with a obj\_path element matching the command sent in the Operate
Message.

#### Test Metrics

1. The EUT sends an OperateResp message with a single operation\_results element
   containing an executed\_command of "Device.IP.Diagnostics.TraceRoute()" and a
   req\_obj\_path field containing a path name to the Request object created by the EUT.
2. The EUT sends a Notify message containing a OperationComplete message with
   obj\_path of "Device.IP.Diagnostics.TraceRoute()".


### 1.65 Asynchronous operation with send_resp false

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process an
Operate message where the operation is asynchronous and send_resp is set to false.

#### Functionality Tag

Conditional Mandatory (supports the TraceRoute:1 profile or at least one other asynchronous operation)

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure that a Subscription object exists on the EUT that is subscribed to the OperationComplete notification for TraceRoute().

#### Test Procedure

1. Send an Operate message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: "Device.IP.Diagnostics.TraceRoute()"
            command_key: "test65"
            send_resp: "false"
            input_args {
                "Host": <remote host IP>
            }
        }
    }
}
```

2. Allow the EUT to send a Notify message with an inner OperationComplete message with a obj\_path element matching the command sent in the OperateMessage.

#### Test Metrics

1. The EUT does not send an OperateResp message.
2. The EUT sends a Notify message containing a OperationComplete message with
   obj\_path of "Device.IP.Diagnostics.TraceRoute()".


### 1.66 GetInstances using a single object, first\_level\_only true

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message on a single object when first\_level\_only is true.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure that the Agent has at least one entry in the Device.LocalAgent.Controller.{i}. table and supports at least one multi-instance sub-object (e.g., .MTP.{i}., etc.)

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: "Device.LocalAgent.Controller."
            first_level_only: "true"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp with one req\_path\_results elements
   containing a requested\_path of Device.LocalAgent.Controller. and at least
   one cur\_insts element.
2. All instantiated\_obj\_path elements in the GetInstancesResp only contain
   Device.LocalAgent.Controller. instances.


### 1.67 GetInstances using a single object, first\_level\_only false

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message on a single object when first\_level\_only is false.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure that the Agent has at least one entry in the Device.LocalAgent.Controller.{i}. table and supports at least one multi-instance sub-object (e.g., .MTP.{i}., etc.)

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: "Device.LocalAgent.Controller."
            first_level_only: "false"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp with one req_path_results elements
   containing a requested_path of Device.LocalAgent.Controller., and lists
   all instances of the Controller object, plus any instances of all sub-objects.


### 1.68 GetInstances with multiple objects

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message on multiple objects.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: [
                "Device.LocalAgent.Controller."
                "Device.LocalAgent.MTP."
            ]
            first_level_only: "true"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp with two req\_path\_results elements
   containing a requested\_path of Device.LocalAgent.Controller. and
   Device.LocalAgent.MTP.
2. Both req\_path\_results and each having at least one cur\_insts element.


### *1.69 GetInstances with root object*

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message on the root object.

#### Functionality Tag

Not-in-force (This test is declared not-in-force for this version of the test plan).

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: "Device."
            first_level_only: "false"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp that lists all instances of all objects
in its instantiated data model.


### 1.70 GetInstances with wildcard search path

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message when a wildcard search path is used.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: "Device.LocalAgent.Controller.*.MTP."
            first_level_only: "true"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp with at least one
   req\_path\_results element containing a
   Device.LocalAgent.Controller.{i}.MTP. instance.


### 1.71 GetInstances with search expression search path

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetInstances message when a search expression search path is used.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.
2. Ensure there is at least one BootParameter for the  instance
   used for testing.
3. Ensure the Alias of the  used for testing is known.

#### Test Procedure

1. Send a GetInstances message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: "Device.LocalAgent.Controller.[Alias=="<Controller alias>"].BootParameter."
            first_level_only: "false"
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetInstancesResp with at least one
   req\_path\_results element containing a
   Device.LocalAgent.Controller.<Controller instance>.BootParameter. instance.



### 1.72 GetSupportedDM using a single object, first\_level\_only false, all options

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetSupportedDM message using a single object, when first_level_only is false
and all options are true.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: "Device.LocalAgent."
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetSupportedDMResp.
2. Every req\_obj\_results element contains all
   parameters, events, and commands below the
   specified partial path, plus the supported data model information of all
   sub-objects.




### 1.73 GetSupportedDM using a single object, first\_level\_only true, all options

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetSupportedDM message using a single object, when first_level_only is true
and all options are true.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: "Device.LocalAgent."
            first_level_only: true
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetSupportedDMResp containing req\_object\_results elements
for the specified object and each immediate child object.
2. Only the req\_obj\_results element of the object specified in obj\_paths contains parameters, events, and commands.


### 1.74 GetSupportedDM using a single object, first\_level\_only true, no options

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetSupportedDM message using a single object, when first_level_only is true
and all options are false.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: "Device.LocalAgent."
            first_level_only: true
            return_commands: false
            return_events: false
            return_params: false
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetSupportedDMResp containing req\_object\_results elements
for the specified object and each immediate child object.
2. None of the req\_obj\_results elements contain
   any commands, events, or params.


### 1.75 GetSupportedDM using multiple objects, first\_level\_only true, all options

#### Purpose

The purpose of this test is to ensure that the Agent will correctly process
a GetSupportedDM message using multiple objects, when first_level_only is true
and all options are true.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: [
                "Device.LocalAgent.Controller."
                "Device.LocalAgent.MTP."
            ]
            first_level_only: true
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetSupportedDMResp containing req\_object\_results elements
for the specified objects and each immediate child object.
2. Only the req\_obj\_results element of the object specified in obj\_paths
contains parameters, events, and commands.


### 1.76 GetSupportedDM on root object, all options

#### Purpose

The purpose of this test is to ensure the Agent will correctly process
a GetSupportedDM message when the requested path is the root of the data model.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths:"Device."
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

#### Test Metrics

1. The EUT sends a GetSupportedDMResp message with one or more
   req_\obj\_results specifying its entire supported data model, listing
   commands, parameters, and events.


### 1.77 GetSupportedDM on unsupported object

#### Procedure

The purpose of this test is to ensure the Agent will correctly process
a GetSupportedDM message when the requested path is an unsupported object.

#### Functionality Tag

Mandatory

#### Test Setup

1. Ensure that the EUT and test equipment have the necessary information to
   send and receive USP Records to each other.

#### Test Procedure

1. Send a GetSupportedDM to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths:"Device.LocalAgent.UnsupportedObject."
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

#### Test Metrics

1. The EUT returns a GetSupportedDMResp with a single req\_obj\_results
   with a err_code of 7026.
