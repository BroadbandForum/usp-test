---
# USP major and minor versions
uspMajor: 1
uspMinor: 3

# information shown on each page header
project: The User Services Platform

tagline: '%bbfTitle%'

version: ''
status: ''
shortname: USP

numberSections: false

# Protobuf example verification settings
code-block-filters:
  pbv:
    prog: protobuf-verify.py
    args:
      path:
        - '%PYTHONDIR%'
      import:
        - 'usp.usp_record_%uspMajor%_%uspMinor%_pb2'
        - 'usp.usp_msg_%uspMajor%_%uspMinor%_pb2'
      type: '!attributes.type'
      from: '!attributes.from'
      to: '!classes.protobuf|json|yaml'

buttons:
- label: HTML
  title: '%bbfNumber% Single-file HTML'
  url: index.htm
- label: PDF
  title: '%bbfNumber% PDF'
  url: index.pdf
- label: Home
  title: usp.technology
  url: https://usp.technology

# end of metadata
---

!include cover-page.md

!include %notice%-notice.md

!include METADATA.md

## Executive Summary

Testing is crucial to promoting the interoperability and adoption of
standards. To meet this, the Broadband Forum regularly produces test
suites that validate the conformance of implementations of their
standards. This specification defines the test setup, test procedures,
and test metrics to validate Agent and implementations of the
[User Services Platform (USP)](https://usp.technology),
published as BBF TR-369.

This test plan is used to validate USP Agent implementations for the
[BBF.369 USP Agent Certification Program](https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification). Companies
looking to certify their products, or to acquire certified products, can find
full details on the program, approved test tools and labs, and the list of
certified products
[here](https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification).

## Purpose

This purpose of this document is to provide a definitive guide for validating
the compliance of USP Agents in accordance with the specification.

## Scope

The tests defined below are intended to validate the specific
requirements outlined in the USP specification, as well as those
requirements defined in the Device:2 Data Model for USP Agents for
objects, parameters, commands, and events necessary for the operation of
USP.

# Test Setup

## Test Equipment

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

## Test Setup and Execution


### Basic Test Setup

![Basic Test Setup](./figure-1.png)

### Functionality Tags

USP contains both required and optional functionality. To ensure that
all different classes of device can exercise this test suite, tests are
 marked as "Mandatory", "Conditional Mandatory", or "Deprecated". This is indicated in each individual test case under the "Functionality Tag".

 Tests that are "Deprecated" represent tests that were removed or replaced with newer tests.

#### Alternate parameters, objects, commands, and events in test procedures

For tests that make use of particular parameter, object,
command, event to validate the test metrics, a different subject can be
substituted that meets the needs of the test. For example, if an EUT
does not support the Reboot:1 profile, another synchronous operation can
be substituted for tests 1.61 and 1.62.

### Endpoint Requirements and Metadata Collection

#### Required Profiles

The Device:2 Data Model for USP Agents outlines several profiles that
contain data model objects, parameters, commands, and events necessary
to the operation of USP. In order to be able to perform the tests below,
a USP Agent MUST implement, at minimum, the following profiles:

-   LocalAgent:1

-   Subscriptions:1

Conditional mandatory tests may require the implementation of additional
profiles.

#### Test Cases Required by Profile and Option Support

Those seeking to utilize this test plan can use the following feature IDs to
specify their support for conditional mandatory test cases. Since the types of endpoints under test may vary widely in use cases and complexity, this list is meant to act as a guide to ensure that many kinds of products can achieve compliance. However, when determining which tests must be passed to achieve compliance, testers must know that:

 **An Endpoint Under Test (EUT) MUST complete all Mandatory test cases, and MUST complete all Conditional Mandatory test cases for ALL features supported by the EUT (see table below).**

| Feature ID | Feature name | Test Cases | Notes |
| :-------- | :-------------- | :--------- | :---- |
| 1 | At least one command | 1.61, 1.62 | |
| 2 | At least one command with input arguments | 1.79 | |
| 3 | At least one asynchronous command | 1.64, 1.65 | |
| 4 | Subscription.{i}.NotifExpiration parameter |  1.56 | An extension to the Subscription:1 profile |
| 5 | Controller:1 profile | 1.59 | |
| 6 | Device.LocalAgent.Subscription.{i}.TimeToLive | 1.55 | |
| 7 | Controller:1 profile (writeable) | 1.78, 9.9 | EUT allows the creation of Device.LocalAgent.Controller.{i}. objects |
| 8 | Device.LocalAgent.Controller.{i}.SendOnBoardRequest() | 1.60, 9.9 | |
| 9 | Device.ScheduleTimer() | 1.79 | |
| 10 | Reboot:1 profile | 1.61, 1.62, 9.10 | |
| 11 | (Removed) | | |
| 12 | ControllerTrust:1 profile | 2.9, 2.10 | |
| 13 | ControllerTrust:1 profile (writeable) | 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.20, 2.21, 2.22, 2.23, 2.24, 2.25, 2.26 | Additionally supports at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}. |
| 14 | (Removed) | | |
| 15 | TLS at the MTP Layer | 4.1 | |
| 16 | CoAP MTP (DEPRECATED)| 5.* | |
| 17 | STOMP MTP | 6.* | Excludes 6.8 unless option 18 is supported |
| 18 | STOMPHeartbeat:1 profile | 6.8 | |
| 19 | WebSocket MTP | 7.* | |
| 20 | (removed) | | |
| 21 | Discovery via DHCP Options | 8.1, 8.2, 8.3 | |
| 22 | Discovery via mDNS | 8.4, 8.5, 8.6, 8.7 | |
| 23 | Secure Message Exchange (TLS for USP Record Integrity) | 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.13 | |
| 24 | USP session context | 2.6, 2.7, 2.8, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14, 3.15 | |
| 25 | Device.LocalAgent.AddCertificate() | 9.2 | |
| 26 | Firmware:1 profile | 9.3, 9.5, 9.6, 9.7 | |
| 27 | Firmware:1 profile (Activate) | 9.4, 9.5 | Supports Firmware:1 profile and additionally supports the Activate() operation |
| 28 | Device.LocalAgent.Request.{i}.Cancel() | 9.8 | Applies only if option 26 is supported |
| 29 | (Removed) | | |
| 30 | Device.DeviceInfo.BootFirmwareImage | 9.10 | |
| 31 | The product supports at least one nested multi-instance object | 1.10, 1.71, 1.83 |
| 32 | HTTP bulk data collection with JSON encoding | 10.1, 10.2, 10.5, 10.6, 10.7, 10.8, 10.9 |
| 33 | HTTP bulk data collection with CSV encoding | 10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9 |
| 34 | Bulk data collection via the Push! Event | 10.10, 10.11, 10.12 |
| 35 | MQTT MTP, version 3.1.1 | 11.* | Excludes 11.4, 11.7, 11.8, 11.10, & 11.15, MQTT 5.0 only tests |
| 36 | MQTT MTP, version 5.0 | 11.* | |
| 37 | TriggerAction | 1.93, 1.94 | Supports the Device.LocalAgent.Subscription.{i}.TriggerAction and Device.LocalAgent.Subscription.{i}.TriggerConfigSettings parameters |
| 38 | Command with input arguments | 1.97 | Supports a command that includes one or more input arguments |
| 39 | Event with arguments | 1.98 | Supports an event that includes one or more arguments |
| 40 | Device.LocalAgent.ControllerTrust.SecuredRoles | 2.27 | Supports the use of the SecuredRole for Secured Parameters |
| 41 | Bulk data collection over MQTT | 10.13 | |


