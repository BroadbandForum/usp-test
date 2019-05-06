**ID-369 - Conformance Test Plan for USP Agents**

**Issue 1**

# 1. Executive Summary

Testing is crucial to promoting the interoperability and adoption of
standards. To meet this, the Broadband Forum regularly produces test
suites that validate the conformance of implementations of their
standards. This specification defines the test setup, test procedures,
and test metrics to validate Agent and implementations of the
[User Services Platform (USP)](https://usp.technology),
published as BBF TR-369.

# 2. Purpose

This purpose of this document is to provide a definitive guide for validating
the compliance of USP Agents in accordance with the specification.

# 3. Scope

The tests defined below are intended to validate the specific
requirements outlined in the USP specification, as well as those
requirements defined in the Device:2 Data Model for USP Agents for
objects, parameters, commands, and events necessary for the operation of
USP.

# 4. Test Setup

## 4.1 Test Equipment

There are a number of components necessary to the implementation of this
test suite.

**Traffic Generator** - One or more traffic generators are necessary in
order to transmit the required traffic to execute the test procedures.
Traffic generation can be done with script-able, real implementations of
DHCP servers, mDNS endpoints, and USP endpoints (for example), or can be
simulated through other means. For tests that exercise the presence of
multiple Controllers or agents, the traffic generators can each
represent a single endpoint, or multiple endpoints, depending on its
capabilities, as long as the traffic can be differentiated by the
Endpoint Under Test.

**Analyzer** - One or more traffic analyzers are necessary to confirm
the receipt of messages and evaluate the test metrics outlined in the
tests below. This analyzer may exist at the traffic generator source,
in-line, or accessed through a replicated interface that will push
traffic to the analyzer.

**Test Network** - The tests below require IP layer connectivity between
the Traffic Generator and the Endpoint Under Test (EUT). Steps SHOULD be
taken to unsure that the underlying network does not interfere with the
test procedures or test metrics.

## 4.2 Test Setup and Execution


### 4.2.1 Basic Test Setup

![Figure 1](./figure-1.png)

### 4.2.1 Mandatory vs. Conditional Mandatory Tests

USP contains both required and optional functionality. To ensure that
all different classes of device can exercise this test suite, tests are
divided into "Mandatory" and "Conditional Mandatory". Mandatory tests
MUST be passed by any EUT in order to be considered compliant.
Conditional Mandatory tests MUST be passed by an EUT that implements the
feature outlined in the test case. This is indicated in each individual
test case under the "Functionality Tag".

Tests that are conditional mandatory and have a particular parameter,
command, event, or profile requirement, a different subject can be
substituted that meets the needs of the test. For example, if an EUT
does not support the Reboot:1 profile, another synchronous operation can
be substituted for tests 5.1.61 and 5.1.62.

### 4.2.2 Endpoint Requirements and Metadata Collection

#### 4.2.2.1 Required Profiles

The Device:2 Data Model for USP Agents outlines several profiles that
contain data model objects, parameters, commands, and events necessary
to the operation of USP. In order to be able to perform the tests below,
a USP Agent MUST implement, at minimum, the following profiles:

-   LocalAgent:1

-   Subscriptions:1

Conditional mandatory tests may require the implementation of additional
profiles.

##### 4.2.2.1.1 Additional Test Cases Required by Profile and Option Support

Those seeking to utilize this test plan can use the following feature IDs to
specify their support for conditional mandatory test cases.


| Feature ID | Feature name | Test Cases | Notes |
| :-------- | :-------------- | :--------- | :---- |
| 1 | At least one command | 5.1.61, 5.1.62 | |
| 2 | At least one command with input arguments | 5.1.63 | |
| 3 | At least one asynchronous command | 5.1.64, 5.1.65 | |
| 4 | Subscription.{i}.NotifExpiration parameter |  5.1.56 | An extension to the Subscription:1 profile |
| 5 | Controller:1 profile | 5.1.59 | |
| 7 | Controller:1 profile (writeable) | 5.9.9 | EUT allows the creation of Device.LocalAgent.Controller.{i}. objects |
| 8 | Device.LocalAgent.Controller.{i}.SendOnBoardRequest() | 5.1.60 | |
| 9 | Device.LocalAgent.Controller.{i}.ScheduleTimer() | 5.1.64, 5.1.65, 5.9.1 | |
| 10 | Reboot:1 profile | 5.1.61, 5.1.62, 5.9.10 | |
| 11 | TraceRoute:1 profile | 5.1.64, 5.1.65 | |
| 12 | ControllerTrust:1 profile | 5.2.9, 5.2.10 | |
| 13 | ControllerTrust:1 profile (writeable) | 5.2.4, 5.2.11, 5.2.12, 5.2.13, 5.2.14, 5.2.15, 5.2.16, 5.2.17, 5.2.18, 5.2.19, 5.2.20, 5.2.21, 5.2.22 | Additionally supports at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}. |
| 14 | Self-signed controller certificates | 5.2.5 | |
| 15 | TLS at the MTP Layer | 5.4.1 | |
| 16 | CoAP Message Transport | 5.5.* | |
| 17 | STOMP Message Transport | 5.6.* | Excludes 5.6.8 unless option 18 is supported |
| 18 | STOMPHeartbeat:1 profile | 5.6.8 | |
| 19 | WebSocket MTP | 5.7.* | Excludes 5.7.3 unless option 20 is supported |
| 20 | TR-369 requirement R-WS.6 | 5.7.3 | |
| 21 | Discovery via DHCP Options | 5.8.1, 5.8.2, 5.8.3 | |
| 22 | Discovery via mDNS | 5.8.4, 5.8.5, 5.8.7 | |
| 23 | Integrity protection at the USP layer | 5.3.2, 5.3.3, 5.3.4, 5.3.5, 5.3.6, 5.3.7 | |
| 24 | USP session context | 5.3.8, 5.3.9, 5.3.10, 5.3.11, 5.3.12, 5.3.13, 5.3.14 | |
| 25 | Device.LocalAgent.AddCertificate() | 5.9.2 | |
| 26 | Firmware:1 profile | 5.9.3, 5.9.6, 5.9.7 | |
| 27 | Firmware:1 profile (Activate) | 5.9.4 | Supports Firmware:1 profile and additionally supports the Activate() operation |
| 28 | Device.LocalAgent.Request.{i}.Cancel() | 5.9.8 | Applies only if option 26 is supported |



