# About BBF.369 Certification

This test plan is used to validate USP Agent implementations for the [BBF.369 USP Agent Certification Program](https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification). Companies looking to certify their products, or to acquire certified products, can find full details on the program, approved test tools and labs, and the list of certified products [here](https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification).

# TP-469 - Conformance Test Plan for User Services Platform Agents

**Issue 1 Corrigendum 2**

### Notice

The Broadband Forum is a non-profit corporation organized to create guidelines for broadband network system development and deployment.  This Test Plan is owned and copyrighted by the Broadband Forum, and portions of this Test Plan may be owned and/or copyrighted by Broadband Forum members.

### Intellectual Property

Recipients of this document are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of this Test Plan, and to provide supporting documentation.

### Terms of Use

Recipients of this document may use it (a) for internal review and study purposes, (b) to provide to the Broadband Forum the comments and notification requested in the preceding paragraph, and (c) if the Recipient is a Broadband Forum member, to implement the Test Plan in a product or service made commercially available.  Any other use of this Test Plan is expressly prohibited without the prior written consent of the Broadband Forum.

THIS TEST PLAN IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT AND ANY IMPLIED WARRANTIES ARE EXPRESSLY DISCLAIMED. ANY USE OF THIS TEST PLAN SHALL BE MADE ENTIRELY AT THE USER’S OR IMPLEMENTER'S OWN RISK, AND NEITHER THE FORUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY USER, IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS TEST PLAN, INCLUDING BUT NOT LIMITED TO, ANY CONSEQUENTIAL, SPECIAL, PUNITIVE, INCIDENTAL AND INDIRECT DAMAGES.

All copies of this Test Plan (or any portion hereof) must include the notices, legends and other provisions set forth on this page.

©2020, The Broadband Forum. All rights reserved. This Broadband Forum document (TP-469) specifies the Test Plan on which is based the USP Agent Certification Program for User Services Platform (TR-369) products. Through an open selection process, the Broadband Forum entered into an agreement with one or more independent Test Agencies to offer commercial testing services against this Test Plan and to confirm results to the Broadband Forum in connection with the Forum's delivery of USP Agent Certification. Offering Certification testing services against this Test Plan is reserved to the Test Agencies duly authorized by the Broadband Forum. Broadband Forum members can independently test against OD-472, but may only produce limited reports which only detail where a given product has failed a test case

*NOTE: The right to display a Broadband Forum Certification Logo may only be granted by the Broadband Forum, and that right is available only to Broadband Forum members that have successfully passed certification testing by a duly authorized Test Agency. Further details on the Broadband Forum Certification Programs can be found at http://www.broadband-forum.org*

## Revision History

### Release 1.0.2

* Both mandatory and conditional mandatory tests can use alternate objects or parameters if available.
* Updated features and requirements.
* Altered test setup of 1.50 to include three objects.
* Fixed metrics of 1.25 to use new DeleteResp logic.
* Fixed tests 1.16 and 1.21 to use the correct error codes.
* Fixed test 1.20 to only check for at least one error.
* Fixed test 4.1 to include "OnBoardRequest()" as a conditional requirement.
* Fixed test 1.32 to use new DeleteResp logic.
* Fixed tests 1.73, 1.74, 1.75 to use new GetSupportedDM first_level_only logic.
* Fixed error code metric of test 1.8.

### Release 1.0.1

* Deprecated test 7.3
* Added flag to the features list to indicate which features are "not-in-force" and not yet available for certification
* Various procedure and metric fixes

### Release 1.0

* First release of this test plan, containing test cases for basic compliance
with TR-369/USP.

## Editors

| Name  | Company | Email | Role |
| ------ | :-----: | :---: | :--- |
| Jason Walls | QA Cafe, LLC | jason@qacafe.com | Editor

## Work Area Directors

| Name  | Company | Email | Role |
| ------ | :-----: | :---: | :--- |
| Jason Walls | QA Cafe, LLC | jason@qacafe.com | Broadband User Services Work Area Director
| John Blackford | Arris | john.blackford@arris.com | Broadband User Services Work Area Director

# Introduction

## Executive Summary