#### Elements Specified in the Test Procedure

Many of the mandatory and conditional mandatory tests specify the objects,
parameters, or operations to be used for the test. If the specific elements
are not supported by the EUT, other elements that will satisfy the test criteria
MAY be used instead. If so, the test report MUST include the alternate elements
used.

#### Required EUT Information and Resources

In order to be able to perform the tests and create a report of the
results, the following must be provided concerning the Endpoint Under
Test:

1. The software and/or firmware version of the EUT.
2. The number of firmware banks available if the Firmware:1 profile is supported.
3. A list of the feature IDs supported.
4. If the service elements specified in the tests are not supported, provide a
list of alternate elements used in the testing.

### Clean-Up Procedures

A number of tests that make changes to the EUT have procedures that are
not part of the validation portion of the test case. These procedures
are intended to "clean up" any changes that were made during the test to
ensure that the EUT is in a relatively known state from one test case to
the next. The most obvious example is using the Delete message to remove
any objects that were added as part of the procedure, but the clean-up
procedure may include any number of steps.

## Universal Test Metrics

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

### Appropriate Error Codes

When test cases specify that the EUT include "an appropriate error code", the
error code must be applicable to the USP message for which it was triggered, as
is documented in the [Error Codes
table](https://usp.technology/specification/index.html#sec:error-codes).

## Notes about test case descriptions

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

### Use of examples

The test setup, procedure, and metrics in each test case may contain
examples of the data to be sent to or received from the EUT. In these
examples, elements that are to be filled with a known value dependent on
the protocol's behavior are indicated with greater-than/less-than
brackets (<for example>), to indicate a variable. These examples
should not be taken literally.