#### 4.2.2.2 Elements Specified in the Test Procedure

Many of the mandatory and conditional mandatory tests specify the objects,
parameters, or operations to be used for the test. If the specific elements
are not supported by the EUT, other elements that will satisfy the test criteria
MAY be used instead. If so, the test report MUST include the alternate elements
used.

#### 4.2.2.3 Required EUT Information and Resources

In order to be able to perform the tests and create a report of the
results, the following must be provided concerning the Endpoint Under
Test:

1. The software and/or firmware version of the EUT.
2. The number of firmware banks available if the Firmware:1 profile is supported.
3. A list of the features supported in section 4.2.2.1.1.
4. If the service elements specified in the tests are not supported, provide a
list of alternate elements used in the testing.

### 4.2.3 Clean-Up Procedures

A number of tests that make changes to the EUT have procedures that are
not part of the validation portion of the test case. These procedures
are intended to "clean up" any changes that were made during the test to
ensure that the EUT is in a relatively known state from one test case to
the next. The most obvious example is using the Delete message to remove
any objects that were added as part of the procedure, but the clean-up
procedure may include any number of steps.

## 4.3 Universal Test Metrics

Due to the nature of performative testing of protocol messages, certain
requirements in the specification are effectively tested every time.
Writing additional test cases for these metrics is unnecessary, but the
requirements must still be met by endpoint implementations.

1.  The Endpoint ID of the Endpoint Under Test is valid (ARC.3, ARC.4,
    ARC.5, and the requirements outlined in the [authority-scheme
    table](http://usp.technology/specification/architecture/#endpoint_identifier)).

2.  The USP records and USP messages of the Endpoint Under Test are
    valid according to the usp-record.proto and usp-msg.proto schemas
    (ENC.0, ENC.1).

3.  The Path Names and Search Paths used in messages sent by the
    Endpoint Under Test are valid according to [Data Model Path
    Grammar](http://usp.technology/specification/architecture/#data_model_path_grammar)
    and TR-106 (ARC.7).

4.  Path Names in messages originating from the EUT use instance number
    addressing (R-MSG.3).

## 4.4 Notes about test case descriptions

Each of the test cases below have the following sections:

**Purpose** - The purpose describes the reasoning for the test case,
based on the normative requirements defined in USP.

**Functionality Tag** - The functionality tag indicates whether the test
is mandatory or conditional mandatory. If it is the latter, this section
will list any additional Device:2 profiles necessary to the performance
of the test case.

**Test Setup** - The test setup section indicates any special prior
conditions that must be configured before performing the test.

**Test Procedure** - The procedure indicates the steps, in order, taken
to perform the test.

**Test Metrics** - The metrics indicate the required behavior that must
be observed to consider the test passed.

### 4.4.1 Use of examples

The test setup, procedure, and metrics in each test case may contain
examples of the data to be sent to or received from the EUT. In these
examples, elements that are to be filled with a known value dependent on
the protocol's behavior are indicated with greater-than/less-than
brackets (&lt;for example&gt;), to indicate a variable. These examples
should not be taken literally.