Testing is crucial to promoting the interoperability and adoption of
standards. To meet this, the Broadband Forum regularly produces test
suites that validate the conformance of implementations of their
standards. This specification defines the test setup, test procedures,
and test metrics to validate Agent and implementations of the
[User Services Platform (USP)](https://usp.technology),
published as BBF TR-369.

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

![Figure 1](./figure-1.png)

### Mandatory vs. Conditional Mandatory Tests

USP contains both required and optional functionality. To ensure that
all different classes of device can exercise this test suite, tests are
divided into "Mandatory" and "Conditional Mandatory". Mandatory tests
MUST be passed by any EUT in order to be considered compliant.
Conditional Mandatory tests MUST be passed by an EUT that implements the
feature outlined in the test case. This is indicated in each individual
test case under the "Functionality Tag".

Tests marked as "Not-in-force" in the functionality tag can be ignored for this version of the test plan.

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

##### Additional Test Cases Required by Profile and Option Support

Those seeking to utilize this test plan can use the following feature IDs to
specify their support for conditional mandatory test cases.

*Note: Features marked with an asterisk ` * ` have not yet been validated for use in the Broadband Forum USP Agent Certification Program. These tests may be performed in accordance with this test plan, but are not available for certification as of the publication date of this document.*


| Feature ID | Feature name | Test Cases | Notes |
| :-------- | :-------------- | :--------- | :---- |
| 1 | At least one command | 1.61, 1.62 | |
| 2 | At least one command with input arguments | 1.63 | |
| 3 | At least one asynchronous command | 1.64, 1.65 | |
| 4 | Subscription.{i}.NotifExpiration parameter |  1.56 | An extension to the Subscription:1 profile |
| 5 | Controller:1 profile | 1.59 | |
| 6 | Device.LocalAgent.Subscription.{i}.TimeToLive | 1.55 | |
| 7* | Controller:1 profile (writeable) | 9.9 | EUT allows the creation of Device.LocalAgent.Controller.{i}. objects |
| 8 | Device.LocalAgent.Controller.{i}.SendOnBoardRequest() | 1.60, 4.1, 9.9 | |
| 9 | Device.LocalAgent.Controller.{i}.ScheduleTimer() | 1.63, 9.1 | |
| 10 | Reboot:1 profile | 1.61, 1.62, 9.10 | |
| 11* | TraceRoute:1 profile | 1.64, 1.65 | |
| 12* | ControllerTrust:1 profile | 2.9, 2.10 | |
| 13* | ControllerTrust:1 profile (writeable) | 2.4, 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.20, 2.21, 2.22 | Additionally supports at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}. |
| 14* | Self-signed controller certificates | 2.5 | |
| 15* | TLS at the MTP Layer | 4.1 | |
| 16 | CoAP MTP | 5.*, 8.5 | |
| 17 | STOMP MTP | 6.* | Excludes 6.8 unless option 18 is supported |
| 18 | STOMPHeartbeat:1 profile | 6.8 | |
| 19 | WebSocket MTP | 7.* | Excludes 7.3 unless option 20 is supported |
| 20* | TR-369 requirement R-WS.6 | 7.3 | |
| 21* | Discovery via DHCP Options | 8.1, 8.2, 8.3 | |
| 22* | Discovery via mDNS | 8.4, 8.5, 8.6, 8.7 | |
| 23* | Secure Message Exchange (TLS for USP Record Integrity) | 3.2, 3.3, 3.4, 3.5, 3.6, 3.7 | |
| 24* | USP session context | 2.6, 2.7, 2.8, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14, 3.15 | |
| 25* | Device.LocalAgent.AddCertificate() | 9.2 | |
| 26* | Firmware:1 profile | 9.3, 9.5, 9.6, 9.7 | |
| 27* | Firmware:1 profile (Activate) | 9.4, 9.5 | Supports Firmware:1 profile and additionally supports the Activate() operation |
| 28* | Device.LocalAgent.Request.{i}.Cancel() | 9.8 | Applies only if option 26 is supported |
| 29* | UntrustedRole disabled | 2.3 | The use of UntrustedRole must be either unsupported, or capable of being disabled, to run this test |
| 30 | Device.DeviceInfo.BootFirmwareImage | 9.10 | |
| 31 | The product supports least one nested multi-instance object | 1.10 | |


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
3. A list of the features supported in section 4.2.2.1.1.
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
brackets (&lt;for example&gt;), to indicate a variable. These examples
should not be taken literally.
