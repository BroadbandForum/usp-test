<nav id="TOC" role="doc-toc">
<ul>
<li><a href="#wt-469---conformance-test-plan-for-user-services-platform-agents">WT-469 - Conformance Test Plan for User Services Platform Agents</a><ul>
<li><a href="#legal-notice">Legal Notice</a><ul>
<li><a href="#intellectual-property">Intellectual Property</a></li>
<li><a href="#terms-of-use">Terms of Use</a></li>
</ul></li>
<li><a href="#revision-history">Revision History</a><ul>
<li><a href="#release-1.0">Release 1.0</a></li>
</ul></li>
<li><a href="#editors">Editors</a></li>
<li><a href="#work-area-directors">Work Area Directors</a></li>
</ul></li>
<li><a href="#introduction">Introduction</a><ul>
<li><a href="#executive-summary">Executive Summary</a></li>
<li><a href="#purpose">Purpose</a></li>
<li><a href="#scope">Scope</a></li>
</ul></li>
<li><a href="#test-setup">Test Setup</a><ul>
<li><a href="#test-equipment">Test Equipment</a></li>
<li><a href="#test-setup-and-execution">Test Setup and Execution</a><ul>
<li><a href="#basic-test-setup">Basic Test Setup</a></li>
<li><a href="#mandatory-vs.-conditional-mandatory-tests">Mandatory vs. Conditional Mandatory Tests</a></li>
<li><a href="#endpoint-requirements-and-metadata-collection">Endpoint Requirements and Metadata Collection</a></li>
<li><a href="#clean-up-procedures">Clean-Up Procedures</a></li>
</ul></li>
<li><a href="#universal-test-metrics">Universal Test Metrics</a></li>
<li><a href="#notes-about-test-case-descriptions">Notes about test case descriptions</a><ul>
<li><a href="#use-of-examples">Use of examples</a></li>
</ul></li>
</ul></li>
<li><a href="#usp-agent-test-cases">USP Agent Test Cases</a><ul>
<li><a href="#messages-and-path-names">1 Messages and Path Names</a><ul>
<li><a href="#add-message-with-allow-partial-false-single-object-required-parameters-succeed">1.1 Add message with allow partial false, single object, required parameters succeed</a></li>
<li><a href="#add-message-with-allow-partial-true-single-object-required-parameters-succeed">1.2 Add message with allow partial true, single object, required parameters succeed</a></li>
<li><a href="#add-message-with-allow-partial-false-single-object-required-parameters-fail">1.3 Add message with allow partial false, single object, required parameters fail</a></li>
<li><a href="#add-message-with-allow-partial-false-single-invalid-object">1.4 Add message with allow partial false, single invalid object</a></li>
<li><a href="#add-message-with-allow-partial-false-multiple-objects">1.5 Add message with allow partial false, multiple objects</a></li>
<li><a href="#add-message-with-allow-partial-false-multiple-objects-with-an-invalid-object">1.6 Add message with allow partial false, multiple objects with an invalid object</a></li>
<li><a href="#add-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object">1.7 Add message with allow partial false, multiple objects, required parameters fail in single object</a></li>
<li><a href="#add-message-with-allow-partial-true-required-parameters-fail-invalid-value-single-object">1.8 Add message with allow partial true, required parameters fail, invalid value, single object</a></li>
<li><a href="#add-message-with-allow-partial-true-required-parameters-fail-multiple-objects">1.9 Add message with allow partial true, required parameters fail, multiple objects</a></li>
<li><a href="#add-message-with-unique-key-addressing-in-path">1.10 Add message with unique key addressing in path</a></li>
<li><a href="#set-message-with-allow-partial-false-required-parameters-pass">1.11 Set message with allow partial false, required parameters pass</a></li>
<li><a href="#set-message-with-allow-partial-true-required-parameters-pass">1.12 Set message with allow partial true, required parameters pass</a></li>
<li><a href="#set-message-with-allow-partial-false-multiple-objects">1.13 Set message with allow partial false, multiple objects</a></li>
<li><a href="#set-message-with-allow-partial-false-required-parameters-fail">1.14 Set message with allow partial false, required parameters fail</a></li>
<li><a href="#set-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object">1.15 Set message with allow partial false, multiple objects, required parameters fail in single object</a></li>
<li><a href="#set-message-with-allow-partial-true-required-parameter-fails-multiple-objects">1.16 Set message with allow partial true, required parameter fails, multiple objects</a></li>
<li><a href="#set-message-with-allow-partial-true-non-required-parameter-fails-multiple-parameters">1.17 Set message with allow partial true, non-required parameter fails, multiple parameters</a></li>
<li><a href="#set-message-with-unique-key-addressing-in-path">1.18 Set message with unique key addressing in path</a></li>
<li><a href="#set-message-with-wildcard-search-path-allow-partial-false-required-parameters-pass">1.19 Set message with wildcard search path, allow partial false, required parameters pass</a></li>
<li><a href="#set-message-with-wildcard-search-path-allow-partial-false-required-parameters-fail">1.20 Set message with wildcard search path, allow partial false, required parameters fail</a></li>
<li><a href="#set-message-with-wildcard-search-path-allow-partial-true-required-parameters-fail">1.21 Set message with wildcard search path, allow partial true, required parameters fail</a></li>
<li><a href="#set-message-with-search-expression-search-path">1.22 Set message with search expression search path</a></li>
<li><a href="#set-message-with-invalid-path">1.23 Set message with invalid path</a></li>
<li><a href="#delete-message-with-allow-partial-false-valid-object-instance">1.24 Delete message with allow partial false, valid object instance</a></li>
<li><a href="#delete-message-with-allow-partial-false-object-instance-doesnt-exist">1.25 Delete message with allow partial false, object instance doesn’t exist</a></li>
<li><a href="#delete-message-with-allow-partial-false-invalid-object">1.26 Delete message with allow partial false, invalid object</a></li>
<li><a href="#delete-message-with-allow-partial-false-multiple-objects">1.27 Delete message with allow partial false, multiple objects</a></li>
<li><a href="#delete-message-with-allow-partial-false-multiple-objects-invalid-object">1.28 Delete message with allow partial false, multiple objects, invalid object</a></li>
<li><a href="#delete-message-with-allow-partial-true-object-instance-doesnt-exist">1.29 Delete message with allow partial true, object instance doesn’t exist</a></li>
<li><a href="#delete-message-with-allow-partial-true-invalid-object">1.30 Delete message with allow partial true, invalid object</a></li>
<li><a href="#delete-message-with-allow-partial-true-multiple-objects-invalid-object">1.31 Delete message with allow partial true, multiple objects, invalid object</a></li>
<li><a href="#delete-message-with-allow-partial-true-multiple-objects-object-doesnt-exist">1.32 Delete message with allow partial true, multiple objects, object doesn’t exist</a></li>
<li><a href="#delete-message-with-unique-key-addressing">1.33 Delete message with unique key addressing</a></li>
<li><a href="#delete-message-with-wildcard-search-path-valid-objects">1.34 Delete message with wildcard search path, valid objects</a></li>
<li><a href="#delete-message-with-search-expression-search-path">1.35 Delete message with search expression search path</a></li>
<li><a href="#get-message-with-full-parameter-path">1.36 Get message with full parameter path</a></li>
<li><a href="#get-message-with-multiple-full-parameter-paths-same-object">1.37 Get message with multiple full parameter paths, same object</a></li>
<li><a href="#get-message-with-multiple-full-parameter-paths-different-objects">1.38 Get message with multiple full parameter paths, different objects</a></li>
<li><a href="#get-message-with-object-path">1.39 Get message with object path</a></li>
<li><a href="#get-message-with-object-instance-path">1.40 Get message with object instance path</a></li>
<li><a href="#get-message-with-invalid-parameter">1.41 Get message with invalid parameter</a></li>
<li><a href="#get-message-with-invalid-parameter-and-valid-parameter">1.42 Get message with invalid parameter and valid parameter</a></li>
<li><a href="#get-message-using-unique-key-addressing">1.43 Get message using unique key addressing</a></li>
<li><a href="#get-message-using-wildcard-search-path-on-full-parameter">1.44 Get message using wildcard search path on full parameter</a></li>
<li><a href="#get-message-using-wildcard-search-path-on-object-path">1.45 Get message using wildcard search path on object path</a></li>
<li><a href="#get-message-using-search-expression-search-path-equivalence">1.46 Get message using search expression search path (equivalence)</a></li>
<li><a href="#get-message-using-search-expression-search-path-non-equivelance">1.47 Get message using search expression search path (non-equivelance)</a></li>
<li><a href="#get-message-using-search-expression-search-path-exclusive-greater-comparison">1.48 Get message using search expression search path (exclusive greater comparison)</a></li>
<li><a href="#get-message-using-search-expression-search-path-exclusive-lesser-comparison">1.49 Get message using search expression search path (exclusive lesser comparison)</a></li>
<li><a href="#get-message-using-search-expression-search-path-inclusive-greater-comparison">1.50 Get message using search expression search path (inclusive greater comparison)</a></li>
<li><a href="#get-message-using-search-expression-search-path-inclusive-lesser-comparison">1.51 Get message using search expression search path (inclusive lesser comparison)</a></li>
<li><a href="#notify---subscription-creation-using-value-change">1.52 Notify - Subscription creation using Value Change</a></li>
<li><a href="#notify---subscription-deletion-using-value-change">1.53 Notify - Subscription Deletion Using Value Change</a></li>
<li><a href="#notification-retry-using-value-change">1.54 Notification Retry using Value Change</a></li>
<li><a href="#subscription-expiration-using-value-change">1.55 Subscription Expiration using Value Change</a></li>
<li><a href="#notification-retry-expiration-using-value-change">1.56 Notification Retry Expiration using Value Change</a></li>
<li><a href="#objectcreation-notification">1.57 ObjectCreation Notification</a></li>
<li><a href="#objectdeletion-notification">1.58 ObjectDeletion Notification</a></li>
<li><a href="#event-notification-using-periodic">1.59 Event Notification using Periodic!</a></li>
<li><a href="#test-setup-59">Test Setup</a></li>
<li><a href="#test-procedure-58">Test Procedure</a></li>
<li><a href="#test-metrics-58">Test Metrics</a></li>
<li><a href="#onboardrequest-notification">1.60 OnBoardRequest Notification</a></li>
<li><a href="#operate-message-using-reboot-with-send_resp-true">1.61 Operate message using Reboot() with send_resp true</a></li>
<li><a href="#operate-message-using-reboot-with-send_resp-false">1.62 Operate message using Reboot() with send_resp false</a></li>
<li><a href="#operate-message-using-input-arguments">1.63 Operate message using input arguments</a></li>
<li><a href="#asynchronous-operation-with-send_resp-true">1.64 Asynchronous operation with send_resp true</a></li>
<li><a href="#asynchronous-operation-with-send_resp-false">1.65 Asynchronous operation with send_resp false</a></li>
<li><a href="#getinstances-using-a-single-object-first_level_only-true">1.66 GetInstances using a single object, first_level_only true</a></li>
<li><a href="#getinstances-using-a-single-object-first_level_only-false">1.67 GetInstances using a single object, first_level_only false</a></li>
<li><a href="#getinstances-with-multiple-objects">1.68 GetInstances with multiple objects</a></li>
<li><a href="#getinstances-with-root-object">1.69 GetInstances with root object</a></li>
<li><a href="#getinstances-with-wildcard-search-path">1.70 GetInstances with wildcard search path</a></li>
<li><a href="#getinstances-with-search-expression-search-path">1.71 GetInstances with search expression search path</a></li>
<li><a href="#getsupporteddm-using-a-single-object-first_level_only-false-all-options">1.72 GetSupportedDM using a single object, first_level_only false, all options</a></li>
<li><a href="#getsupporteddm-using-a-single-object-first_level_only-true-all-options">1.73 GetSupportedDM using a single object, first_level_only true, all options</a></li>
<li><a href="#getsupporteddm-using-a-single-object-first_level_only-true-no-options">1.74 GetSupportedDM using a single object, first_level_only true, no options</a></li>
<li><a href="#getsupporteddm-using-multiple-objects-first_level_only-true-all-options">1.75 GetSupportedDM using multiple objects, first_level_only true, all options</a></li>
<li><a href="#getsupporteddm-on-root-object-all-options">1.76 GetSupportedDM on root object, all options</a></li>
<li><a href="#getsupporteddm-on-unsupported-object">1.77 GetSupportedDM on unsupported object</a></li>
</ul></li>
<li><a href="#authentication-and-access-control-test-cases">2 Authentication and Access Control Test Cases</a><ul>
<li><a href="#agent-does-not-accept-messages-from-its-own-endpoint-id">2.1 Agent does not accept messages from its own Endpoint ID</a></li>
<li><a href="#agent-rejects-messages-that-do-not-contain-its-to_id-in-the-usp-record">2.2 Agent rejects messages that do not contain its to_id in the USP Record</a></li>
<li><a href="#agent-does-not-process-messages-without-s-certificate-information">2.3 Agent does not process messages without ’s certificate information</a></li>
<li><a href="#agent-rejects-messages-from-endpoint-ids-that-are-not-in-subjectaltname">2.4 Agent rejects messages from Endpoint IDs that are not in subjectAltName</a></li>
<li><a href="#agent-use-of-self-signed-certificates">2.5 Agent use of self-signed certificates</a></li>
<li><a href="#connecting-without-absolute-time">2.6 Connecting without absolute time</a></li>
<li><a href="#agent-ignores-unsigned-or-invalid-record-signatures">2.7 Agent ignores unsigned or invalid Record signatures</a></li>
<li><a href="#agent-ignores-invalid-tls-certificate">2.8 Agent ignores invalid TLS certificate</a></li>
<li><a href="#use-of-the-untrusted-role">2.9 Use of the Untrusted role</a></li>
<li><a href="#adding-a-role">2.10 Adding a Role</a></li>
<li><a href="#permissions---object-creation-allowed">2.11 Permissions - Object Creation Allowed</a></li>
<li><a href="#permissions---object-creation-not-allowed">2.12 Permissions - Object Creation Not Allowed</a></li>
<li><a href="#permissions---object-deletion-allowed">2.13 Permissions - Object Deletion Allowed</a></li>
<li><a href="#permissions---object-deletion-not-allowed">2.14 Permissions - Object Deletion Not Allowed</a></li>
<li><a href="#permissions---parameter-update-allowed">2.15 Permissions - Parameter Update Allowed</a></li>
<li><a href="#permissions---parameter-update-not-allowed">2.16 Permissions - Parameter Update Not Allowed</a></li>
<li><a href="#permissions---operation-allowed">2.17 Permissions - Operation Allowed</a></li>
<li><a href="#permissions---operation-not-allowed">2.18 Permissions - Operation Not Allowed</a></li>
<li><a href="#permissions---value-change-notification-allowed-on-parameter">2.19 Permissions - Value Change Notification Allowed on Parameter</a></li>
<li><a href="#permissions---value-change-notification-not-allowed-on-parameter">2.20 Permissions - Value Change Notification Not Allowed on Parameter</a></li>
<li><a href="#permissions---overlapping-permissions">2.21 Permissions - Overlapping Permissions</a></li>
<li><a href="#using-get-when-no-read-permissions-are-available-on-some-parameters">2.22 Using Get when no read permissions are available on some parameters</a></li>
</ul></li>
<li><a href="#usp-record-test-cases">3 USP Record Test Cases</a><ul>
<li><a href="#bad-request-outside-a-session-context">3.1 Bad request outside a session context</a></li>
<li><a href="#agent-verifies-non-payload-field-integrity">3.2 Agent Verifies Non-Payload Field Integrity</a></li>
<li><a href="#agent-rejects-invalid-signature-starting-a-session-context">3.3 Agent rejects invalid signature starting a session context</a></li>
<li><a href="#using-tls-for-usp-record-integrity">3.4 Using TLS for USP Record Integrity</a></li>
<li><a href="#failure-to-establish-tls">3.5 Failure to Establish TLS</a></li>
<li><a href="#agent-ignores-tls-renegotiation-for-e2e-message-exchange">3.6 Agent ignores TLS renegotiation for E2E message exchange</a></li>
<li><a href="#use-of-x.509-certificates">3.7 Use of X.509 Certificates</a></li>
<li><a href="#establishing-a-session-context">3.8 Establishing a Session Context</a></li>
<li><a href="#receipt-of-a-record-out-of-a-session-context">3.9 Receipt of a Record out of a Session Context</a></li>
<li><a href="#session-context-expiration">3.10 Session Context Expiration</a></li>
<li><a href="#use-of-sequence-id-and-expected-id">3.11 Use of Sequence ID and Expected ID</a></li>
<li><a href="#preservation-of-usp-records">3.12 Preservation of USP Records</a></li>
<li><a href="#agent-rejects-records-with-different-payload-security-than-the-established-context">3.13 Agent Rejects Records with Different Payload Security than the Established Context</a></li>
<li><a href="#use-of-retransmit_id">3.14 Use of retransmit_id</a></li>
<li><a href="#handling-duplicate-records">3.15 Handling Duplicate Records</a></li>
</ul></li>
<li><a href="#general-mtp-test-cases">4 General MTP Test Cases</a><ul>
<li><a href="#use-of-x.509-certificates-at-the-mtp-layer">4.1 Use of X.509 certificates at the MTP layer</a></li>
</ul></li>
<li><a href="#coap-test-cases">5 CoAP Test Cases</a><ul>
<li><a href="#mapping-a-usp-record-to-a-coap-message">5.1 Mapping a USP Record to a CoAP message</a></li>
<li><a href="#usp-records-that-exceed-coap-message-size">5.2 USP Records that exceed CoAP message size</a></li>
<li><a href="#successful-coap-exchange">5.3 Successful CoAP exchange</a></li>
<li><a href="#failed-coap-exchange---timeout">5.4 Failed CoAP exchange - timeout</a></li>
<li><a href="#failed-coap-exchange---invalid-method">5.5 Failed CoAP Exchange - Invalid Method</a></li>
<li><a href="#failed-coap-exchange---invalid-content-format">5.6 Failed CoAP Exchange - Invalid Content-Format</a></li>
<li><a href="#failed-coap-exchange---invalid-usp-record">5.7 Failed CoAP Exchange - Invalid USP Record</a></li>
<li><a href="#use-of-dtls">5.8 Use of DTLS</a></li>
</ul></li>
<li><a href="#stomp-test-cases">6 STOMP Test Cases</a><ul>
<li><a href="#support-of-required-profiles">6.1 Support of Required Profiles</a></li>
<li><a href="#stomp-session-establishment">6.2 STOMP session establishment</a></li>
<li><a href="#stomp-connection-retry">6.3 STOMP Connection Retry</a></li>
<li><a href="#successful-usp-message-over-stomp-with-required-headers">6.4 Successful USP message over STOMP with required headers</a></li>
<li><a href="#stomp-destination---provided-in-subscribe-dest">6.5 STOMP destination - provided in subscribe-dest</a></li>
<li><a href="#stomp-destination---configured-in-usp-data-model">6.6 STOMP destination - configured in USP data model</a></li>
<li><a href="#stomp-destination---terminates-unconfigured-session">6.7 STOMP Destination - terminates unconfigured session</a></li>
<li><a href="#use-of-stomp-heartbeat-mechanism">6.8 Use of STOMP heartbeat mechanism</a></li>
<li><a href="#error-handling---unprocessed-record">6.9 Error Handling - Unprocessed Record</a></li>
<li><a href="#agents-stomp-destination-is-changed">6.10 Agent’s STOMP destination is changed</a></li>
<li><a href="#stomp---use-of-tls">6.11 STOMP - Use of TLS</a></li>
</ul></li>
<li><a href="#websocket-test-cases">7 WebSocket Test Cases</a><ul>
<li><a href="#session-establishment">7.1 Session Establishment</a></li>
<li><a href="#use-of-only-one-session">7.2 Use of only one session</a></li>
<li><a href="#agent-session-acceptance-from-controller">7.3 Agent session acceptance from Controller</a></li>
<li><a href="#closing-a-websocket-connection">7.4 Closing a WebSocket Connection</a></li>
<li><a href="#rejection-of-session-establishment">7.5 Rejection of Session Establishment</a></li>
<li><a href="#error-handling---unprocessed-records">7.6 Error Handling - Unprocessed Records</a></li>
<li><a href="#use-of-ping-and-pong-frames">7.7 Use of Ping and Pong frames</a></li>
<li><a href="#websocket-session-retry">7.8 WebSocket Session Retry</a></li>
<li><a href="#use-of-tls">7.9 Use of TLS</a></li>
</ul></li>
<li><a href="#discovery-test-cases">8 Discovery Test Cases</a><ul>
<li><a href="#dhcp-discovery---agent-request-requirements">8.1 DHCP Discovery - Agent Request Requirements</a></li>
<li><a href="#dhcp-discovery---agent-handling-of-received-options">8.2 DHCP Discovery - Agent handling of received options</a></li>
<li><a href="#dhcp-discovery---fqdn-leads-to-dns-query">8.3 DHCP Discovery - FQDN Leads to DNS Query</a></li>
<li><a href="#mdns">8.4 mDNS</a></li>
<li><a href="#mdns-and-message-transfer-protocols">8.5 mDNS and Message Transfer Protocols</a></li>
<li><a href="#dns---dns-record-requirements">8.6 DNS - DNS Record Requirements</a></li>
<li><a href="#mdns-request-response">8.7 mDNS request response</a></li>
</ul></li>
<li><a href="#functionality-test-cases">9 Functionality Test Cases</a><ul>
<li><a href="#use-of-the-timer-event">9.1 Use of the Timer! Event</a></li>
<li><a href="#use-of-device.localagent.addcertificate">9.2 Use of Device.LocalAgent.AddCertificate()</a></li>
<li><a href="#upgraded-the-agents-firmware---autoactivate-enabled">9.3 Upgraded the Agent’s Firmware - Autoactivate enabled</a></li>
<li><a href="#upgrading-the-agents-firmware---using-timewindow-immediate">9.4 Upgrading the Agent’s Firmware - Using TimeWindow, Immediate</a></li>
<li><a href="#upgrading-the-agents-firmware---using-timewindow-anytime">9.5 Upgrading the Agent’s Firmware - Using TimeWindow, AnyTime</a></li>
<li><a href="#upgrading-the-agents-firmware---validated-firmware">9.6 Upgrading the Agent’s Firmware - Validated Firmware</a></li>
<li><a href="#upgrading-the-agents-firmware---download-to-active-bank">9.7 Upgrading the Agent’s Firmware - Download to Active Bank</a></li>
<li><a href="#upgrading-the-agents-firmware---cancelling-a-request-using-the-cancel-command">9.8 Upgrading the Agent’s Firmware - Cancelling a request using the Cancel() command</a></li>
<li><a href="#adding-a-new-controller---onboardrequest">9.9 Adding a New Controller - OnBoardRequest</a></li>
<li><a href="#use-of-the-boot-event-and-bootparameters">9.10 Use of the Boot! event and BootParameters</a></li>
</ul></li>
</ul></li>
</ul>
</nav>
<h1 id="wt-469---conformance-test-plan-for-user-services-platform-agents">WT-469 - Conformance Test Plan for User Services Platform Agents</h1>
<p><strong>Issue 1</strong></p>
<p>You can find a pdf version of this document <strong><a href="https://www.broadband-forum.org/technical/download/TR-469.pdf">here</a></strong>.</p>
<h2 id="legal-notice">Legal Notice</h2>
<p>The Broadband Forum is a non-profit corporation organized to create guidelines for broadband network system development and deployment. This Technical Report has been approved by members of the Forum. This Technical Report is subject to change. This Technical Report is copyrighted by the Broadband Forum, and all rights are reserved. Portions of this Technical Report may be copyrighted by Broadband Forum members.</p>
<h3 id="intellectual-property">Intellectual Property</h3>
<p>Recipients of this Technical Report are requested to submit, with their comments, notification of any relevant patent claims or other intellectual property rights of which they may be aware that might be infringed by any implementation of this Technical Report, or use of any software code normatively referenced in this Technical Report, and to provide supporting documentation.</p>
<h3 id="terms-of-use">Terms of Use</h3>
<h4 id="license">License</h4>
<p>Broadband Forum hereby grants you the right, without charge, on a perpetual, non-exclusive and worldwide basis, to utilize the Technical Report for the purpose of developing, making, having made, using, marketing, importing, offering to sell or license, and selling or licensing, and to otherwise distribute, products complying with the Technical Report, in all cases subject to the conditions set forth in this notice and any relevant patent and other intellectual property rights of third parties (which may include members of Broadband Forum). This license grant does not include the right to sublicense, modify or create derivative works based upon the Technical Report except to the extent this Technical Report includes text implementable in computer code, in which case your right under this License to create and modify derivative works is limited to modifying and creating derivative works of such code. For the avoidance of doubt, except as qualified by the preceding sentence, products implementing this Technical Report are not deemed to be derivative works of the Technical Report.</p>
<h4 id="no-warranties">NO WARRANTIES</h4>
<p>THIS TECHNICAL REPORT IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT IS EXPRESSLY DISCLAIMED. ANY USE OF THIS TECHNICAL REPORT SHALL BE MADE ENTIRELY AT THE IMPLEMENTER’S OWN RISK, AND NEITHER THE BROADBAND FORUM, NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY WHATSOEVER TO ANY IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF THIS TECHNICAL REPORT.</p>
<h4 id="third-party-rights">THIRD PARTY RIGHTS</h4>
<p>Without limiting the generality of Section 2 above, BROADBAND FORUM ASSUMES NO RESPONSIBILITY TO COMPILE, CONFIRM, UPDATE OR MAKE PUBLIC ANY THIRD PARTY ASSERTIONS OF PATENT OR OTHER INTELLECTUAL PROPERTY RIGHTS THAT MIGHT NOW OR IN THE FUTURE BE INFRINGED BY AN IMPLEMENTATION OF THE TECHNICAL REPORT IN ITS CURRENT, OR IN ANY FUTURE FORM. IF ANY SUCH RIGHTS ARE DESCRIBED ON THE TECHNICAL REPORT, BROADBAND FORUM TAKES NO POSITION AS TO THE VALIDITY OR INVALIDITY OF SUCH ASSERTIONS, OR THAT ALL SUCH ASSERTIONS THAT HAVE OR MAY BE MADE ARE SO LISTED.</p>
<p>The text of this notice must be included in all copies of this Technical Report.</p>
<h2 id="revision-history">Revision History</h2>
<h3 id="release-1.0">Release 1.0</h3>
<ul>
<li>First release of this test plan, containing test cases for basic compliance with TR-369/USP.</li>
</ul>
<h2 id="editors">Editors</h2>
<table>
<thead>
<tr class="header">
<th>Name</th>
<th style="text-align: center;">Company</th>
<th style="text-align: center;">Email</th>
<th style="text-align: left;">Role</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Jason Walls</td>
<td style="text-align: center;">QA Cafe, LLC</td>
<td style="text-align: center;">jason@qacafe.com</td>
<td style="text-align: left;">Editor</td>
</tr>
</tbody>
</table>
<h2 id="work-area-directors">Work Area Directors</h2>
<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 31%" />
<col style="width: 22%" />
<col style="width: 18%" />
</colgroup>
<thead>
<tr class="header">
<th>Name</th>
<th style="text-align: center;">Company</th>
<th style="text-align: center;">Email</th>
<th style="text-align: left;">Role</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Jason Walls</td>
<td style="text-align: center;">QA Cafe, LLC</td>
<td style="text-align: center;">jason@qacafe.com</td>
<td style="text-align: left;">Broadband User Services Work Area Director</td>
</tr>
<tr class="even">
<td>John Blackford</td>
<td style="text-align: center;">Arris</td>
<td style="text-align: center;">john.blackford@arris.com</td>
<td style="text-align: left;">Broadband User Services Work Area Director</td>
</tr>
</tbody>
</table>
<h1 id="introduction">Introduction</h1>
<h2 id="executive-summary">Executive Summary</h2>
<p>Testing is crucial to promoting the interoperability and adoption of standards. To meet this, the Broadband Forum regularly produces test suites that validate the conformance of implementations of their standards. This specification defines the test setup, test procedures, and test metrics to validate Agent and implementations of the <a href="https://usp.technology">User Services Platform (USP)</a>, published as BBF TR-369.</p>
<h2 id="purpose">Purpose</h2>
<p>This purpose of this document is to provide a definitive guide for validating the compliance of USP Agents in accordance with the specification.</p>
<h2 id="scope">Scope</h2>
<p>The tests defined below are intended to validate the specific requirements outlined in the USP specification, as well as those requirements defined in the Device:2 Data Model for USP Agents for objects, parameters, commands, and events necessary for the operation of USP.</p>
<h1 id="test-setup">Test Setup</h1>
<h2 id="test-equipment">Test Equipment</h2>
<p>There are a number of components necessary to the implementation of this test suite.</p>
<p><strong>Traffic Generator</strong> - One or more traffic generators are necessary in order to transmit the required traffic to execute the test procedures. Traffic generation can be done with script-able, real implementations of DHCP servers, mDNS endpoints, and USP endpoints (for example), or can be simulated through other means. For tests that exercise the presence of multiple Controllers or agents, the traffic generators can each represent a single endpoint, or multiple endpoints, depending on its capabilities, as long as the traffic can be differentiated by the Endpoint Under Test.</p>
<p><strong>Analyzer</strong> - One or more traffic analyzers are necessary to confirm the receipt of messages and evaluate the test metrics outlined in the tests below. This analyzer may exist at the traffic generator source, in-line, or accessed through a replicated interface that will push traffic to the analyzer.</p>
<p><strong>Test Network</strong> - The tests below require IP layer connectivity between the Traffic Generator and the Endpoint Under Test (EUT). Steps SHOULD be taken to unsure that the underlying network does not interfere with the test procedures or test metrics.</p>
<h2 id="test-setup-and-execution">Test Setup and Execution</h2>
<h3 id="basic-test-setup">Basic Test Setup</h3>
<figure>
<img src="./figure-1.png" alt="Figure 1" /><figcaption>Figure 1</figcaption>
</figure>
<h3 id="mandatory-vs.-conditional-mandatory-tests">Mandatory vs. Conditional Mandatory Tests</h3>
<p>USP contains both required and optional functionality. To ensure that all different classes of device can exercise this test suite, tests are divided into “Mandatory” and “Conditional Mandatory”. Mandatory tests MUST be passed by any EUT in order to be considered compliant. Conditional Mandatory tests MUST be passed by an EUT that implements the feature outlined in the test case. This is indicated in each individual test case under the “Functionality Tag”.</p>
<p>Tests that are conditional mandatory and have a particular parameter, command, event, or profile requirement, a different subject can be substituted that meets the needs of the test. For example, if an EUT does not support the Reboot:1 profile, another synchronous operation can be substituted for tests 1.61 and 1.62.</p>
<h3 id="endpoint-requirements-and-metadata-collection">Endpoint Requirements and Metadata Collection</h3>
<h4 id="required-profiles">Required Profiles</h4>
<p>The Device:2 Data Model for USP Agents outlines several profiles that contain data model objects, parameters, commands, and events necessary to the operation of USP. In order to be able to perform the tests below, a USP Agent MUST implement, at minimum, the following profiles:</p>
<ul>
<li><p>LocalAgent:1</p></li>
<li><p>Subscriptions:1</p></li>
</ul>
<p>Conditional mandatory tests may require the implementation of additional profiles.</p>
<h5 id="additional-test-cases-required-by-profile-and-option-support">Additional Test Cases Required by Profile and Option Support</h5>
<p>Those seeking to utilize this test plan can use the following feature IDs to specify their support for conditional mandatory test cases.</p>
<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 38%" />
<col style="width: 25%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Feature ID</th>
<th style="text-align: left;">Feature name</th>
<th style="text-align: left;">Test Cases</th>
<th style="text-align: left;">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">1</td>
<td style="text-align: left;">At least one command</td>
<td style="text-align: left;">1.61, 1.62</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">2</td>
<td style="text-align: left;">At least one command with input arguments</td>
<td style="text-align: left;">1.63</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">3</td>
<td style="text-align: left;">At least one asynchronous command</td>
<td style="text-align: left;">1.64, 1.65</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">4</td>
<td style="text-align: left;">Subscription.{i}.NotifExpiration parameter</td>
<td style="text-align: left;">1.56</td>
<td style="text-align: left;">An extension to the Subscription:1 profile</td>
</tr>
<tr class="odd">
<td style="text-align: left;">5</td>
<td style="text-align: left;">Controller:1 profile</td>
<td style="text-align: left;">1.59</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">7</td>
<td style="text-align: left;">Controller:1 profile (writeable)</td>
<td style="text-align: left;">9.9</td>
<td style="text-align: left;">EUT allows the creation of Device.LocalAgent.Controller.{i}. objects</td>
</tr>
<tr class="odd">
<td style="text-align: left;">8</td>
<td style="text-align: left;">Device.LocalAgent.Controller.{i}.SendOnBoardRequest()</td>
<td style="text-align: left;">1.60</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">9</td>
<td style="text-align: left;">Device.LocalAgent.Controller.{i}.ScheduleTimer()</td>
<td style="text-align: left;">1.64, 1.65, 9.1</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">10</td>
<td style="text-align: left;">Reboot:1 profile</td>
<td style="text-align: left;">1.61, 1.62, 9.10</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">11</td>
<td style="text-align: left;">TraceRoute:1 profile</td>
<td style="text-align: left;">1.64, 1.65</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">12</td>
<td style="text-align: left;">ControllerTrust:1 profile</td>
<td style="text-align: left;">2.9, 2.10</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">13</td>
<td style="text-align: left;">ControllerTrust:1 profile (writeable)</td>
<td style="text-align: left;">2.4, 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.20, 2.21, 2.22</td>
<td style="text-align: left;">Additionally supports at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">14</td>
<td style="text-align: left;">Self-signed controller certificates</td>
<td style="text-align: left;">2.5</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">15</td>
<td style="text-align: left;">TLS at the MTP Layer</td>
<td style="text-align: left;">4.1</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">16</td>
<td style="text-align: left;">CoAP MTP</td>
<td style="text-align: left;">5.*, 8.5</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">17</td>
<td style="text-align: left;">STOMP MTP</td>
<td style="text-align: left;">6.*</td>
<td style="text-align: left;">Excludes 6.8 unless option 18 is supported</td>
</tr>
<tr class="odd">
<td style="text-align: left;">18</td>
<td style="text-align: left;">STOMPHeartbeat:1 profile</td>
<td style="text-align: left;">6.8</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">19</td>
<td style="text-align: left;">WebSocket MTP</td>
<td style="text-align: left;">7.*</td>
<td style="text-align: left;">Excludes 7.3 unless option 20 is supported</td>
</tr>
<tr class="odd">
<td style="text-align: left;">20</td>
<td style="text-align: left;">TR-369 requirement R-WS.6</td>
<td style="text-align: left;">7.3</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">21</td>
<td style="text-align: left;">Discovery via DHCP Options</td>
<td style="text-align: left;">8.1, 8.2, 8.3</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">22</td>
<td style="text-align: left;">Discovery via mDNS</td>
<td style="text-align: left;">8.4, 8.5, 8.6</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">23</td>
<td style="text-align: left;">Secure Message Exchange (TLS for USP Record Integrity)</td>
<td style="text-align: left;">3.2, 3.3, 3.4, 3.5, 3.6, 3.7</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">24</td>
<td style="text-align: left;">USP session context</td>
<td style="text-align: left;">3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">25</td>
<td style="text-align: left;">Device.LocalAgent.AddCertificate()</td>
<td style="text-align: left;">9.2</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">26</td>
<td style="text-align: left;">Firmware:1 profile</td>
<td style="text-align: left;">9.3, 9.6, 9.7</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">27</td>
<td style="text-align: left;">Firmware:1 profile (Activate)</td>
<td style="text-align: left;">9.4</td>
<td style="text-align: left;">Supports Firmware:1 profile and additionally supports the Activate() operation</td>
</tr>
<tr class="odd">
<td style="text-align: left;">28</td>
<td style="text-align: left;">Device.LocalAgent.Request.{i}.Cancel()</td>
<td style="text-align: left;">9.8</td>
<td style="text-align: left;">Applies only if option 26 is supported</td>
</tr>
<tr class="even">
<td style="text-align: left;">29</td>
<td style="text-align: left;">UntrustedRole disabled</td>
<td style="text-align: left;">2.3</td>
<td style="text-align: left;">The use of UntrustedRole must be either unsupported, or capable of being disabled, to run this test</td>
</tr>
<tr class="odd">
<td style="text-align: left;">30</td>
<td style="text-align: left;">Device.LocalAgent.Subscription.{i}.TimeToLive</td>
<td style="text-align: left;">1.55</td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>
<h4 id="elements-specified-in-the-test-procedure">Elements Specified in the Test Procedure</h4>
<p>Many of the mandatory and conditional mandatory tests specify the objects, parameters, or operations to be used for the test. If the specific elements are not supported by the EUT, other elements that will satisfy the test criteria MAY be used instead. If so, the test report MUST include the alternate elements used.</p>
<h4 id="required-eut-information-and-resources">Required EUT Information and Resources</h4>
<p>In order to be able to perform the tests and create a report of the results, the following must be provided concerning the Endpoint Under Test:</p>
<ol type="1">
<li>The software and/or firmware version of the EUT.</li>
<li>The number of firmware banks available if the Firmware:1 profile is supported.</li>
<li>A list of the features supported in section 4.2.2.1.1.</li>
<li>If the service elements specified in the tests are not supported, provide a list of alternate elements used in the testing.</li>
</ol>
<h3 id="clean-up-procedures">Clean-Up Procedures</h3>
<p>A number of tests that make changes to the EUT have procedures that are not part of the validation portion of the test case. These procedures are intended to “clean up” any changes that were made during the test to ensure that the EUT is in a relatively known state from one test case to the next. The most obvious example is using the Delete message to remove any objects that were added as part of the procedure, but the clean-up procedure may include any number of steps.</p>
<h2 id="universal-test-metrics">Universal Test Metrics</h2>
<p>Due to the nature of performative testing of protocol messages, certain requirements in the specification are effectively tested every time. Writing additional test cases for these metrics is unnecessary, but the requirements must still be met by endpoint implementations.</p>
<ol type="1">
<li><p>The Endpoint ID of the Endpoint Under Test is valid (ARC.3, ARC.4, ARC.5, and the requirements outlined in the <a href="http://usp.technology/specification/architecture/#endpoint_identifier">authority-scheme table</a>).</p></li>
<li><p>The USP records and USP messages of the Endpoint Under Test are valid according to the usp-record.proto and usp-msg.proto schemas (ENC.0, ENC.1).</p></li>
<li><p>The Path Names and Search Paths used in messages sent by the Endpoint Under Test are valid according to <a href="http://usp.technology/specification/architecture/#data_model_path_grammar">Data Model Path Grammar</a> and TR-106 (ARC.7).</p></li>
<li><p>Path Names in messages originating from the EUT use instance number addressing (R-MSG.3).</p></li>
</ol>
<h2 id="notes-about-test-case-descriptions">Notes about test case descriptions</h2>
<p>Each of the test cases below have the following sections:</p>
<p><strong>Purpose</strong> - The purpose describes the reasoning for the test case, based on the normative requirements defined in USP.</p>
<p><strong>Functionality Tag</strong> - The functionality tag indicates whether the test is mandatory or conditional mandatory. If it is the latter, this section will list any additional Device:2 profiles necessary to the performance of the test case.</p>
<p><strong>Test Setup</strong> - The test setup section indicates any special prior conditions that must be configured before performing the test.</p>
<p><strong>Test Procedure</strong> - The procedure indicates the steps, in order, taken to perform the test.</p>
<p><strong>Test Metrics</strong> - The metrics indicate the required behavior that must be observed to consider the test passed.</p>
<h3 id="use-of-examples">Use of examples</h3>
<p>The test setup, procedure, and metrics in each test case may contain examples of the data to be sent to or received from the EUT. In these examples, elements that are to be filled with a known value dependent on the protocol’s behavior are indicated with greater-than/less-than brackets (&lt;for example&gt;), to indicate a variable. These examples should not be taken literally.</p>
<h1 id="usp-agent-test-cases">USP Agent Test Cases</h1>
<h2 id="messages-and-path-names">1 Messages and Path Names</h2>
<h3 id="add-message-with-allow-partial-false-single-object-required-parameters-succeed">1.1 Add message with allow partial false, single object, required parameters succeed</h3>
<h4 id="purpose-1">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, and all required parameters to be set upon Object Creation succeed.</p>
<h4 id="functionality-tag">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-1">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add1&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
<li><p>Record the instance identifier of the created object as reported by the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
<li><p>Clean-up: Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}
body {
  request {
    delete {
      allow_partial: false
      obj_paths:
      &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp</p></li>
</ol>
<h4 id="test-metrics">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an AddResp.</p></li>
<li><p>The AddResp contains a single CreatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains no parameter errors and 3 elements in the unique key map: Alias, Recipient, and ID. Alternatively, the OperationSuccess contains 2 elements in the unique key map if the Alias parameter is not supported: Recipient, and ID.</p></li>
<li><p>The EUT creates the Subscription object.</p></li>
<li><p>The Subscription object’s values match the values set in the param_settings element.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-true-single-object-required-parameters-succeed">1.2 Add message with allow partial true, single object, required parameters succeed</h3>
<h4 id="purpose-2">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to true, and all required parameters to be set upon Object Creation succeed.</p>
<h4 id="functionality-tag-1">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-2">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-1">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: true
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add2&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
<li><p>Record the instance identifier of the created object as reported by the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
<li><p>Clean-up: Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}
body {
  request {
    delete {
      allow_partial: false
      obj_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp</p></li>
</ol>
<h4 id="test-metrics-1">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s AddResp is valid.</p></li>
<li><p>The AddResp contains a single CreatedObjectResult that has an OperationStatus of OperationSuccess. The OperationSuccess contains no parameter errors and 3 elements in the unique key map: Alias, Recipient, and ID. Alternatively, the OperationSuccess contains 2 elements in the unique key map if the Alias parameter is not supported: Recipient, and ID.</p></li>
<li><p>The EUT creates the Subscription object.</p></li>
<li><p>The Subscription object’s values match the values set in the param_settings element.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-false-single-object-required-parameters-fail">1.3 Add message with allow partial false, single object, required parameters fail</h3>
<h4 id="purpose-3">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, and at least one required parameter fails, and only a single object is set.</p>
<h4 id="functionality-tag-2">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-3">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-2">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add3&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;}

         {
           param: &quot;InvalidParameter&quot;
           value: &quot;IrrelevantValue&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error message.</p></li>
</ol>
<h4 id="test-metrics-2">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an Error message.</p></li>
<li><p>The Error message contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.Subscription.”, and an err_code of 7010, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-false-single-invalid-object">1.4 Add message with allow partial false, single invalid object</h3>
<h4 id="purpose-4">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, and a single invalid object is set.</p>
<h4 id="functionality-tag-3">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-4">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-3">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.InvalidObject.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add3&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error message.</p></li>
</ol>
<h4 id="test-metrics-3">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an Error message.</p></li>
<li><p>The Error message contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.InvalidObject.”, and an err_code of 7016, “Object does not exist”.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-false-multiple-objects">1.5 Add message with allow partial false, multiple objects</h3>
<h4 id="purpose-5">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, multiple objects are attempted, and all required parameters to be set upon Object Creation succeed.</p>
<h4 id="functionality-tag-4">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-5">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-4">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add41&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }

        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add42&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.EndpointID&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
<li><p>Record the instance identifiers of the created objects as reported by the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths:
      &quot;Device.LocalAgent.Subscription.&lt;instance identifier 1&gt;.&quot;
      &quot;Device.LocalAgent.Subscription.&lt;instance identifier 2&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
<li><p>Clean-up: Send a Delete message to the EUT with the following structure:</p></li>
</ol>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths:
        &quot;Device.LocalAgent.Subscription.&lt;instance identifier 1&gt;.&quot;
        &quot;Device.LocalAgent.Subscription.&lt;instance identifier 2&gt;.&quot;
      }
    }
  }</code></pre>
<ol start="7" type="1">
<li>Allow the EUT to send a DeleteResp.</li>
</ol>
<h4 id="test-metrics-4">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s AddResp is valid.</p></li>
<li><p>The AddResp contains two CreatedObjectResults that each have an OperationStatus of OperationSuccess. The OperationSuccess elements contains no parameter errors and 3 elements in the unique key map: Alias, Recipient, and ID. Alternatively, the OperationSuccess contains 2 elements in the unique key map if the Alias parameter is not supported: Recipient, and ID.</p></li>
<li><p>The EUT creates the Subscription objects.</p></li>
<li><p>The first Subscription object’s values match the values set in the param_settings element.</p></li>
<li><p>The second Subscription object’s values match the values set in the param_settings element.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-false-multiple-objects-with-an-invalid-object">1.6 Add message with allow partial false, multiple objects with an invalid object</h3>
<h4 id="purpose-6">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, multiple objects are attempted, and one of the objects are invalid.</p>
<h4 id="functionality-tag-5">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-6">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-5">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add51&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }

        obj_path: &quot;Device.LocalAgent.InvalidObject.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add52&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.EndpointID&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error.</p></li>
</ol>
<h4 id="test-metrics-5">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an Error message.</p></li>
<li><p>The Error message contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.InvalidObject.”, and an err_code of 7016, “Object does not exist”.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object">1.7 Add message with allow partial false, multiple objects, required parameters fail in single object</h3>
<h4 id="purpose-7">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to false, and at least one required parameter fails in one of multiple objects.</p>
<h4 id="functionality-tag-6">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-7">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-6">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add61&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }

        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;true&quot;}
         {
           param: &quot;ID&quot;
           value: &quot;add62&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;InvalidParameter&quot;
           value: &quot;IrrelevantValue&quot;
           required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error.</p></li>
</ol>
<h4 id="test-metrics-6">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an Error message.</p></li>
<li><p>The Error message contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.Subscription.{i}.InvalidParameter”, and an err_code of 7010, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-true-required-parameters-fail-invalid-value-single-object">1.8 Add message with allow partial true, required parameters fail, invalid value, single object</h3>
<h4 id="purpose-8">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to true, and at least one required parameter fails (with an invalid value) in a single object.</p>
<h4 id="functionality-tag-7">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-8">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-7">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: true
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

         {
           param: &quot;Enable&quot;
           value: &quot;InvalidValue&quot;
           required: true}
         {
           param: &quot;ID&quot;
           value: &quot;add7&quot;}
         {
           param: &quot;NotifType&quot;
           value: &quot;ValueChange&quot;}
         {
           param: &quot;ReferenceList&quot;
           value: &quot;Device.LocalAgent.SoftwareVersion&quot;
           required: true}
        }

      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
</ol>
<h4 id="test-metrics-7">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an AddResp message.</p></li>
<li><p>The AddResp contains a single CreatedObjectResult that has an OperationStatus that is an element of type OperationFailure. The OperationFailure element contains an err_code of “7017”, “Object could not be created”.</p></li>
</ol>
<h3 id="add-message-with-allow-partial-true-required-parameters-fail-multiple-objects">1.9 Add message with allow partial true, required parameters fail, multiple objects</h3>
<h4 id="purpose-9">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the allow_partial element is set to true, and at least one required parameter fails in one of multiple objects.</p>
<h4 id="functionality-tag-8">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-9">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
</ol>
<h4 id="test-procedure-8">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: true
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;add81&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.SoftwareVersion&quot;}
        }

        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {
          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;add81&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.SoftwareVersion&quot;}

          {
            param: &quot;InvalidParameter&quot;
            value: &quot;IrrelevantValue&quot;
            required: true}

        }

      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
<li><p>Record the instance identifier of the created object as reported by the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
<li><p>Clean-up: Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}
body {
  request {
    delete {
      allow_partial: false
      obj_paths:
      &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-8">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an AddResp message.</p></li>
<li><p>The AddResp contains two CreatedObjectResults.</p>
<ol type="a">
<li><p>The first CreateObjectResult is an element of type OperationSuccess. The OperationSuccess elements contains no parameter errors and 3 elements in the unique key map: Alias, Recipient, and ID. Alternatively, the OperationSuccess contains 2 elements in the unique key map if the Alias parameter is not supported: Recipient, and ID.</p></li>
<li><p>The second CreateObjectResult is an element of type OperationFailure. The OperationFailure element contains an err_code of “7017”, “Object could not be created”.</p></li>
</ol></li>
<li><p>The EUT creates the first Subcription object, and does not create the second Subscription object.</p></li>
<li><p>The Subscription object’s values match the values set in the param_settings element.</p></li>
</ol>
<h3 id="add-message-with-unique-key-addressing-in-path">1.10 Add message with unique key addressing in path</h3>
<h4 id="purpose-10">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles an Add message when the uses unique key addressing.</p>
<h4 id="functionality-tag-9">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-10">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>If the EUT has a limit on the number of instances of the Subscription object, ensure that the number of existing Subscription object instances is less than the maximum supported.</p></li>
<li><p>Obtain the unique key values of the Device.LocalAgent. object that correlates with the that equates to the source of the test USP messages.</p></li>
</ol>
<h4 id="test-procedure-9">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Controller.[EndpointID==&quot;&lt; EndpointID&gt;&quot;&amp;&amp;Alias==&quot;&lt;Alias if supported&gt;&quot;].BootParameter.
        param_settings {
          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ParameterName&quot;
            value: &quot;Device.LocalAgent.SoftwareVersion&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp.</p></li>
<li><p>Record the instance identifier of the created object as reported by the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Controller.&lt;instance identifier of Controller&gt;.BootParameter.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
<li><p>Clean-up: Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}
body {
  request {
    delete {
      allow_partial: false
      obj_paths:
      &quot;Device.LocalAgent.Controller.&lt;instance identifier of Controller&gt;.BootParameter.&lt;instance identifier&gt;.&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-9">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an AddResp.</p></li>
<li><p>The AddResp contains a single CreatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains no parameter errors and 2 elements in the unique key map: Alias and ParameterName. Alternatively, the OperationSuccess contains one element in the unique key map if the Alias parameter is not supported: ParameterName.</p></li>
<li><p>The EUT creates the BootParameter object.</p></li>
<li><p>The BootParameter object’s values match the values set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-false-required-parameters-pass">1.11 Set message with allow partial false, required parameters pass</h3>
<h4 id="purpose-11">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to false, and all required parameters to be updated succeed.</p>
<h4 id="functionality-tag-10">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-11">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-10">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-10">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains a single UpdatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-true-required-parameters-pass">1.12 Set message with allow partial true, required parameters pass</h3>
<h4 id="purpose-12">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to true, and all required parameters to be updated succeed.</p>
<h4 id="functionality-tag-11">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-12">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-11">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: true
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
  body {
    request {
      get {
        param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.NotifRetry&quot;
      }
    }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-11">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains a single UpdatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.<instance
number>.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-false-multiple-objects">1.13 Set message with allow partial false, multiple objects</h3>
<h4 id="purpose-13">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to false, and all required parameters to be updated succeed.</p>
<h4 id="functionality-tag-12">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-13">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT, and the instance identifiers are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-12">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true

        obj_path: &quot;Device.LocalAgent.Subscription.&lt;second instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.NotifRetry&quot;
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;second instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-12">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains two UpdatedObjectResults that each have an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element for each object.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-false-required-parameters-fail">1.14 Set message with allow partial false, required parameters fail</h3>
<h4 id="purpose-14">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to false, and a required parameter fails.</p>
<h4 id="functionality-tag-13">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-14">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-13">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;
         required: true
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Error.</p></li>
</ol>
<h4 id="test-metrics-13">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error.</p></li>
<li><p>The Error contains err_code “7004”, “Invalid Arguments”, and a single ParamError element. The ParameError element contains a param_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.InvalidParameter” and an err_code of “7010”, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object">1.15 Set message with allow partial false, multiple objects, required parameters fail in single object</h3>
<h4 id="purpose-15">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to false, and required parameters in one of multiple objects fail.</p>
<h4 id="functionality-tag-14">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-15">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT, and the instance identifiers are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-14">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true

        obj_path: &quot;Device.LocalAgent.Subscription.&lt;second instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;
         required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error.</p></li>
</ol>
<h4 id="test-metrics-14">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error.</p></li>
<li><p>The Error contains err_code “7004”, “Invalid Arguments”, and a single ParamError element. The ParameError element contains a param_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.InvalidParameter” and an err_code of “7010”, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-true-required-parameter-fails-multiple-objects">1.16 Set message with allow partial true, required parameter fails, multiple objects</h3>
<h4 id="purpose-16">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to true, and a required parameter on one of multiple objects fails.</p>
<h4 id="functionality-tag-15">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-16">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT, and the instance identifiers are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-15">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: true
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true

        obj_path: &quot;Device.LocalAgent.Subscription.&lt;second instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;
         required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p></li>
</ol>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre>
<ol start="4" type="1">
<li>Allow the EUT to send a GetResp.</li>
</ol>
<h4 id="test-metrics-15">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains two UpdatedObjectResults.</p>
<ol type="a">
<li><p>The first UpdatedObjectResult has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdatedInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The second UpdatedObjectResult has an OperationStatus that is an element of type OperationFailure. The OperationFailure contains an err_code of “7020”, “Object could not be updated”, and a single UpdatedInstanceFailure element. The UpdatedInstanceFailure has an affected_path with a value of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a single ParameterError element.</p></li>
<li><p>The ParameterError has a param element with a value of “NotifRetry”, an err_code of “7010”, “Unsupported parameter”</p></li>
</ol></li>
<li><p>The retrieved value matches the value set in the param_settings element for the first object.</p></li>
</ol>
<h3 id="set-message-with-allow-partial-true-non-required-parameter-fails-multiple-parameters">1.17 Set message with allow partial true, non-required parameter fails, multiple parameters</h3>
<h4 id="purpose-17">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the allow_partial element is set to true, and one of multiple non-required parameters fail.</p>
<h4 id="functionality-tag-16">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-17">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-16">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: true
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;first instance
identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;}

        param_settings {

         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-16">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains a single UpdatedObjectResult with an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdatedInstanceResult element.</p>
<ol type="a">
<li><p>The UpdatedInstanceResult affected_path is equal to “Device.LocalAgent.Subscription.<instance number>.”.</p></li>
<li><p>The UpdatedInstanceResult has a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The UpdatedInstanceResult has a single ParameterError element, with the “param” field set to “InvalidParameter”, and an err_code of “7010”, “Unsupported parameter”.</p></li>
</ol></li>
<li><p>The retrieved value of NotifRetry matches the value set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-unique-key-addressing-in-path">1.18 Set message with unique key addressing in path</h3>
<h4 id="purpose-18">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the uses unique key addressing.</p>
<h4 id="functionality-tag-17">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-18">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the unique keys and their values are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-17">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p></li>
</ol>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre>
<ol start="4" type="1">
<li>Allow the EUT to send a GetResp.</li>
</ol>
<h4 id="test-metrics-17">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains a single UpdatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-wildcard-search-path-allow-partial-false-required-parameters-pass">1.19 Set message with wildcard search path, allow partial false, required parameters pass</h3>
<h4 id="purpose-19">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the uses a wildcard search path and the requested updates succeed.</p>
<h4 id="functionality-tag-18">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-19">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-18">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.*.&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;first instance identifier from test setup&gt;.NotifRetry&quot;
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;second instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-18">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains two UpdatedObjectResults that each have an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element for each object.</p></li>
</ol>
<h3 id="set-message-with-wildcard-search-path-allow-partial-false-required-parameters-fail">1.20 Set message with wildcard search path, allow partial false, required parameters fail</h3>
<h4 id="purpose-20">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the uses a wildcard search path, allow_partial element is set to false, and required parameters multiple objects fail.</p>
<h4 id="functionality-tag-19">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-20">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-19">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {

        obj_path: &quot;Device.LocalAgent.Subscription.*.&quot;

        param_settings {
         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;
         required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an Error.</p></li>
</ol>
<h4 id="test-metrics-19">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error.</p></li>
<li><p>The Error contains err_code “7004”, “Invalid Arguments”, and at least two ParamError elements. The ParameError elements contains a param_path of “Device.LocalAgent.Subscription.&lt;instance identifier of relevant object&gt;.InvalidParameter” and an err_code of “7010”, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="set-message-with-wildcard-search-path-allow-partial-true-required-parameters-fail">1.21 Set message with wildcard search path, allow partial true, required parameters fail</h3>
<h4 id="purpose-21">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the uses a wildcard search path, the allow_partial element is set to true, and a required parameter on multiple objects fails.</p>
<h4 id="functionality-tag-20">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-21">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-20">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: true
      update_objs {

        obj_path: &quot;Device.LocalAgent.Subscription.*.&quot;

        param_settings {
         param: &quot;InvalidParameter&quot;
         value: &quot;IrrelevantValue&quot;
         required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
</ol>
<h4 id="test-metrics-20">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains at least two UpdatedObjectResults.</p>
<ol type="a">
<li>The UpdatedObjectResults have an OperationStatus that is an element of type OperationFailure. The OperationFailure contains an err_code of “7020”, “Object could not be updated”, and a single UpdatedInstanceFailure element. The UpdatedInstanceFailure has an affected_path with a value of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a single ParameterError element. The ParameterError has a param element with a value of “InvalidParameter”, and an err_code of “7010”, “Unsupported parameter”</li>
</ol></li>
</ol>
<h3 id="set-message-with-search-expression-search-path">1.22 Set message with search expression search path</h3>
<h4 id="purpose-22">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the uses a search path.</p>
<h4 id="functionality-tag-21">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-22">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT with a value for the NotifExpiration that is greater than 0.</p></li>
</ol>
<h4 id="test-procedure-21">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.[NotifExpiration&gt;0].&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: GET
}
body {
  request {
    get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup&gt;.NotifRetry&quot;
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-21">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains a single UpdatedObjectResult that has an OperationStatus that is an element of type OperationSuccess. The OperationSuccess contains a single UpdateInstanceResult, with the affected_path equal to “Device.LocalAgent.Subscription.&lt;instance number&gt;.”, and a single entry in the updated_params map containing “NotifRetry” as the key and “true” as the value.</p></li>
<li><p>The retrieved value matches the value set in the param_settings element.</p></li>
</ol>
<h3 id="set-message-with-invalid-path">1.23 Set message with invalid path</h3>
<h4 id="purpose-23">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Set message when the requested path is invalid.</p>
<h4 id="functionality-tag-22">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-23">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-22">Test Procedure</h4>
<ol type="1">
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: true
      update_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.[Recipient==&quot;InvalidValue&quot;].&quot;

        param_settings {
         param: &quot;NotifRetry&quot;
         value: &quot;&lt;Valid Value&gt;&quot;
         required: true

        }

      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a SetResp.</p></li>
</ol>
<h4 id="test-metrics-22">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a SetResp.</p></li>
<li><p>The SetResp contains one UpdatedObjectResult. UpdatedObjectResult have an OperationStatus that is an element of type OperationFailure. The OperationFailure contains an err_code of “7016”, “Object does not exist”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-false-valid-object-instance">1.24 Delete message with allow partial false, valid object instance</h3>
<h4 id="purpose-24">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to false, and the object to be deleted is valid.</p>
<h4 id="functionality-tag-23">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-24">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT, and the instance identifiers are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-23">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}
body {
  request {
    delete {
      allow_partial: false
      obj_paths {
        &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-23">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_response with a requested_path equal to “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.” and an oper_success element, with one affected_path element equal to the path name of the Deleted object.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-false-object-instance-doesnt-exist">1.25 Delete message with allow partial false, object instance doesn’t exist</h3>
<h4 id="purpose-25">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to false, and the object instance to be deleted does not exist.</p>
<h4 id="functionality-tag-24">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-25">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned any existing Subscription objects and their instance identifiers.</p></li>
</ol>
<h4 id="test-procedure-24">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: false
       obj_paths {
         &quot;Device.LocalAgent.Subscription.&lt;invalid instance
         identifier&gt;.&quot;
       }
     }
   }
 }</code></pre></li>
<li><p>Allow the EUT to send an Error message.</p></li>
</ol>
<h4 id="test-metrics-24">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error message.</p></li>
<li><p>The Error contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and an err_code of 7016, “Object does not exist”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-false-invalid-object">1.26 Delete message with allow partial false, invalid object</h3>
<h4 id="purpose-26">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to false, and the object to be deleted is invalid.</p>
<h4 id="functionality-tag-25">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-26">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-25">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
 }

 body {
   request {
     delete {
       allow_partial: false
       obj_paths {
         &quot;Device.LocalAgent.InvalidObject.&quot;
       }
     }
   }
 }</code></pre></li>
<li><p>Allow the EUT to send an Error message.</p></li>
</ol>
<h4 id="test-metrics-25">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error message.</p></li>
<li><p>The Error contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.InvalidObject.”, and an err_code of 7026, “InvalidPath”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-false-multiple-objects">1.27 Delete message with allow partial false, multiple objects</h3>
<h4 id="purpose-27">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to false, with multiple valid objects.</p>
<h4 id="functionality-tag-26">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-27">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT, and the instance identifiers are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-26">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: false
       obj_paths {
         {
           &quot;Device.LocalAgent.Subscription.&lt;first instance identifier&gt;.&quot;
         }
         {
           &quot;Device.LocalAgent.Subscription.&lt;second instance identifier&gt;.&quot;
         }
       }
     }
   }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-26">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains two deleted_obj_results, each with a requested_path equal to the obj_paths of the Delete message, and an oper_success element containing an affected_path element equal to the path name of the deleted object.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-false-multiple-objects-invalid-object">1.28 Delete message with allow partial false, multiple objects, invalid object</h3>
<h4 id="purpose-28">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to false, and one of the objects to be deleted is invalid.</p>
<h4 id="functionality-tag-27">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-28">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-27">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: false
       obj_paths {
         {
           &quot;Device.LocalAgent.Subscription.&lt;instance identifier.&gt;&quot;
         }
         {
           &quot;Device.LocalAgent.InvalidObject.&quot;
         }
       }
     }
   }
 }</code></pre></li>
<li><p>Allow the EUT to send an Error message.</p></li>
</ol>
<h4 id="test-metrics-27">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends an Error message.</p></li>
<li><p>The Error contains an err_code of 7004, “Invalid arguments”, with the param_errs element containing a single error with a param_path of “Device.LocalAgent.InvalidObject.”, and an err_code of 7026, “InvalidPath”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-true-object-instance-doesnt-exist">1.29 Delete message with allow partial true, object instance doesn’t exist</h3>
<h4 id="purpose-29">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to true, and the object instance to be deleted does not exist.</p>
<h4 id="functionality-tag-28">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-29">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-28">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: true
       obj_paths {
         &quot;Device.LocalAgent.Subscription.&lt;invalid instance identifier&gt;.&quot;
       }
     }
   }
 }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-28">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_result message with a requested_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.” and an oper_failure element, with err_code “7016”, “Object does not exist”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-true-invalid-object">1.30 Delete message with allow partial true, invalid object</h3>
<h4 id="purpose-30">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to true, and the object is not valid in the Agent’s supported data model.</p>
<h4 id="functionality-tag-29">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-30">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-29">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
 }

 body {
   request {
     delete {
       allow_partial: true
       obj_paths {
         &quot;Device.LocalAgent.InvalidObject.&quot;
       }
     }
   }
 }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-29">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_result message with a requested_path of “Device.LocalAgent.InvalidObject.” and an oper_failure element, with err_code “7026”, “Invalid Path”.</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-true-multiple-objects-invalid-object">1.31 Delete message with allow partial true, multiple objects, invalid object</h3>
<h4 id="purpose-31">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to true, and one of multiple objects is invalid.</p>
<h4 id="functionality-tag-30">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-31">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-30">Test Procedure</h4>
<ol type="1">
<li>Send a Delete message to the EUT with the following structure:</li>
</ol>
<pre><code> header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }

 body {
   request {
     delete {
       allow_partial: true
       obj_paths {
         {
           &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
         }
         {
           &quot;Device.LocalAgent.InvalidObject.&quot;
         }
       }
     }
   }
 }</code></pre>
<ol start="2" type="1">
<li>Allow the EUT to send a DeleteResp.</li>
</ol>
<h4 id="test-metrics-30">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains two deleted_obj_results elements, one with an oper_success element, containing an affected_path element with the value Device.LocalAgent.Subscription.&lt;instance identifier&gt;.“, and the other with an oper_failure element containing an err_code of”7026“,”InvalidPath".</p></li>
</ol>
<h3 id="delete-message-with-allow-partial-true-multiple-objects-object-doesnt-exist">1.32 Delete message with allow partial true, multiple objects, object doesn’t exist</h3>
<h4 id="purpose-32">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the allow_partial element is set to true, and one of multiple objects does not exist in the Agent’s instantiated data model.</p>
<h4 id="functionality-tag-31">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-32">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-31">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
   msg_id: &quot;&lt;msg_id&gt;&quot;
   msg_type: DELETE
  }
body {
  request {
    delete {
      allow_partial: true
      obj_paths {
           {
               &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
           }
           {
                &quot;Device.LocalAgent.Subscription.&lt;invalid instance identifier&gt;.&quot;
           }
       }
      }
     }
    }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-31">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains two deleted_obj_results elements, one with an oper_success element, containing an affected_path element with the value Device.LocalAgent.Subscription.&lt;instance identifier&gt;.“, and the other with an oper_failure element containing an err_code of”7016“,”Object does not exist".</p></li>
</ol>
<h3 id="delete-message-with-unique-key-addressing">1.33 Delete message with unique key addressing</h3>
<h4 id="purpose-33">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the uses unique key addressing.</p>
<h4 id="functionality-tag-32">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-33">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Obtain the unique key values of the Device.LocalAgent. object that correlates with the that equates to the source of the test USP messages.</p></li>
<li><p>Ensure that at least one Device.LocalAgent.Controller.{i}.BootParameter. object exists on the EUT, and the instance identifier of the object is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-32">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}

body {
  request {

    delete {
      allow_partial: false
      obj_paths {
        &quot;Device.LocalAgent.Controller.[EndpointID==&quot;&lt; EndpointID&gt;&quot;&amp;&amp;Alias==&quot;&lt;Alias if supported&gt;&quot;].BootParameter.&lt;instance identifier&gt;.&quot;
        }
      }
    }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-32">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_result with a requested path equal to the path specified in the obj_path of the Delete message, containing an oper_success element, with one affected_path element equal to the path name of the Deleted object.</p></li>
<li><p>The affected_path element uses instance number addressing.</p></li>
</ol>
<h3 id="delete-message-with-wildcard-search-path-valid-objects">1.34 Delete message with wildcard search path, valid objects</h3>
<h4 id="purpose-34">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the uses a wildcard search to delete multiple valid objects.</p>
<h4 id="functionality-tag-33">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-34">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-33">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}

body {
  request {

    delete {
      allow_partial: false
      obj_paths {
          &quot;Device.LocalAgent.Subscription.*.&quot;
        }
      }
    }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-33">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_result with a requested path equal to “Device.LocalAgent.Subscription.*.” and an oper_success element  with one or more affected_path elements equal to the path names of the Deleted objects.</p></li>
</ol>
<h3 id="delete-message-with-search-expression-search-path">1.35 Delete message with search expression search path</h3>
<h4 id="purpose-35">Purpose</h4>
<p>The purpose of this test is to validate that the EUT properly handles a Delete message when the uses a search expression to delete one or more valid objects.</p>
<h4 id="functionality-tag-34">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-35">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the instance identifier of the object that represents the traffic generator is known by the traffic generator.</p></li>
<li><p>Ensure that at least two Device.LocalAgent.Controller.<instance identifier>.BootParameter. objects exist on the EUT. At least one of these BootParameter objects has a value of “false” for its “Enable” parameter, and at least one of these BootParameter objects has a value of “true” for its “Enable” parameter.</p></li>
</ol>
<h4 id="test-procedure-34">Test Procedure</h4>
<ol type="1">
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}

body {
  request {

    set {
      allow_partial: false
      obj_paths {
          Device.LocalAgent.Controller.&lt;instance identifier&gt;.BootParameter.[Enable==&quot;true&quot;]
        }
      }
    }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
</ol>
<h4 id="test-metrics-34">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a DeleteResp.</p></li>
<li><p>The DeleteResp contains a single deleted_obj_results element, with a requested path equal to “Device.LocalAgent.Controller.<instance
identifier>.BootParameter.[Enable=="true"]” and an oper_success element with the affected_path elements equal to the path names of the successfully Deleted objects.</p></li>
<li><p>The BootParameter whose Enable parameter was equal to “false” was not deleted.</p></li>
</ol>
<h3 id="get-message-with-full-parameter-path">1.36 Get message with full parameter path</h3>
<h4 id="purpose-36">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when a single full parameter path is specified.</p>
<h4 id="functionality-tag-35">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-36">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-35">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
          param_paths: &quot;Device.LocalAgent.EndpointID&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-35">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, and contains a single resolved_path_results element. The resolved_path_results element contains a requested_path equal to “Device.LocalAgent.EndpointID”, a single resolved_path equal to “Device.LocalAgent.”, and a single result_params element with a key of “EndpointID” and a value equal to the EUT’s EndpointID.</p></li>
</ol>
<h3 id="get-message-with-multiple-full-parameter-paths-same-object">1.37 Get message with multiple full parameter paths, same object</h3>
<h4 id="purpose-37">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when multiple full parameter paths are specified within the same object.</p>
<h4 id="functionality-tag-36">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-37">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-36">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.EndpointID&quot;
      param_paths: &quot;Device.LocalAgent.SoftwareVersion&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-36">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains two req_path_results elements. The requested_path_results have no errors. Each contains a single resolved_path_results element. One resolved_path_result element contains a requested_path equal to “Device.LocalAgent.EndpointID”, a single resolved_path equal to “Device.LocalAgent.”, and a single result_params element with a key of “EndpointID” and a value equal to the EUT’s EndpointID. The other resolved_path_result element contains a requested_path equal to “Device.LocalAgent.SoftwareVersion”, a single resolved_path equal to “Device.LocalAgent.”, and a single result_params element with a key of “SoftwareVersion” with a valid value.</p></li>
</ol>
<h3 id="get-message-with-multiple-full-parameter-paths-different-objects">1.38 Get message with multiple full parameter paths, different objects</h3>
<h4 id="purpose-38">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when multiple full parameter paths are specified within multiple objects.</p>
<h4 id="functionality-tag-37">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-38">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and its instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-37">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.EndpointID&quot;
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.Enable&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-37">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains two req_path_results elements. The requested_path_results have no errors. Each contains a single resolved_path_results element. One resolved_path_result element contains a requested_path equal to “Device.LocalAgent.EndpointID”, a single resolved_path equal to “Device.LocalAgent.”, and a single result_params element with a key of “EndpointID” and a value equal to the EUT’s EndpointID. The other resolved_path_result element contains a requested_path equal to “Device.LocalAgent.Subscription..Enable”, a single resolved_path equal to “Device.LocalAgent.Subscription..”, and a single result_params element with a key of “Enable” with a valid value.</p></li>
</ol>
<h3 id="get-message-with-object-path">1.39 Get message with object path</h3>
<h4 id="purpose-39">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when an object path is specified.</p>
<h4 id="functionality-tag-38">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-39">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-38">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-38">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.”, and a set of resolved_path_results elements. One containins a resolved_path of “Device.LocalAgent.”, and a number result_params elements contain keys and values of the parameters of “Device.LocalAgent.”. Additional resolved_path_results exist for each of the sub-objects of Device.LocalAgent., with result_params containing the keys and values of each sub-object’s parameters.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
</ol>
<h3 id="get-message-with-object-instance-path">1.40 Get message with object instance path</h3>
<h4 id="purpose-40">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when a path to an object instance is specified.</p>
<h4 id="functionality-tag-39">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-40">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and its instance identifier is known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-39">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-39">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription..”, and a single resolved_path_results element, with a resolved_path of “Device.LocalAgent.Subscription..”, and a number result_params elements contain keys and values of the parameters of “Device.LocalAgent.Subscription..”.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
</ol>
<h3 id="get-message-with-invalid-parameter">1.41 Get message with invalid parameter</h3>
<h4 id="purpose-41">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when a single invalid parameter is requested.</p>
<h4 id="functionality-tag-40">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-41">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-40">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.InvalidParameter&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-40">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has a requested_path equal to “Device.LocalAgent.InvalidParameter”, and an err_code of “7010”, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="get-message-with-invalid-parameter-and-valid-parameter">1.42 Get message with invalid parameter and valid parameter</h3>
<h4 id="purpose-42">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when both a valid and invalid parameter are requested.</p>
<h4 id="functionality-tag-41">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-42">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-41">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
       param_paths: &quot;Device.LocalAgent.EndpointID&quot;
       param_paths: &quot;Device.LocalAgent.InvalidParameter&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-41">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains two req_path_results elements. One requested_path_results has no errors, and contains a single resolved_path_results element. The resolved_path_results element contains a requested_path equal to “Device.LocalAgent.EndpointID”, a single resolved_path equal to “Device.LocalAgent.”, and a single result_params element with a key of “EndpointID” and a value equal to the EUT’s EndpointID. The other requested_path_results has a requested_path equal to “Device.LocalAgent.InvalidParameter”, and an err_code of “7010”, “Unsupported Parameter”.</p></li>
</ol>
<h3 id="get-message-using-unique-key-addressing">1.43 Get message using unique key addressing</h3>
<h4 id="purpose-43">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses unique key addressing.</p>
<h4 id="functionality-tag-42">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-43">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the unique keys and their values are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-42">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.&lt;unique key identifier&gt;.Enable&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-42">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription..Enable”, and a single resolved_path_results element, with a resolved_path of “Device.LocalAgent.Subscription..”, and a result_params element contain with a key of “Enable” and a valid value.</p></li>
</ol>
<h3 id="get-message-using-wildcard-search-path-on-full-parameter">1.44 Get message using wildcard search path on full parameter</h3>
<h4 id="purpose-44">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a wildcard to retrieve a single parameter from multiple objects.</p>
<h4 id="functionality-tag-43">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-44">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-43">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.*.Enable&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-43">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.*.Enable”, and at least two resolved_path_results elements, each with a resolved_path of “Device.LocalAgent.Subscription..”, and a result_params element contain with a key of “Enable” and a valid value.</p></li>
</ol>
<h3 id="get-message-using-wildcard-search-path-on-object-path">1.45 Get message using wildcard search path on object path</h3>
<h4 id="purpose-45">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a wildcard to retrieve all parameters from multiple object instances.</p>
<h4 id="functionality-tag-44">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-45">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT.</p></li>
</ol>
<h4 id="test-procedure-44">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.*.&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-44">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.*.”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-equivalence">1.46 Get message using search expression search path (equivalence)</h3>
<h4 id="purpose-46">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that match a particular value.</p>
<h4 id="functionality-tag-45">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-46">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “true” for its Enable parameter, and at least one should have a value of “false” for its Enable parameter.</p></li>
</ol>
<h4 id="test-procedure-45">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[Enable==&quot;true&quot;].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-45">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[Enable=="true"].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object where the Enable parameter is “true”.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose Enable parameter is “false”.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-non-equivelance">1.47 Get message using search expression search path (non-equivelance)</h3>
<h4 id="purpose-47">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that do not match a particular value.</p>
<h4 id="functionality-tag-46">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-47">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “true” for its Enable parameter, and at least one should have a value of “false” for its Enable parameter.</p></li>
</ol>
<h4 id="test-procedure-46">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[Enable!=&quot;true&quot;].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-46">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[Enable=="true"].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object where the Enable parameter is “true”.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose Enable parameter is “false”.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-exclusive-greater-comparison">1.48 Get message using search expression search path (exclusive greater comparison)</h3>
<h4 id="purpose-48">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that are greater than a particular value.</p>
<h4 id="functionality-tag-47">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-48">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “10” for its NotifExpiration parameter, and at least one with a value of “20” for its NotifExpiration parameter.</p></li>
</ol>
<h4 id="test-procedure-47">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[NotifExpiration&gt;10].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-47">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[NotifExpiration&gt;10].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object where the NotifExpiration parameter is greater than 10.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose NotifExpiration parameter is equal to or less than 10.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-exclusive-lesser-comparison">1.49 Get message using search expression search path (exclusive lesser comparison)</h3>
<h4 id="purpose-49">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that are less than a particular value.</p>
<h4 id="functionality-tag-48">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-49">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “10” for its NotifExpiration parameter, and at least one with a value of “5” for its NotifExpiration parameter.</p></li>
</ol>
<h4 id="test-procedure-48">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[NotifExpiration&lt;10].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-48">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[NotifExpiration&lt;10].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number result_params elements contain keys and values of the parameters of each Subscription object where the NotifExpiration parameter is less than 10.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose NotifExpiration parameter is equal to or greater than 10.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-inclusive-greater-comparison">1.50 Get message using search expression search path (inclusive greater comparison)</h3>
<h4 id="purpose-50">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that are greater than or equal to a particular value.</p>
<h4 id="functionality-tag-49">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-50">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “10” for its NotifExpiration parameter, and at least one with a value of “20” for its NotifExpiration parameter.</p></li>
</ol>
<h4 id="test-procedure-49">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[NotifExpiration&gt;=10].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-49">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[NotifExpiration&gt;=10].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object where the NotifExpiration parameter is greater than or equal to 10.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose NotifExpiration parameter is less than 10.</p></li>
</ol>
<h3 id="get-message-using-search-expression-search-path-inclusive-lesser-comparison">1.51 Get message using search expression search path (inclusive lesser comparison)</h3>
<h4 id="purpose-51">Purpose</h4>
<p>The purpose of this test is to ensure the can retrieve the values of parameters in the Agent’s Instantiated Data Model when the requested path uses a search path to retrieve objects that that parameters that are less than or equal to a particular value.</p>
<h4 id="functionality-tag-50">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-51">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least two Subscription objects exist on the EUT. At least one of these Subscription objects should have a value of “10” for its NotifExpiration parameter, and at least one with a value of “5” for its NotifExpiration parameter.</p></li>
</ol>
<h4 id="test-procedure-50">Test Procedure</h4>
<ol type="1">
<li><p>Send a Get message to the EUT with the following structure:</p>
<pre><code>    header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET
    }
    body {
      request {
        get {
      param_paths: &quot;Device.LocalAgent.Subscription.[NotifExpiration&lt;=10].&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetResp.</p></li>
</ol>
<h4 id="test-metrics-50">Test Metrics</h4>
<ol type="1">
<li><p>The EUT’s sends a GetResp.</p></li>
<li><p>The GetResp contains a single req_path_results element. The requested_path_results has no errors, has a requested_path equal to “Device.LocalAgent.Subscription.[NotifExpiration&lt;=10].”, and a set of resolved_path_results elements. Each containins a resolved_path of “Device.LocalAgent.Subscription.&lt;instance identifier&gt;.”, and a number of result_params elements containing keys and values of the parameters of each Subscription object where the NotifExpiration parameter is less than or equal to 10.</p></li>
<li><p>The keys of all result_params elements are relative paths.</p></li>
<li><p>The EUT does not return any parameters from Subscription objects whose NotifExpiration parameter is greater than 10.</p></li>
</ol>
<h3 id="notify---subscription-creation-using-value-change">1.52 Notify - Subscription creation using Value Change</h3>
<h4 id="purpose-52">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will create and acknowledge Subscriptions requested by the , and notifies the when the conditions of the subscription are triggered. This test uses the ValueChange event to exercise these functions, validating the behavior of ValueChange in the process.</p>
<h4 id="functionality-tag-51">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-52">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned the instance identifier of the Device.LocalAgent.Controller. object that represents the Controller simulated by the traffic generator.</p></li>
<li><p>Set the Device.LocalAgent.Controller.<instance
identifier>.ProvisioningCode to an arbitrary value that is not “TestValue52”.</p></li>
</ol>
<h4 id="test-procedure-51">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify52&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.&quot;
        param_settings {
          param: &quot;ProvisioningCode&quot;
          value: &quot;TestValue52&quot;
          required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
</ol>
<h4 id="test-metrics-51">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends a successful AddResp.</p></li>
<li><p>The EUT sends a Notify message with a subscription_id field equal to “Notify52”, and an event element of value_change with a param_path of “Device.LocalAgent.Controller.<instance
identifier>.ProvisioningCode” and a param_value of “TestValue52”.</p></li>
</ol>
<h3 id="notify---subscription-deletion-using-value-change">1.53 Notify - Subscription Deletion Using Value Change</h3>
<h4 id="purpose-53">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will remove and terminate a Subscription when the uses the Delete message.</p>
<h4 id="functionality-tag-52">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-53">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned the instance identifier of the Device.LocalAgent.Controller. object that represents the Controller simulated by the traffic generator.</p></li>
<li><p>Set the Device.LocalAgent.Controller.<instance
identifier>.ProvisioningCode to an arbitrary value that is not “TestValue53”.</p></li>
</ol>
<h4 id="test-procedure-52">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}
body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {
          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify53&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}
          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp, and store the instance identifier of the Subscription object.</p></li>
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {

        obj_path: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.&quot;



        param_settings {
          param: &quot;ProvisioningCode&quot;
          value: &quot;TestValue53&quot;
          required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
<li><p>Send a Delete message with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}

body {
  request {

    set {
      allow_partial: false
      obj_paths {
        &quot;Device.LocalAgent.Subscription.&lt;instance identifier&gt;.&quot;
        }
      }
    }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp.</p></li>
<li><p>Repeat step 3, changing the value of ProvisioningCode to “notify53-2”.</p></li>
<li><p>Wait 20 seconds.</p></li>
</ol>
<h4 id="test-metrics-52">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends a successful DeleteResp.</p></li>
<li><p>The EUT does not send a Notify message based on the activity in the ProvisioningCode parameter.</p></li>
</ol>
<h3 id="notification-retry-using-value-change">1.54 Notification Retry using Value Change</h3>
<h4 id="purpose-54">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will attempt to resend Notify messages when the NotifRetry parameter in a Subscription object is set to true and the does not send a NotifyResp.</p>
<h4 id="functionality-tag-53">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-54">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned the instance identifier of the Device.LocalAgent.Controller. object that represents the Controller simulated by the traffic generator.</p></li>
<li><p>Set the Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode to an arbitrary value that is not “TestValue54”.</p></li>
<li><p>Ensure that the Device.LocalAgent.Controller.&lt;instance identifier&gt;.USPNotifRetryMinimumWaitInterval is set to its default value (5).</p></li>
</ol>
<h4 id="test-procedure-53">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify54&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {

    set {
      allow_partial: false
      update_objs {

        obj_path: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.&quot;



        param_settings {
          param: &quot;ProvisioningCode&quot;
          value: &quot;TestValue54&quot;
          required: true}

        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Do not send a NotifyResp to the EUT.</p></li>
<li><p>Wait 10 seconds to allow the EUT to send a Notify message.</p></li>
<li><p>Do not send a NotifyResp to the EUT.</p></li>
<li><p>Wait 20 seconds to allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
</ol>
<h4 id="test-metrics-53">Test Metrics</h4>
<ol type="1">
<li><p>The EUT retries the Notify message.</p></li>
<li><p>The first retry occurs within 5-10 seconds. The second retry occurs within 10-20 seconds.</p></li>
</ol>
<h3 id="subscription-expiration-using-value-change">1.55 Subscription Expiration using Value Change</h3>
<h4 id="purpose-55">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent removes a Subscription from the Subscription table after its TimeToLive has expired.</p>
<h4 id="functionality-tag-54">Functionality Tag</h4>
<p>Conditionally Mandatory (Supports TimeToLive in Device.LocalAgent.Subscription.)</p>
<h4 id="test-setup-55">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned the instance identifier of the Device.LocalAgent.Controller. object that represents the Controller simulated by the traffic generator.</p></li>
<li><p>Set the Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode to an arbitrary value that is not “TestValue55”.</p></li>
</ol>
<h4 id="test-procedure-54">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify55&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}

          {
            param: &quot;TimeToLive&quot;
            value: &quot;20&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.&quot;
        param_settings {
          param: &quot;ProvisioningCode&quot;
          value: &quot;TestValue55&quot;
          required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
<li><p>Wait 20 seconds.</p></li>
<li><p>Send a GetInstances message to the EUT with the following structure:</p>
<pre><code>header {
      msg_id: &quot;&lt;msg_id&gt;&quot;
      msg_type: GET_INSTANCES
    }
body {
      request {
        get_instances {
          obj_paths: &quot;Device.LocalAgent.Subscription.&quot;
        }
      }
    }</code></pre></li>
<li><p>Allow the EUT to send a GetInstancesResponse.</p></li>
<li><p>Repeat step 3 with a value of “TestValue55-2”.</p></li>
<li><p>Wait 10 seconds.</p></li>
</ol>
<h4 id="test-metrics-54">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends a Notify message after step 3.</p></li>
<li><p>The GetInstancesReponse does not list the instance of the Subscription object created in step 1.</p></li>
<li><p>The EUT does not send a Notify message after step 9.</p></li>
</ol>
<h3 id="notification-retry-expiration-using-value-change">1.56 Notification Retry Expiration using Value Change</h3>
<h4 id="purpose-56">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will cease attempts to retry Notify messages after an amount of time specified in value of the NotifExpiration parameter in the Subscription object has passed.</p>
<h4 id="functionality-tag-55">Functionality Tag</h4>
<p>Conditional Mandatory (supports Subscription.{i}.NotifExpiration parameter).</p>
<h4 id="test-setup-56">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that the traffic generator has learned the instance identifier of the Device.LocalAgent.Controller. object that represents the Controller simulated by the traffic generator.</p></li>
<li><p>Set the Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode to an arbitrary value that is not “TestValue56”.</p></li>
<li><p>Ensure that the Device.LocalAgent.Controller.&lt;instance identifier&gt;.USPNotifRetryMinimumWaitInterval is set to its default value (5).</p></li>
</ol>
<h4 id="test-procedure-55">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify56&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}

          {
            param: &quot;NotifExpiration&quot;
            value: &quot;20&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send a Set message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: SET
}

body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.&quot;
        param_settings {
          param: &quot;ProvisioningCode&quot;
          value: &quot;TestValue56&quot;
          required: true}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Do not send a NotifyResp to the EUT.</p></li>
<li><p>Wait 10 seconds to allow the EUT to send a Notify message.</p></li>
<li><p>Do not send a NotifyResp to the EUT.</p></li>
<li><p>Wait 20 seconds to allow the EUT to send a Notify message.</p></li>
<li><p>Do not send a Notify Response to the EUT.</p></li>
<li><p>Wait 30 seconds.</p></li>
</ol>
<h4 id="test-metrics-55">Test Metrics</h4>
<ol type="1">
<li><p>The EUT retries the Notify message within 20 seconds.</p></li>
<li><p>The EUT does not retry the Notify message after 20 seconds.</p></li>
</ol>
<h3 id="objectcreation-notification">1.57 ObjectCreation Notification</h3>
<h4 id="purpose-57">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will send a Notify message to the when the is Subscribed to the ObjectCreation event.</p>
<h4 id="functionality-tag-56">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-57">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-56">Test Procedure</h4>
<ol type="1">
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify57&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ObjectCreation&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Subscription.&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send an Add message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify57-2&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ValueChange&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Controller.&lt;instance identifier&gt;.ProvisioningCode&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
</ol>
<h4 id="test-metrics-56">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends a successful AddResp.</p></li>
<li><p>The EUT sends a Notify message with a subscription_id field equal to “Notify57”, and an event element of obj_creation with a obj_path of “Device.LocalAgent.Subscription.&lt;instance number&gt;.” and a map element of unique_keys with values of “ID,”Notify57-2" and “Recipient, Device.LocalAgent.Controller.&lt;instance identifier&gt;.”.</p></li>
</ol>
<h3 id="objectdeletion-notification">1.58 ObjectDeletion Notification</h3>
<h4 id="purpose-58">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will send a Notify message to the when the is Subscribed to the ObjectDeletion event.</p>
<h4 id="functionality-tag-57">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-58">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure that at least one Subscription object exists on the EUT, and the unique keys and their values are known by the traffic generator.</p></li>
</ol>
<h4 id="test-procedure-57">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: ADD
}

body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: &quot;Device.LocalAgent.Subscription.&quot;
        param_settings {

          {
            param: &quot;Enable&quot;
            value: &quot;true&quot;}
          {
            param: &quot;ID&quot;
            value: &quot;notify58&quot;}
          {
            param: &quot;NotifType&quot;
            value: &quot;ObjectDeletion&quot;}
          {
            param: &quot;ReferenceList&quot;
            value: &quot;Device.LocalAgent.Subscription.&quot;
            required: true}

          {
            param: &quot;NotifRetry&quot;
            value: &quot;True&quot;}
        }
      }
    }
  }
}</code></pre>
<ol start="2" type="1">
<li><p>Allow the EUT to send an AddResp</p></li>
<li><p>Send a Delete message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: DELETE
}

body {
  request {

    delete {
      allow_partial: false
      obj_paths {
        &quot;Device.LocalAgent.Subscription.&lt;instance identifier from test setup 2&gt;.&quot;
        }
      }
    }
  }</code></pre></li>
<li><p>Allow the EUT to send a DeleteResp</p></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
</ol>
<h4 id="test-metrics-57">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends a successful AddResp.</p></li>
<li><p>The EUT sends a Notify message with a subscription_id field equal to “Notify58”, and an event element of obj_deletion with a obj_path of “Device.LocalAgent.Subscription.&lt;instance number&gt;.”</p></li>
</ol>
<h3 id="event-notification-using-periodic">1.59 Event Notification using Periodic!</h3>
<h4 id="purpose-59">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will send a Notify message to the when the is Subscribed to an Event notification that correlates with an event defined in its supported data model.</p>
<h4 id="functionality-tag-58">Functionality Tag</h4>
<p>Conditional Mandatory (supports Controller:1 profile and Device.LocalAgent.Controller.{i}.PeriodicNotifTime parameter)</p>
<h3 id="test-setup-59">Test Setup</h3>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h3 id="test-procedure-58">Test Procedure</h3>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            allow_partial: true
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.&lt;Controller ID&gt;.
                    param_settings: [
                        {
                            param: PeriodicNotifInterval
                            value: 60
                        },
                        {
                            param: PeriodicNotifTime
                            value: &quot;2019-01-01T00:00:00Z&quot;
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
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
                            value: &quot;sub-103&quot;
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
}</code></pre>
<ol start="3" type="1">
<li>Wait for a Notification from the EUT.</li>
<li>Wait for a Notification from the EUT.</li>
</ol>
<h3 id="test-metrics-58">Test Metrics</h3>
<ol type="1">
<li>The EUT sends a SetResponse with an oper_success after step 1.</li>
<li>The EUT sends an AddResponse with an oper_success after step 2.</li>
<li>The EUT sends a Notification with an Periodic! event element.</li>
<li>A second Periodic event is sent by the EUT 60 (+/- 4) seconds after the first.</li>
</ol>
<h3 id="onboardrequest-notification">1.60 OnBoardRequest Notification</h3>
<h4 id="purpose-60">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will send a Notify message to the when the initiates a SendOnBoardRequest() operation.</p>
<h4 id="functionality-tag-59">Functionality Tag</h4>
<p>Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.SendOnBoardRequest() command)</p>
<h4 id="test-setup-60">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-59">Test Procedure</h4>
<ol type="1">
<li><p>Send an Operate message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: OPERATE
}

body {
  request {
    operate {
      command: &quot;Device.LocalAgent.Controller.&lt;instance identifier of traffic generator&gt;.SendOnBoardRequest()&quot;
      command_key: &quot;test60&quot;
      send_resp: false
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to send a Notify message.</p></li>
<li><p>Send a NotifyResp to the EUT.</p></li>
</ol>
<h4 id="test-metrics-59">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message with (at minimum) a subscription_id field equal to “Notify60”, and an event element of on_board_req with a obj_path of “Device.LocalAgent.Controller.&lt;instance identifier of traffic generator&gt;.”, and appropriate values for the oui, product_class, serial_number, and agent_supported_protocol_versions fields.</li>
</ol>
<h3 id="operate-message-using-reboot-with-send_resp-true">1.61 Operate message using Reboot() with send_resp true</h3>
<h4 id="purpose-61">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process an Operate message using the Reboot() operation as a trigger when send_resp is true.</p>
<h4 id="functionality-tag-60">Functionality Tag</h4>
<p>Conditional Mandatory (supports Reboot:1 or any other command)</p>
<h4 id="test-setup-61">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-60">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: OPERATE
}

body {
  request {
    operate {
      command: &quot;Device.Reboot()&quot;
      command_key: &quot;test61&quot;
      send_resp: true
    }
  }
}</code></pre>
<ol start="2" type="1">
<li><p>Allow the EUT to send an OperateResp</p></li>
<li><p>Allow the EUT to reboot.</p></li>
</ol>
<h4 id="test-metrics-60">Test Metrics</h4>
<ol type="1">
<li><p>The EUT sends an OperateResp message with a single operation_results element containing an executed_command of “Device.Reboot()” and a req_output_args element containing an empty output_args element.</p></li>
<li><p>The EUT reboots and resumes connectivity with the test system.</p></li>
</ol>
<h3 id="operate-message-using-reboot-with-send_resp-false">1.62 Operate message using Reboot() with send_resp false</h3>
<h4 id="purpose-62">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process an Operate message using the Reboot() operation as a trigger when send_resp is false.</p>
<h4 id="functionality-tag-61">Functionality Tag</h4>
<p>Conditional Mandatory (supports Reboot:1 or any other command)</p>
<h4 id="test-setup-62">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-61">Test Procedure</h4>
<ol type="1">
<li><p>Send an Operate message to the EUT with the following structure:</p>
<pre><code>header {
  msg_id: &quot;&lt;msg_id&gt;&quot;
  msg_type: OPERATE
}

body {
  request {
    operate {
      command: &quot;Device.Reboot()&quot;
      command_key: &quot;test62&quot;
      send_resp: false
    }
  }
}</code></pre></li>
<li><p>Allow the EUT to reboot.</p></li>
</ol>
<h4 id="test-metrics-61">Test Metrics</h4>
<ol type="1">
<li>The EUT reboots and resumes connectivity with the test system.</li>
</ol>
<h3 id="operate-message-using-input-arguments">1.63 Operate message using input arguments</h3>
<h4 id="purpose-63">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process an Operate message with input arguments.</p>
<h4 id="functionality-tag-62">Functionality Tag</h4>
<p>Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.ScheduleTimer() command or at least one operation that contains input arguments)</p>
<h4 id="test-setup-63">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that a Subscription object exists on the EUT, subscribed to the Timer! event.</li>
</ol>
<h4 id="test-procedure-62">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: &quot;Device.LocalAgent.Controller.&lt;Controller instance&gt;.ScheduleTimer()&quot;
            command_key: &quot;test63&quot;
            send_resp: true
            input_args {
                &quot;DelaySeconds&quot;: &quot;30&quot;
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Allow the EUT to send a Timer! event.</li>
</ol>
<h4 id="test-metrics-62">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an OperateResp message with a single operation_results element containing an executed_command of “Device.LocalAgent.Controller.<Controller instance>.ScheduleTimer()” and a req_output_args element containing an empty output_args element.</li>
<li>The EUT sends a Notify message containing a Event message with obj_path of “Device.LocalAgent.Controller.<Controller instance>.ScheduleTimer()”.</li>
</ol>
<h3 id="asynchronous-operation-with-send_resp-true">1.64 Asynchronous operation with send_resp true</h3>
<h4 id="purpose-64">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process an Operate message where the operation is asynchronous and send_resp is set to true.</p>
<h4 id="functionality-tag-63">Functionality Tag</h4>
<p>Conditional Mandatory (supports the TraceRoute:1 profile or at least one other asynchronous operation)</p>
<h4 id="test-setup-64">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that a Subscription object exists on the EUT that is subscribed to the OperationComplete notification for TraceRoute().</li>
</ol>
<h4 id="test-procedure-63">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: &quot;Device.IP.Diagnostics.TraceRoute()&quot;
            command_key: &quot;test64&quot;
            send_resp: &quot;true&quot;
            input_args {
                &quot;Host&quot;: &lt;remote host IP&gt;
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Allow the EUT to send a OperateResponse message with a req_object_path which matches the command sent in the Operate message</li>
<li>Allow the EUT to send a Notify message with an inner OperationComplete message with a obj_path element matching the command sent in the OperateMessage.</li>
</ol>
<h4 id="test-metrics-63">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an OperateResp message with a single operation_results element containing an executed_command of “Device.IP.Diagnostics.TraceRoute()” and a req_output_args element containing an empty output_args element.</li>
<li>The EUT sends a Notify message containing a OperationComplete message with obj_path of “Device.IP.Diagnostics.TraceRoute()”.</li>
</ol>
<h3 id="asynchronous-operation-with-send_resp-false">1.65 Asynchronous operation with send_resp false</h3>
<h4 id="purpose-65">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process an Operate message where the operation is asynchronous and send_resp is set to false.</p>
<h4 id="functionality-tag-64">Functionality Tag</h4>
<p>Conditional Mandatory (supports the TraceRoute:1 profile or at least one other asynchronous operation)</p>
<h4 id="test-setup-65">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that a Subscription object exists on the EUT that is subscribed to the OperationComplete notification for TraceRoute().</li>
</ol>
<h4 id="test-procedure-64">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}

body {
    request {
        operate {
            command: &quot;Device.IP.Diagnostics.TraceRoute()&quot;
            command_key: &quot;test65&quot;
            send_resp: &quot;false&quot;
            input_args {
                &quot;Host&quot;: &lt;remote host IP&gt;
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Allow the EUT to send a Notify message with an inner OperationComplete message with a obj_path element matching the command sent in the OperateMessage.</li>
</ol>
<h4 id="test-metrics-64">Test Metrics</h4>
<ol type="1">
<li>The EUT does not send an OperateResp message.</li>
<li>The EUT sends a Notify message containing a OperationComplete message with obj_path of “Device.IP.Diagnostics.TraceRoute()”.</li>
</ol>
<h3 id="getinstances-using-a-single-object-first_level_only-true">1.66 GetInstances using a single object, first_level_only true</h3>
<h4 id="purpose-66">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message on a single object when first_level_only is true.</p>
<h4 id="functionality-tag-65">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-66">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-65">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: &quot;Device.LocalAgent.Controller.&quot;
            first_level_only: &quot;true&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-65">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp with one req_path_results elements containing a requested_path of Device.LocalAgent.Controller. and at least one cur_insts element.</li>
<li>All instantiated_obj_path elements in the GetInstancesResp only contain Device.LocalAgent. instances.</li>
</ol>
<h3 id="getinstances-using-a-single-object-first_level_only-false">1.67 GetInstances using a single object, first_level_only false</h3>
<h4 id="purpose-67">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message on a single object when first_level_only is false.</p>
<h4 id="functionality-tag-66">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-67">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-66">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: &quot;Device.LocalAgent.Controller.&quot;
            first_level_only: &quot;false&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-66">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp with one req_path_results elements containing a requested_path of Device.LocalAgent.Controller., and lists all instances of the Controller object, plus any instances of all sub-objects.</li>
</ol>
<h3 id="getinstances-with-multiple-objects">1.68 GetInstances with multiple objects</h3>
<h4 id="purpose-68">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message on multiple objects.</p>
<h4 id="functionality-tag-67">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-68">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-67">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: [
                &quot;Device.LocalAgent.Controller.&quot;
                &quot;Device.LocalAgent.MTP.&quot;
            ]
            first_level_only: &quot;true&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-67">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp with two req_path_results elements containing a requested_path of Device.LocalAgent.Controller. and Device.LocalAgent.MTP.</li>
<li>Both req_path_results and each having at least one cur_insts element.</li>
</ol>
<h3 id="getinstances-with-root-object">1.69 GetInstances with root object</h3>
<h4 id="purpose-69">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message on the root object.</p>
<h4 id="functionality-tag-68">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-69">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-68">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: &quot;Device.&quot;
            first_level_only: &quot;false&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-68">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp that lists all instances of all objects in its instantiated data model.</li>
</ol>
<h3 id="getinstances-with-wildcard-search-path">1.70 GetInstances with wildcard search path</h3>
<h4 id="purpose-70">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message when a wildcard search path is used.</p>
<h4 id="functionality-tag-69">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-70">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-69">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: &quot;Device.LocalAgent.Controller.*.MTP.&quot;
            first_level_only: &quot;true&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-69">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp with at least one req_path_results element containing a Device.LocalAgent.Controller.{i}.MTP. instance.</li>
</ol>
<h3 id="getinstances-with-search-expression-search-path">1.71 GetInstances with search expression search path</h3>
<h4 id="purpose-71">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetInstances message when a search expression search path is used.</p>
<h4 id="functionality-tag-70">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-71">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure there is at least one BootParameter for the instance used for testing.</li>
<li>Ensure the Alias of the used for testing is known.</li>
</ol>
<h4 id="test-procedure-70">Test Procedure</h4>
<ol type="1">
<li>Send a GetInstances message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_INSTANCES
}

body {
    request {
        get_instances {
            obj_paths: &quot;Device.LocalAgent.Controller.[Alias==&quot;&lt;Controller alias&gt;&quot;].BootParameter.&quot;
            first_level_only: &quot;false&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-70">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetInstancesResp with at least one req_path_results element containing a Device.LocalAgent.Controller.<Controller instance>.BootParameter. instance.</li>
</ol>
<h3 id="getsupporteddm-using-a-single-object-first_level_only-false-all-options">1.72 GetSupportedDM using a single object, first_level_only false, all options</h3>
<h4 id="purpose-72">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetSupportedDM message using a single object, when first_level_only is false and all options are true.</p>
<h4 id="functionality-tag-71">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-72">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-71">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: &quot;Device.LocalAgent.&quot;
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}</code></pre>
<h4 id="test-metrics-71">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResp.</li>
<li>Every req_obj_results element contains all parameters, events, and commands below the specified partial path, plus the supported data model information of all sub-objects.</li>
</ol>
<h3 id="getsupporteddm-using-a-single-object-first_level_only-true-all-options">1.73 GetSupportedDM using a single object, first_level_only true, all options</h3>
<h4 id="purpose-73">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetSupportedDM message using a single object, when first_level_only is true and all options are true.</p>
<h4 id="functionality-tag-72">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-73">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-72">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: &quot;Device.LocalAgent.&quot;
            first_level_only: true
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}</code></pre>
<h4 id="test-metrics-72">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResp.</li>
<li>Every req_obj_results element contains parameters, events, and commands of only the specified object.</li>
</ol>
<h3 id="getsupporteddm-using-a-single-object-first_level_only-true-no-options">1.74 GetSupportedDM using a single object, first_level_only true, no options</h3>
<h4 id="purpose-74">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetSupportedDM message using a single object, when first_level_only is true and all options are false.</p>
<h4 id="functionality-tag-73">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-74">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-73">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: &quot;Device.LocalAgent.&quot;
            first_level_only: true
            return_commands: false
            return_events: false
            return_params: false
        }
    }
}</code></pre>
<h4 id="test-metrics-73">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResp.</li>
<li>Every req_obj_results element doesn’t contain any parameters, events, or params.</li>
</ol>
<h3 id="getsupporteddm-using-multiple-objects-first_level_only-true-all-options">1.75 GetSupportedDM using multiple objects, first_level_only true, all options</h3>
<h4 id="purpose-75">Purpose</h4>
<p>The purpose of this test is to ensure that the Agent will correctly process a GetSupportedDM message using multiple objects, when first_level_only is true and all options are true.</p>
<h4 id="functionality-tag-74">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-75">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-74">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths: [
                &quot;Device.LocalAgent.Controller.&quot;
                &quot;Device.LocalAgent.MTP.&quot;
            ]
            first_level_only: true
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}</code></pre>
<h4 id="test-metrics-74">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResp.</li>
<li>Every req_obj_results element contains parameters, events, and commands of only the specified objects.</li>
</ol>
<h3 id="getsupporteddm-on-root-object-all-options">1.76 GetSupportedDM on root object, all options</h3>
<h4 id="purpose-76">Purpose</h4>
<p>The purpose of this test is to ensure the Agent will correctly process a GetSupportedDM message when the requested path is the root of the data model.</p>
<h4 id="functionality-tag-75">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-76">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-75">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths:&quot;Device.&quot;
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}</code></pre>
<h4 id="test-metrics-75">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResp message with one or more req__results specifying its entire supported data model, listing commands, parameters, and events.</li>
</ol>
<h3 id="getsupporteddm-on-unsupported-object">1.77 GetSupportedDM on unsupported object</h3>
<h4 id="procedure">Procedure</h4>
<p>The purpose of this test is to ensure the Agent will correctly process a GetSupportedDM message when the requested path is an unsupported object.</p>
<h4 id="functionality-tag-76">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-77">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-76">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}

body {
    request {
        get_supported_dm {
            obj_paths:&quot;Device.LocalAgent.UnsupportedObject&quot;
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}</code></pre>
<h4 id="test-metrics-76">Test Metrics</h4>
<ol type="1">
<li>The EUT returns a GetSupportedDMResp with a single req_obj_results with a err_code of 7026.</li>
</ol>
<h2 id="authentication-and-access-control-test-cases">2 Authentication and Access Control Test Cases</h2>
<h3 id="agent-does-not-accept-messages-from-its-own-endpoint-id">2.1 Agent does not accept messages from its own Endpoint ID</h3>
<h4 id="purpose-77">Purpose</h4>
<p>The purpose of this test is to ensure the EUT does not respond to a USP message when the from_id is the EUT’s endpoint ID.</p>
<h4 id="functionality-tag-77">Functionality Tag</h4>
<p>Mandatory</p>
<h4 id="test-setup-78">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-steps">Test Steps</h4>
<ol type="1">
<li>Send a message to the EUT with the following record structure:</li>
</ol>
<pre><code>Record {
    to_id: &quot;&lt;EUT_ID&gt;&quot;
    from_id: &quot;&lt;EUT_ID&gt;&quot;

    record_type: {
        ...
    }
}</code></pre>
<h4 id="test-metrics-77">Test Metrics</h4>
<ol type="1">
<li>The EUT does not respond to the message.</li>
</ol>
<h3 id="agent-rejects-messages-that-do-not-contain-its-to_id-in-the-usp-record">2.2 Agent rejects messages that do not contain its to_id in the USP Record</h3>
<h4 id="purpose-78">Purpose</h4>
<p>The purpose of this test is to ensure the EUT does not respond to a USP message when the USP record doesn’t contain a the EUT’s to_id.</p>
<h4 id="functionality-tags">Functionality Tags</h4>
<p>Mandatory</p>
<h4 id="test-setup-79">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-steps-1">Test Steps</h4>
<ol type="1">
<li>Send a message to the EUT with the following record structure:</li>
</ol>
<pre><code>Record {
    to_id: &quot;&lt;invalid ID&gt;&quot;
    from_id: &quot;&lt;EUT_ID&gt;&quot;

    record_type: {
        ...
    }
}</code></pre>
<h4 id="test-metrics-78">Test Metrics</h4>
<ol type="1">
<li>The EUT does not respond to the USP message.</li>
</ol>
<h3 id="agent-does-not-process-messages-without-s-certificate-information">2.3 Agent does not process messages without ’s certificate information</h3>
<h4 id="purpose-79">Purpose</h4>
<p>The purpose of this test is to ensure that the EUT doesn’t process a USP message when the EUT does not possess the Controller’s certificate information.</p>
<h4 id="functionality-tags-1">Functionality Tags</h4>
<p>Conditional Mandatory (UntrustedRole is not support, or can be disabled)</p>
<h4 id="test-setup-80">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Simulate a second Controller whose credentials are signed by an untrusted certificate authority.</li>
<li>Ensure that the UntrustedRole feature is either unsupported or disabled in the EUT.</li>
</ol>
<h4 id="test-procedure-77">Test Procedure</h4>
<ol type="1">
<li>Send a Get message from the second simulated Controller to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}

body {
    request {
        get {
            param_paths: &quot;Device.LocalAgent.&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-79">Test Metrics</h4>
<ol type="1">
<li>Ensure the EUT does not respond to the Get message.</li>
</ol>
<h3 id="agent-rejects-messages-from-endpoint-ids-that-are-not-in-subjectaltname">2.4 Agent rejects messages from Endpoint IDs that are not in subjectAltName</h3>
<h4 id="purpose-80">Purpose</h4>
<p>The purpose of this test is to ensure that the EUT rejects a message from an Endpoint ID that doesn’t match the subjectAltName in the provided certificate.</p>
<h4 id="functionality-tags-2">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-81">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-78">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT using a certificate with a subjectAltName that does not match the Controller’s Endpoint ID.</li>
</ol>
<h4 id="test-metrics-80">Test Metrics</h4>
<ol type="1">
<li>The EUT does not respond to the Get message.</li>
</ol>
<h3 id="agent-use-of-self-signed-certificates">2.5 Agent use of self-signed certificates</h3>
<h4 id="purpose-81">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can handle self-signed certificates.</p>
<h4 id="functionality-tags-3">Functionality Tags</h4>
<p>Conditional Mandatory (supports Self-Signed Certificates)</p>
<h4 id="test-setup-82">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the is configured to use a self-signed certificate and Endpoint ID that the EUT has not seen.</li>
</ol>
<h4 id="test-procedure-79">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT using a self-signed cert with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.LocalAgent.&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-81">Test Metrics</h4>
<ol type="1">
<li>The EUT responds to the Get with a GetResponse containing a Device.LocalAgent.ControllerTrust.{i}.Alias parameter.</li>
</ol>
<h3 id="connecting-without-absolute-time">2.6 Connecting without absolute time</h3>
<h4 id="purpose-82">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can communicate with a Controller if it cannot obtain an absolute time.</p>
<h4 id="functionality-tags-4">Functionality Tags</h4>
<p>Mandatory</p>
<h4 id="test-setup-83">Test Setup</h4>
<ol type="1">
<li>The EUT is booted into a test environment where it cannot resolve absolute time.</li>
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller is configured to use an expired certificate.</li>
</ol>
<h4 id="test-procedure-80">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header{
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.LocalAgent.&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-82">Test Metrics</h4>
<ol type="1">
<li>The EUT responds to the Get message with a GetReponse, ignoring the expired dates on the certificate.</li>
</ol>
<h3 id="agent-ignores-unsigned-or-invalid-record-signatures">2.7 Agent ignores unsigned or invalid Record signatures</h3>
<h4 id="purpose-83">Purpose</h4>
<p>The purpose of this test is to ensure the EUT will ignore a USP record when the signature field is invalid.</p>
<h4 id="functionality-tags-5">Functionality Tags</h4>
<p>Mandatory</p>
<h4 id="test-setup-84">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-81">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with an invalid signature value.</li>
</ol>
<h4 id="test-metrics-83">Test Metrics</h4>
<ol type="1">
<li>The EUT does not respond to the Get message.</li>
</ol>
<h3 id="agent-ignores-invalid-tls-certificate">2.8 Agent ignores invalid TLS certificate</h3>
<h4 id="purpose-84">Purpose</h4>
<p>The purpose of this test is to ensure the EUT rejects TLS connections when an Endpoint’s TLS certificate is invalid.</p>
<h4 id="functionality-tags-6">Functionality Tags</h4>
<p>Mandatory</p>
<h4 id="test-setup-85">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that the EUT has obtained an absolute time reference.</li>
</ol>
<h4 id="test-procedure-82">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with an expire TLS certificate.</li>
</ol>
<h4 id="test-metrics-84">Test Metrics</h4>
<ol type="1">
<li>The EUT doesn’t respond to the Get message.</li>
</ol>
<h3 id="use-of-the-untrusted-role">2.9 Use of the Untrusted role</h3>
<h4 id="purpose-85">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly assigns new a Role of Untrusted.</p>
<h4 id="functionality-tags-7">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile)</p>
<h4 id="test-setup-86">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-83">Test Procedure</h4>
<ol type="1">
<li>Using a secondary Controller, connect to the EUT and send an Get message.</li>
<li>Using the primary trusted Controller send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}

body {
    request {
        get {
            param_paths: &quot;Device.LocalAgent.Controller.&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-85">Test Metrics</h4>
<ol type="1">
<li>Ensure the <code>Device.LocalAgent.Controller.&lt;secondary Controller instance&gt;.AssignedRole</code> matches the value of <code>Device.LocalAgent.ControllerTrust.UntrustedRole</code>.</li>
</ol>
<h3 id="adding-a-role">2.10 Adding a Role</h3>
<h4 id="purpose-86">Purpose</h4>
<p>The purpose of this test is to ensure that the Add message can be used to add new Roles to the EUT’s data model.</p>
<h4 id="functionality-tags-8">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile)</p>
<h4 id="test-setup-87">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-84">Test Procedure</h4>
<ol type="1">
<li>Send a Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}

body {
    request {
        add {
            allow_partial: false
            create_objs {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&quot;
                param_settings: [{
                    param: &quot;Enable&quot;
                    value: &quot;true&quot;
                }, {
                    param: &quot;Name&quot;
                    value: &quot;Trusted&quot;
                }]
            }
        }
    }
}
</code></pre>
<h4 id="test-metrics-86">Test Metrics</h4>
<ol type="1">
<li>The EUT correctly sent an AddResponse with a new Role instance.</li>
</ol>
<h3 id="permissions---object-creation-allowed">2.11 Permissions - Object Creation Allowed</h3>
<h4 id="purpose-87">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to allow the creation of a particular object.</p>
<h4 id="functionality-tags-9">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-88">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-procedure-85">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&quot;
                    },
                    {
                        param: &quot;Obj&quot;
                        value: &quot;rw--&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.Subscription.&quot;
            }
        }
    }
}</code></pre>
<h4 id="test-metrics-87">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.Subscription. object in step 2.</li>
</ol>
<h3 id="permissions---object-creation-not-allowed">2.12 Permissions - Object Creation Not Allowed</h3>
<h4 id="purpose-88">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to restrict the creation of a particular object.</p>
<h4 id="functionality-tags-10">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-89">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-procedure-86">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&quot;
                    },
                    {
                        param: &quot;Obj&quot;
                        value: &quot;r---&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.Subscription.&quot;
            }
        }
    }
}</code></pre>
<h4 id="test-metrics-88">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an Error containing type 7006 - Permission Denied.</li>
</ol>
<h3 id="permissions---object-deletion-allowed">2.13 Permissions - Object Deletion Allowed</h3>
<h4 id="purpose-89">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to allow the deletion of a particular object.</p>
<h4 id="functionality-tags-11">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-90">Test Setup</h4>
<ol type="1">
<li><p>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</p></li>
<li><p>Ensure the Controller used for testing has an assigned Role that is writable.</p></li>
<li><p>Ensure there is one or more Subscription object that can be deleted. #### Test Procedure</p></li>
<li><p>Send an Add message to the EUT with the following structure:</p></li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&quot;
                    },
                    {
                        param: &quot;InstantiatedObj&quot;
                        value: &quot;rw--&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Delete message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: DELETE
}
body {
    request {
        delete {
            allow_partial: false
            obj_paths: &quot;Device.LocalAgent.Subscription.&lt;subscription to delete&gt;&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-89">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an DeleteResponse with a oper_success element containing the Device.LocalAgent.Subscription. object in step 2.</li>
</ol>
<h3 id="permissions---object-deletion-not-allowed">2.14 Permissions - Object Deletion Not Allowed</h3>
<h4 id="purpose-90">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to restrict the deletion of a particular object.</p>
<h4 id="functionality-tags-12">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-91">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
<li>Ensure there is one or more Subscription object that can be deleted.</li>
</ol>
<h4 id="test-procedure-87">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&quot;
                    },
                    {
                        param: &quot;InstantiatedObj&quot;
                        value: &quot;r---&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Delete message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: DELETE
}
body {
    request {
        delete {
            allow_partial: false
            obj_paths: &quot;Device.LocalAgent.Subscription.&lt;subscription to delete&gt;&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-90">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an Error containing type 7006 - Permission Denied.</li>
</ol>
<h3 id="permissions---parameter-update-allowed">2.15 Permissions - Parameter Update Allowed</h3>
<h4 id="purpose-91">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to allow the update of a particular object.</p>
<h4 id="functionality-tags-13">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-92">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
<li>Ensure there is one or more Subscription object that can be edited.</li>
</ol>
<h4 id="test-procedure-88">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&lt;instance that can be edited&gt;.&quot;
                    },
                    {
                        param: &quot;Param&quot;
                        value: &quot;rw--&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            allow_partial: false
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Subscription.&lt;instance that can be edited&gt;.
                    param_settings: [
                        {
                            param: Alias
                            value: &lt;new value&gt;
                            required: true
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<h4 id="test-metrics-91">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends a SetResponse with a oper_success element containing Device.LocalAgent.Subscription.{i}.Alias in step 2.</li>
</ol>
<h3 id="permissions---parameter-update-not-allowed">2.16 Permissions - Parameter Update Not Allowed</h3>
<h4 id="purpose-92">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to restrict the update of a particular object.</p>
<h4 id="functionality-tags-14">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-93">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
<li>Ensure there is one or more Subscription object that can be edited.</li>
</ol>
<h4 id="test-steps-2">Test Steps</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Subscription.&lt;instance that can be edited&gt;.&quot;
                    },
                    {
                        param: &quot;Param&quot;
                        value: &quot;r---&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            allow_partial: false
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Subscription.&lt;instance that can be edited&gt;.
                    param_settings: [
                        {
                            param: Alias
                            value: &lt;new value&gt;
                            required: true
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<h4 id="test-metrics-92">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an Error containing type 7006 - Permission Denied.</li>
</ol>
<h3 id="permissions---operation-allowed">2.17 Permissions - Operation Allowed</h3>
<h4 id="purpose-93">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to allow the invocation of commands on a particular object.</p>
<h4 id="functionality-tags-15">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-94">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-steps-3">Test Steps</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.Reboot()&quot;
                    },
                    {
                        param: &quot;CommandEvent&quot;
                        value: &quot;r-x-&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.Reboot()
        }
    }
}</code></pre>
<h4 id="test-metrics-93">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an OperateResponse with a req_output_args element in step 2.</li>
</ol>
<h3 id="permissions---operation-not-allowed">2.18 Permissions - Operation Not Allowed</h3>
<h4 id="purpose-94">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to restrict the invocation of commands on a particular object.</p>
<h4 id="functionality-tags-16">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-95">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-steps-4">Test Steps</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.Reboot()&quot;
                    },
                    {
                        param: &quot;CommandEvent&quot;
                        value: &quot;r---&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.Reboot()
        }
    }
}</code></pre>
<h4 id="test-metrics-94">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with a oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an Error containing type 7006 - Permission Denied.</li>
</ol>
<h3 id="permissions---value-change-notification-allowed-on-parameter">2.19 Permissions - Value Change Notification Allowed on Parameter</h3>
<h4 id="purpose-95">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to allow a Controller to subscribe to the ValueChange notification of a particular parameter.</p>
<h4 id="functionality-tags-17">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-96">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-steps-5">Test Steps</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval&quot;
                    },
                    {
                        param: &quot;CommandEvent&quot;
                        value: &quot;rw-n&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.Subscription.&quot;
                param_settings: [
                    {
                        param: Enable
                        value: true
                    },
                    {
                        param: NotifType
                        value: ValueChange
                    },
                    {
                        param: ReferenceList
                        value: Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval
                    }
                ]
            }
        }
    }
]</code></pre>
<ol start="3" type="1">
<li><p>Send a Set message to the EUT, setting <code>Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval</code> to a new value.</p></li>
<li><p>Wait for a Notification from the EUT.</p></li>
</ol>
<h4 id="test-metrics-95">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with an oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an AddResponse with an oper_success element containing a new Device.LocalAgent.Subscription. object in step 2.</li>
<li>The EUT sends a SetResponse with an oper_success element with the path <code>Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval</code>.</li>
<li>The EUT sends a Notify message with a value_change element pointing to <code>Device.LocalAgent.Controller.&lt;Controller instance&gt;.PeriodicNotifInterval</code>.</li>
</ol>
<h3 id="permissions---value-change-notification-not-allowed-on-parameter">2.20 Permissions - Value Change Notification Not Allowed on Parameter</h3>
<h4 id="purpose-96">Purpose</h4>
<p>The purpose of this test is to ensure the EUT adheres to permissions set to restrict a from subscribing to the ValueChange notification of a particular parameter.</p>
<h4 id="functionality-tags-18">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-97">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
</ol>
<h4 id="test-steps-6">Test Steps</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.ControllerTrust.Role.&lt;Controller&#39;s Role instance&gt;.Permission.&quot;
                param_settings: [
                    {
                        param: &quot;Enable&quot;
                        value: true
                    },
                    {
                        param: &quot;Target&quot;
                        value: &quot;Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval&quot;
                    },
                    {
                        param: &quot;CommandEvent&quot;
                        value: &quot;r---&quot;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: {
                obj_path: &quot;Device.LocalAgent.Subscription.&quot;
                param_settings: [
                    {
                        param: Enable
                        value: true
                    },
                    {
                        param: NotifType
                        value: ValueChange
                    },
                    {
                        param: ReferenceList
                        value: Device.LocalAgent.Controller.&lt;Controller instance id&gt;.PeriodicNotifInterval
                    }
                ]
            }
        }
    }
]</code></pre>
<h4 id="test-metrics-96">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse with an oper_success element containing a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in step 1.</li>
<li>The EUT sends an Error containing type 7006 - Permission Denied.</li>
</ol>
<h3 id="permissions---overlapping-permissions">2.21 Permissions - Overlapping Permissions</h3>
<h4 id="purpose-97">Purpose</h4>
<p>The purpose of this test is to ensure the EUT allows for the creation of Permission instances, and when Permissions overlap the EUT behaves correctly.</p>
<h4 id="functionality-tags-19">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-98">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
<li>Ensure there is at least one BootParameter configured.</li>
</ol>
<h4 id="test-procedure-89">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: [
            {
                obj_path: Device.LocalAgent.ControllerTrust.&lt;Controller id&gt;.Role.Permission.
                param_settings: [
                    {
                        param: Enable
                        value: true
                    },
                    {
                        param: Targets
                        value: Device.LocalAgent.Controller.&lt;Controller instance id&gt;.BootParameter.&lt;boot parameter instance&gt;.
                    },
                    {
                        param: Param
                        value: &quot;----&quot;
                    }
                ]
            },
            {
                obj_path: Device.LocalAgent.ControllerTrust.&lt;Controller id&gt;.Role.Permission.
                param_settings: [
                    {
                        param: Enable
                        value: true
                    },
                    {
                        param: Targets
                        value: Device.LocalAgent.Controller.&lt;Controller instance id&gt;.BootParameter.&lt;boot parameter instance&gt;.
                    },
                    {
                        param: Param
                        value: &quot;rw--&quot;
                    },
                    {
                        param: Order
                        value: 1
                    }
                ]
            }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.&lt;Controller instance ID&gt;.BootParameter.
        }
    }
}</code></pre>
<h4 id="test-metrics-97">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse message after step 1. The message contains two oper_success elements, one for each added permission.</li>
<li>The EUT sends a GetResponse with a result_params element containing parameters of the specified BootParameter instance.</li>
</ol>
<h3 id="using-get-when-no-read-permissions-are-available-on-some-parameters">2.22 Using Get when no read permissions are available on some parameters</h3>
<h4 id="purpose-98">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly returns parameters that are readable while ignoring parameters that do not have read permissions.</p>
<h4 id="functionality-tags-20">Functionality Tags</h4>
<p>Conditional Mandatory (supports the ControllerTrust:1 profile with at least one role that allows object creation, or supports writable parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)</p>
<h4 id="test-setup-99">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the Controller used for testing has an assigned Role that is writable.</li>
<li>Ensure there is at least one BootParameter configured.</li>
</ol>
<h4 id="test-procedure-90">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            allow_partial: false
            create_objs: [
                {
                    obj_path: Device.LocalAgent.ControllerTrust.Role.&lt;Controller trust instance&gt;.Permission.
                    param_settings: [
                        {
                            param: Enable
                            value: true
                        },
                        {
                            param: Targets
                            value: Device.LocalAgent.Controller.&lt;Controller instance ID&gt;.BootParameter.&lt;known instance&gt;.ParameterName
                        },
                        {
                            param: Param
                            value: &quot;----&quot;
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.&lt;Controller instance ID&gt;.BootParameter.&lt;known instance&gt;.
        }
    }
}</code></pre>
<h4 id="test-metrics-98">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an AddResponse message after step 1. The message contains a oper_success element for the added Permission.</li>
<li>The EUT sends a GetResponse with a result_params element containing parameters of the specified BootParameter instance, with the exception of the ParameterName parameter.</li>
</ol>
<h2 id="usp-record-test-cases">3 USP Record Test Cases</h2>
<h3 id="bad-request-outside-a-session-context">3.1 Bad request outside a session context</h3>
<h4 id="purpose-99">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly responds to a bad request outside a session context.</p>
<h4 id="functionality-tags-21">Functionality Tags</h4>
<p>Mandatory</p>
<h4 id="test-setup-100">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to not use a session context.</li>
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-91">Test Procedure</h4>
<ol type="1">
<li>Send a malformed USP Record to the EUT.</li>
</ol>
<h4 id="test-metrics-99">Test Metrics</h4>
<ol type="1">
<li>After the EUT receives the malformed USP record, it exibits the expected “bad request” behavior for the applicable MTP.</li>
</ol>
<h3 id="agent-verifies-non-payload-field-integrity">3.2 Agent Verifies Non-Payload Field Integrity</h3>
<h4 id="purpose-100">Purpose</h4>
<p>The purpose of this test is to ensure the EUT verifies the integrity of the non-payload fields in a USP record.</p>
<h4 id="functionality-tags-22">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-101">Test Setup</h4>
<ol type="1">
<li>Ensure the relevant equipment are configured to NOT provide integrity protection at the MTP layer.</li>
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
</ol>
<h4 id="test-procedure-92">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with a <code>payload_security</code> of PLAINTEXT.</li>
</ol>
<h4 id="test-metrics-100">Test Metrics</h4>
<ol type="1">
<li>After the EUT receives the USP record, it exhibits the expected “bad request” behavior for the applicable MTP.</li>
</ol>
<h3 id="agent-rejects-invalid-signature-starting-a-session-context">3.3 Agent rejects invalid signature starting a session context</h3>
<h4 id="purpose-101">Purpose</h4>
<p>The purpose of this test is to ensure the EUT handles an attempt to start a session context with an invalid mac_signature.</p>
<h4 id="functionality-tags-23">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-102">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
</ol>
<h4 id="test-procedure-93">Test Procedure</h4>
<ol type="1">
<li>Send a TLS “client hello” to the EUT to begin a session context as described in “<a href="https://usp.technology/specification/e2e-message-exchange/">End to End Message Exchange</a>” in TR-369 with an invalid mac_signature.</li>
</ol>
<h4 id="test-metrics-101">Test Metrics</h4>
<ol type="1">
<li>After the EUT receives the USP record, it exhibits the expected “bad request” behavior for the applicable MTP.</li>
</ol>
<h3 id="using-tls-for-usp-record-integrity">3.4 Using TLS for USP Record Integrity</h3>
<h4 id="purpose-102">Purpose</h4>
<p>The purpose of this test is to ensure the EUT uses TLS to validate the integrity of USP records when the <code>payload_security</code> is TLS and the TLS handshake has completed.</p>
<h4 id="functionality-tags-24">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-103">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller are configured to secure the USP record payload with TLS.</li>
</ol>
<h4 id="test-procedure-94">Test Procedure</h4>
<ol type="1">
<li>Start a E2E session with the EUT using TLS to secure the payload.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}</code></pre>
<h4 id="test-metrics-102">Test Metrics</h4>
<ol type="1">
<li>In the GetResponse sent by the EUT, the <code>mac_signature</code> in the USP Record secures the non-payload fields via the MAC mechanism.</li>
<li>The <code>mac_signature</code> in the USP record sent by the EUT validates the integrity of the non-payload fields.</li>
</ol>
<h3 id="failure-to-establish-tls">3.5 Failure to Establish TLS</h3>
<h4 id="purpose-103">Purpose</h4>
<p>The purpose of this test is to ensure the EUT behaves correctly when the TLS session used to encapsulate the payload cannot be established.</p>
<h4 id="functionality-tags-25">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-104">Test Setup</h4>
<ol type="1">
<li>Configure the controller to use TLS12 as a <code>payload_security</code>.</li>
<li>Ensure <code>PeriodicNotifInterval</code> is 60, and the controller used for testing is subscribed to Periodic Event Notification.</li>
</ol>
<h4 id="test-procedure-95">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.&lt;controller instance&gt;.E2ESession.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Attempt to establish a new secure session with the EUT using TLS payload encapsulation.</li>
<li>Configure the controller to send TLS alerts during the TLS handshake process.</li>
<li>Wait for the EUT to attempt to start a session with the controller.</li>
<li>Allow the controller to send a TLS alert to the EUT and for the session to terminate.</li>
<li>Configure the controller to not send a TLS alert.</li>
<li>Wait for the EUT to retry establishing a E2E session.</li>
</ol>
<h4 id="test-metrics-103">Test Metrics</h4>
<ol type="1">
<li>After sending the client certificate to the EUT, the EUT sends a TLS alert, terminating the session.</li>
<li>After step 5, the EUT waits before retrying the session in accordance with the <code>SessionRetry</code> parameters found in step 1.</li>
</ol>
<h3 id="agent-ignores-tls-renegotiation-for-e2e-message-exchange">3.6 Agent ignores TLS renegotiation for E2E message exchange</h3>
<h4 id="purpose-104">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly ignores TLS renegotiation frames during a E2E message exchange.</p>
<h4 id="functionality-tags-26">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-105">Test Setup</h4>
<ol type="1">
<li>Ensure both the EUT and the controller are configured to use TLS payload security.</li>
</ol>
<h4 id="test-procedure-96">Test Procedure</h4>
<ol type="1">
<li>Establish a E2E session with the EUT.</li>
<li>Send a request to renegotiate TLS in place of the payload.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for a GetResponse from the EUT.</li>
</ol>
<h4 id="test-metrics-104">Test Metrics</h4>
<ol type="1">
<li>Between sending the TLS renegotiation request and receiving the GetResponse, the EUT does not send any USP records.</li>
</ol>
<h3 id="use-of-x.509-certificates">3.7 Use of X.509 Certificates</h3>
<h4 id="purpose-105">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly uses X.509 certificates to authenticate other endpoints, and in turn provides a X.509 certificate for the purpose of authentication.</p>
<h4 id="functionality-tags-27">Functionality Tags</h4>
<p>“Conditional Mandatory (supports Secure Message Exchange using TLS for USP Record Integrity)”</p>
<h4 id="test-setup-106">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller are configured to use TLS payload security.</li>
</ol>
<h4 id="test-procedure-97">Test Procedure</h4>
<ol type="1">
<li>Configure the controller to provide a X.509 certificate with a <code>subjectAltName</code> that does not match the controller’s USP endpoint ID.</li>
<li>Attempt to start a session with the EUT and send a Get message with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<h4 id="test-metrics-105">Test Metrics</h4>
<ol type="1">
<li>During the TLS handshake the EUT provides a X.509 certificate with a <code>subjectAltName</code> that matches the endpoint ID of the EUT.</li>
<li>During the TLS handshake the EUT requests a X.509 certificate from the controller.</li>
<li>The EUT rejects the controller’s certificate.</li>
</ol>
<h3 id="establishing-a-session-context">3.8 Establishing a Session Context</h3>
<h4 id="purpose-106">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can use a session context to exchange USP messages.</p>
<h4 id="functionality-tag-78">Functionality Tag</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-107">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to establish a connection and exchange USP messages.</li>
<li>Ensure at the start of the test there is no existing session context between the EUT and controller.</li>
</ol>
<h4 id="test-procedure-98">Test Procedure</h4>
<ol type="1">
<li>Start a session context with the EUT and send a Get message with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<h4 id="test-metrics-106">Test Metrics</h4>
<ol type="1">
<li>After step 1, the EUT responds with a USP record containing a session context, a <code>sequence_number</code> of 1 and a <code>session_id</code> that matched the session identifier sent to the EUT.</li>
</ol>
<h3 id="receipt-of-a-record-out-of-a-session-context">3.9 Receipt of a Record out of a Session Context</h3>
<h4 id="purpose-107">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly handles the receieving of a USP record outside of a session context.</p>
<h4 id="functionality-tags-28">Functionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-108">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to establish a session and exchange USP messages.</li>
</ol>
<h4 id="test-procedure-99">Test Procedure</h4>
<ol type="1">
<li>Start a session with the EUT using a session context.</li>
<li>Send a Get message to the EUT for <code>Device.DeviceInfo.</code> using a USP Record with the following structure:</li>
</ol>
<pre><code>Record {
    record_type {
        session_context {
            session_id: &quot;&lt;new session_id&gt;&quot;
            sequence_id: &quot;&lt;expected sequence_id&gt;&quot;
            expected_id: &quot;&lt;expected expected_id&gt;&quot;
            payload {
                ...
            }
        }
    }
}</code></pre>
<h4 id="test-metrics-107">Test Metrics</h4>
<ol type="1">
<li>The EUT sends the GetResponse in a USP Record using the new <code>session_id</code> and a <code>sequence_id</code> of 1.</li>
</ol>
<h3 id="session-context-expiration">3.10 Session Context Expiration</h3>
<h4 id="purpose-108">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly adheres to the <code>SessionExpiration</code> parameter.</p>
<h4 id="fuctionality-tags">Fuctionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-109">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information required to start a session and exchange USP records.</li>
<li>Ensure the controller is subscribed to Periodic! event.</li>
</ol>
<h4 id="test-procedure-100">Test Procedure</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.&lt;controller instance&gt;.E2ESession.
                    param_settings: [
                        {
                            param: SessionExpiration
                            value: 60
                        }
                    ]
                },
                {
                    obj_path: Device.LocalAgent.Controller.&lt;controller instance&gt;.
                    param_settings: [
                        {
                            param: PeriodicNotifInterval
                            value: 10
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for 3 Notify messages from the EUT containing a Periodic! event.</li>
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.&lt;controller instance&gt;.E2ESession.
                    param_settings: [
                        {
                            param: SessionExpiration
                            value: 5
                        }
                    ]
                },
                {
                    obj_path: Device.LocalAgent.Controller.&lt;controller instance&gt;.
                    param_settings: [
                        {
                            param: PeriodicNotifInterval
                            value: 10
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for 3 Notify messages from the EUT containing a Periodic! event.</li>
</ol>
<h4 id="test-metrics-108">Test Metrics</h4>
<ol type="1">
<li>All three Notify messages recieved in step 2 use the same session context.</li>
<li>None of the three Notify messages recieved in step 4 shared the same session context.</li>
</ol>
<h3 id="use-of-sequence-id-and-expected-id">3.11 Use of Sequence ID and Expected ID</h3>
<h4 id="purpose-109">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly uses the <code>sequence_id</code> and <code>expected_id</code> attributes found in a session context.</p>
<h4 id="functionality-tags-29">Functionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-110">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to start a session and exchange USP messages.</li>
<li>Ensure the controller is not subscribed to any events on the EUT.</li>
</ol>
<h4 id="test-procedure-101">Test Procedure</h4>
<ol type="1">
<li>Start a session with the EUT.</li>
<li>Send a Get message to the EUT with the expected <code>sequence_id</code> and <code>expected_id</code> for <code>Device.DeviceInfo.ModelNumber</code>.</li>
<li>Send a Get message to the EUT with the <code>sequence_id</code> set to the expected value plus 2 for <code>Device.DeviceInfo.SoftwareVersion</code>.</li>
<li>Send a Get message to the EUT with the <code>sequence_id</code> set to 2 less than the expected value for <code>Device.DeviceInfo.HardwareVersion</code>.</li>
<li>Send a Get message to the EUT with the expected <code>sequence_id</code> and <code>expected_id</code> for <code>Device.DeviceInfo.HardwareVersion</code>.</li>
</ol>
<h4 id="test-metrics-109">Test Metrics</h4>
<ol type="1">
<li>After step 1 the EUT returns a GetResponse with a <code>sequence_id</code> that matches the <code>expected_id</code> in the record that was sent.</li>
<li>After step 3 the EUT returns a GetResponse with a <code>sequence_id</code> that matches the <code>expected_id</code> in the record that was sent in step 4.</li>
<li>The EUT never sends a GetResponse with a <code>sequence_id</code> that matches the <code>expected_id</code> in the record sent in step 3.</li>
<li>After step 5 the EUT returns a GetResponse with a <code>sequence_id</code> that matches the <code>expected_id</code> in the record that was sent.</li>
<li>After step 5 The EUT sends a GetResponse containing the parameter <code>Device.DeviceInfo.SoftwareVersion</code>.</li>
</ol>
<h3 id="preservation-of-usp-records">3.12 Preservation of USP Records</h3>
<p>The purpose of this test is to ensure the EUT preserves a sent record in the event the receiving endpoint requests a retransmission.</p>
<h4 id="functionality-tags-30">Functionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-111">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to start a session an exchange USP messages.</li>
</ol>
<h4 id="test-procedures">Test Procedures</h4>
<ol type="1">
<li>Start a new session.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Wait 60 seconds.</li>
<li>Send a USP record to the EUT with a <code>retransmit_id</code> set to the <code>expected_id</code> value in the record sent in step 1.</li>
</ol>
<h4 id="test-metrics-110">Test Metrics</h4>
<ol type="1">
<li>The EUT sends the same GetResponse twice, once after step 2 and once after step 4.</li>
</ol>
<h3 id="agent-rejects-records-with-different-payload-security-than-the-established-context">3.13 Agent Rejects Records with Different Payload Security than the Established Context</h3>
<h4 id="purpose-110">Purpose</h4>
<p>The purpose of this test is to ensure the EUT does not accept USP Records that have a different <code>payload_security</code> value than the that of the established session context.</p>
<h4 id="functionality-tags-31">Functionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-112">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to start a session and exchange USP messages.</li>
<li>Ensure the EUT and controller have the nessesary information to secure the USP record payload using TLS.</li>
</ol>
<h4 id="test-procedure-102">Test Procedure</h4>
<ol type="1">
<li>Starts a session with the EUT using <code>payload_security</code> TLS12.</li>
<li>After the session is established, send the following Get message for any valid parameter using <code>payload_security</code> PLAINTEXT and a plaintext.</li>
</ol>
<h4 id="test-metrics-111">Test Metrics</h4>
<ol type="1">
<li>The EUT does not send a GetResponse.</li>
<li>The EUT starts a new session after step 2.</li>
</ol>
<h3 id="use-of-retransmit_id">3.14 Use of retransmit_id</h3>
<h4 id="purpose-111">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly uses the <code>retransmit_id</code> value in a USP record and adheres to the related parameters in the data model.</p>
<h4 id="functionality-tags-32">Functionality Tags</h4>
<p>Conditionality Mandatory (supports session context)</p>
<h4 id="test-setup-113">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to start a session and exchange USP messages.</li>
</ol>
<h4 id="test-procedure-103">Test Procedure</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.Controller.&lt;controller instance&gt;.E2ESession.
                    param_settings: [
                        {
                            param: MaxRetransmitTries
                            value: 2
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a SetResponse</li>
<li>Send a USP record with a <code>retransmit_id</code> set to the value of the <code>sequence_id</code> found in the SetResponse in step 2.</li>
<li>Repeat steps 2 and 3 twice more.</li>
</ol>
<h4 id="test-metrics-112">Test Metrics</h4>
<ol type="1">
<li>The first three SetResponse messages are sent in the same session context.</li>
<li>On the third retransmit request, the EUT doesn’t send a SetResponse and instead starts a new session with the controller.</li>
</ol>
<h3 id="handling-duplicate-records">3.15 Handling Duplicate Records</h3>
<h4 id="purpose-112">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can correctly handle receiving duplicate records.</p>
<h4 id="functionality-tags-33">Functionality Tags</h4>
<p>Conditional Mandatory (supports USP session context)</p>
<h4 id="test-setup-114">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT and controller have the nessesary information to start session and exchange USP messages.</li>
</ol>
<h4 id="test-procedure-104">Test Procedure</h4>
<ol type="1">
<li>Start a session with the EUT.</li>
<li>Send a Get message to the EUT requesting a parameter that is known to exist.</li>
<li>Retransmit the same USP record sent in step 2 to the EUT, using the same non-payload USP record field values.</li>
<li>Repeat step 3 twice more.</li>
</ol>
<h4 id="test-metrics-113">Test Metrics</h4>
<ol type="1">
<li>The EUT send only one GetResponse.</li>
</ol>
<h2 id="general-mtp-test-cases">4 General MTP Test Cases</h2>
<h3 id="use-of-x.509-certificates-at-the-mtp-layer">4.1 Use of X.509 certificates at the MTP layer</h3>
<h4 id="purpose-113">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can use X.509 certificates to secure communication at the MTP layer.</p>
<h4 id="functionality-tags-34">Functionality Tags</h4>
<p>Conditional Mandatory (supports encryption at the MTP layer)</p>
<h4 id="test-setup-115">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Configure a secondary Controller outside the network boundary of the EUT.</li>
</ol>
<h4 id="test-procedure-105">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
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
                            value: &lt;new Controller endpoint ID&gt;
                        },
                        {
                            param: Enable
                            value: true
                        },
                        {
                            param: AssignedRole
                            value: &lt;valid role instance&gt;
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            obj_path: Device.LocalAgent.Controller.&lt;new instance&gt;.MTP.
            param_settings: [
                {
                    param: Enable
                    value: true
                },
                {
                    param: Protocol
                    value: &lt;support MTP&gt;
                }
                .
                .
                &lt;Supported MTP configuration&gt;
                .
                .
            ]
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.Controller.&lt;new instance&gt;.SendOnBoardRequest()
        }
    }
}</code></pre>
<h4 id="test-metrics-114">Test Metrics</h4>
<ol type="1">
<li>The EUT contacts the secondary EUT and establishes a secure MTP layer connection by employing X.509 certificates.</li>
</ol>
<h2 id="coap-test-cases">5 CoAP Test Cases</h2>
<h3 id="mapping-a-usp-record-to-a-coap-message">5.1 Mapping a USP Record to a CoAP message</h3>
<h4 id="purpose-114">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can properly use CoAP to transport USP Records.</p>
<h4 id="functionality-tags-35">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-116">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-106">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a GetResponse</li>
</ol>
<h4 id="test-metrics-115">Test Metrics</h4>
<ol type="1">
<li>The GetResponse is encapsulated in a CoAP message.</li>
<li>The CoAP message used transport the GetResponse uses application/octet-stream for Content-Format.</li>
</ol>
<h3 id="usp-records-that-exceed-coap-message-size">5.2 USP Records that exceed CoAP message size</h3>
<h4 id="purpose-115">Purpose</h4>
<p>The purpose of this test is to ensure the EUT properly segments large USP records and transports them using block encapsulation.</p>
<h4 id="funtionality-tags">Funtionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-117">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-107">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_path: Device.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a GetResponse</li>
</ol>
<h4 id="test-metrics-116">Test Metrics</h4>
<ol type="1">
<li>The EUT sends the GetResponse message using multiple block encapsulated CoAP messages.</li>
</ol>
<h3 id="successful-coap-exchange">5.3 Successful CoAP exchange</h3>
<h4 id="purpose-116">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly sends a 2.04 Changed response to CoAP messages.</p>
<h4 id="functionality-tags-36">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-118">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-108">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}</code></pre>
<h4 id="test-metrics-117">Test Metrics</h4>
<ol type="1">
<li>After the transmission of the Get message the EUT sends a 2.04 Changed message.</li>
</ol>
<h3 id="failed-coap-exchange---timeout">5.4 Failed CoAP exchange - timeout</h3>
<h4 id="purpose-117">Purpose</h4>
<p>The purpose of this test is to ensure the EUT behaves correctly when a timeout occurs at the MTP layer when using CoAP.</p>
<h4 id="functionality-tags-37">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-119">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-109">Test Procedure</h4>
<ol type="1">
<li>Configure the to not send 2.04 Changed responses to CoAP messages</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_path: Device.LocalAgent.
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Wait for a GetResponse message from the EUT.</li>
<li>Prevent the Controller from sending a 2.04 Changed CoAP response.</li>
<li>Wait for EUT to retry sending the GetResponse.</li>
<li>Allow the Controller to send a 2.04 Changed CoAP response.</li>
</ol>
<h4 id="test-metrics-118">Test Metrics</h4>
<ol type="1">
<li>The EUT attempts to retransmit the GetResponse message after not receieving a 2.04 Changed from the Controller.</li>
</ol>
<h3 id="failed-coap-exchange---invalid-method">5.5 Failed CoAP Exchange - Invalid Method</h3>
<h4 id="purpose-118">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly responds when it receives a CoAP message with an invalid method.</p>
<h4 id="functionality-tags-38">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-120">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
<li>The EUT the Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-110">Test Procedure</h4>
<ol type="1">
<li>Send a USP record to the EUT using a CoAP message with method code <code>0x06</code>.</li>
<li>Wait up to 60 seconds for the EUT to send a CoAP response.</li>
</ol>
<h4 id="test-metrics-119">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a reply to the CoAP message with an invalid method code.</li>
<li>The EUT’s CoAP response uses code <code>4.05</code> to indicate an invalid CoAP method.</li>
</ol>
<h3 id="failed-coap-exchange---invalid-content-format">5.6 Failed CoAP Exchange - Invalid Content-Format</h3>
<h4 id="purpose-119">Purpose</h4>
<p>The purpose of this test is to ensure the EUT properly responds to CoAP messages that feature invalid Content-Format options.</p>
<h4 id="functionality-tags-39">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-121">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-111">Test Procedure</h4>
<ol type="1">
<li>Send a USP record to the EUT using a CoAP message with Content-Format option <code>0x113a</code>.</li>
<li>Wait up to 60 second for the EUT to respond.</li>
</ol>
<h4 id="test-metrics-120">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a reply to the CoAP message with an invalid Content-Format.</li>
<li>The EUT’s CoAP response uses code <code>4.15</code> to indicate an invalid Content-Format.</li>
</ol>
<h3 id="failed-coap-exchange---invalid-usp-record">5.7 Failed CoAP Exchange - Invalid USP Record</h3>
<h4 id="purpose-120">Purpose</h4>
<p>The purpose of this is to ensure the EUT properly responds to a CoAP message containing a malformed USP record.</p>
<h4 id="functionality-tags-40">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-122">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP.</li>
</ol>
<h4 id="test-procedure-112">Test Procedure</h4>
<ol type="1">
<li>Send a malformed USP record to the EUT in a CoAP message.</li>
<li>Wait up to 60 seconds for the EUT to send a CoAP reply.</li>
</ol>
<h4 id="test-metrics-121">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a reply to the CoAP message with the malformed USP record.</li>
<li>The EUT’s CoAP response uses code <code>4.00</code> to indicate the USP record is invalid or not understandable.</li>
</ol>
<h3 id="use-of-dtls">5.8 Use of DTLS</h3>
<h4 id="purpose-121">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can secure communication with another CoAP endpoint at the CoAP layer.</p>
<h4 id="functionality-tags-41">Functionality Tags</h4>
<p>Conditional Mandatory (supports the CoAP MTP)</p>
<h4 id="test-setup-123">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equiment have the nessesary information to send and receive USP records to each other.</li>
<li>The EUT and Controller are configured to communicate over CoAP using DTLS.</li>
<li>The EUT and Controller have the necessary information about one another to establish an encrypted channel of communication.</li>
</ol>
<h4 id="test-procedure-113">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for the EUT to send a GetReponse.</li>
</ol>
<h4 id="test-metrics-122">Test Metrics</h4>
<ol type="1">
<li>The Controller is able to establish a DTLS session with the EUT.</li>
<li>The EUT established a DTLS session and sends a GetResponse.</li>
</ol>
<h2 id="stomp-test-cases">6 STOMP Test Cases</h2>
<h3 id="support-of-required-profiles">6.1 Support of Required Profiles</h3>
<h4 id="purpose-122">Purpose</h4>
<p>The purpose of this test is to ensure the EUT supports the required STOMP profiles.</p>
<h4 id="functionality-tags-42">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-124">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP records to each other.</li>
</ol>
<h4 id="test-procedure-114">Test Procedure</h4>
<ol type="1">
<li>Send a GetSupportedDM message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET_SUPPORTED_DM
}
body {
    request {
        get_supported_dm {
            obj_paths: [
                &quot;Device.STOMP.&quot;
                &quot;Device.LocalAgent.&quot;
            ]
            return_param: true
            first_level_only: false
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for the GetSupportedDMResponse.</li>
</ol>
<h4 id="test-metrics-123">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a GetSupportedDMResponse.</li>
<li>The GetSupportedDMReponse from the EUT contains the following parameters: Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Reference Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Destination Device.STOMP.ConnectionNumberOfEntries Device.STOMP.Connection.{i}.Alias Device.STOMP.Connection.{i}.Enable Device.STOMP.Connection.{i}.Status Device.STOMP.Connection.{i}.Host Device.STOMP.Connection.{i}.Port Device.STOMP.Connection.{i}.VirtualHost Device.STOMP.Connection.{i}.ServerRetryInitialInterval Device.STOMP.Connection.{i}.ServerRetryInitialMultiplier Device.STOMP.Connection.{i}.ServerRetryMaxInterval</li>
</ol>
<h3 id="stomp-session-establishment">6.2 STOMP session establishment</h3>
<h4 id="purpose-123">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can properly start a STOMP session.</p>
<h4 id="functionality-tags-43">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-125">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT is configured to use a STOMP server that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-115">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to reconnect to the STOMP server and subscribe to a destination.</li>
</ol>
<h4 id="test-metrics-124">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a STOMP frame to the STOMP server to initiate the STOMP session.</li>
</ol>
<h3 id="stomp-connection-retry">6.3 STOMP Connection Retry</h3>
<h4 id="purpose-124">Purpose</h4>
<p>The purpose of this test is to ensure the EUT properly enters a retry state when it fails to connect to the STOMP server.</p>
<h4 id="functionality-tags-44">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-126">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT is configured to use a STOMP server that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-116">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.STOMP.Connection.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.Reboot()
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Disable the STOMP server.</li>
<li>Allow the EUT to attempt to start a STOMP session with the STOMP server.</li>
<li>Reenable the STOMP server after the EUT fails to connect to the STOMP server twice.</li>
</ol>
<h4 id="test-metrics-125">Test Metrics</h4>
<ol type="1">
<li>The EUT retries connecting to the STOMP server within the <code>ServerRetryInitialInterval</code> of the connection instance.</li>
<li>The EUT retries a second time in accordance with <code>ServerRetryInitialInterval</code> and <code>ServerRetryIntervalMultiplier</code>.</li>
</ol>
<h3 id="successful-usp-message-over-stomp-with-required-headers">6.4 Successful USP message over STOMP with required headers</h3>
<h4 id="purpose-125">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can communicate over STOMP using the correct headers.</p>
<h4 id="functionality-tags-45">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-127">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT is configured to use a STOMP server that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-117">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Allow the EUT to send a GetResponse.</li>
</ol>
<h4 id="test-metrics-126">Test Metrics</h4>
<ol type="1">
<li>In the STOMP frame transporting the GetResponse the <code>content-length</code> header is present and contains the length of the included body of the message.</li>
<li>In the STOMP frame transporting the GetResponse the <code>content-type</code> header is present and contains <code>application/vnd.bbf.usp.msg</code>.</li>
<li>In the STOMP frame transporting the GetReponse the <code>reply-to-dest</code> header is present and contains the STOMP destination of the EUT.</li>
</ol>
<h3 id="stomp-destination---provided-in-subscribe-dest">6.5 STOMP destination - provided in subscribe-dest</h3>
<h4 id="purpose-126">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correct subscribe to a destination found in the <code>subscribe-dest</code> header in a CONNECTED frame.</p>
<h4 id="functionality-tags-46">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-128">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use a STOMP server that is part of the test environment.</li>
</ol>
<h4 id="test-procedure-118">Test Procedure</h4>
<ol type="1">
<li>Configure the STOMP server to send an unused destination via the <code>subscribe-dest</code> header in the CONNECTED frames.</li>
<li>Reboot the EUT.</li>
<li>Allow the EUT to reconnect to the STOMP server.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.
        }
    }
}</code></pre>
<ol start="5" type="1">
<li>Allow the EUT to respond to the Get message.</li>
</ol>
<h4 id="test-metrics-127">Test Metrics</h4>
<ol type="1">
<li>The EUT subscribes to the destination configured in step 1.</li>
<li>The STOMP frame containing the GetResponse has a <code>reply-to-dest</code> header which matches the destination configured in step 1.</li>
</ol>
<h3 id="stomp-destination---configured-in-usp-data-model">6.6 STOMP destination - configured in USP data model</h3>
<h4 id="purpose-127">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can use the <code>Device.LocalAgent.MTP.{i}.STOMP.Destination</code> parameter to select a STOMP destination.</p>
<h4 id="functionality-tags-47">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-steps-7">Test Steps</h4>
<ol type="1">
<li>Ensure the EUT is configured to use a STOMP server that is part of the test environment.</li>
</ol>
<h4 id="test-procedure-119">Test Procedure</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs {
                obj_path: Device.LocalAgent.MTP.&lt;active MTP instance&gt;.STOMP.
                param_settings: [
                    {
                        param: Destination
                        value: &lt;new unused destination&gt;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to reconnect to the STOMP server.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="5" type="1">
<li>Wait for a GetResponse from the EUT.</li>
</ol>
<h4 id="test-metrics-128">Test Metrics</h4>
<ol type="1">
<li>The EUT subscribes to the destination configured in step 1.</li>
<li>The STOMP frame containing the GetResponse has a <code>reply-to-dest</code> header which contains the STOMP destination configured in step 1.</li>
</ol>
<h3 id="stomp-destination---terminates-unconfigured-session">6.7 STOMP Destination - terminates unconfigured session</h3>
<h4 id="purpose-128">Purpose</h4>
<p>The purpose of this test is to ensure the EUT terminates a STOMP session when no destination id configured.</p>
<h4 id="functionality-tags-48">Functionality Tags</h4>
<p>Conditionally Mandatory (Implements STOMP)</p>
<h4 id="test-setup-129">Test Setup</h4>
<ol type="1">
<li>The EUT is configured to use a STOMP server which exists in the test environment.</li>
<li>Configure the STOMP server to not provide a <code>subscribe-dest</code> header in the CONNECTED frame.</li>
</ol>
<h4 id="test-procedure-120">Test Procedure</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.MTP.&lt;active MTP instance&gt;.STOMP.
                    param_settings: [
                        {
                            param: Destination
                            value: &quot;&quot;
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to attempt to reconnect to the STOMP server.</li>
</ol>
<h4 id="test-metrics-129">Test Metrics</h4>
<ol type="1">
<li>The EUT terminates the STOMP session after the STOMP server sends a CONNECTION to the EUT.</li>
</ol>
<h3 id="use-of-stomp-heartbeat-mechanism">6.8 Use of STOMP heartbeat mechanism</h3>
<h4 id="purpose-129">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can correctly implements the STOMP heartbeat mechanism and the relavent parameters in the data model.</p>
<h4 id="functionality-tags-49">Functionality Tags</h4>
<p>Conditional Mandatory (supports STOMPHeartbeat:1 profile)</p>
<h4 id="test-setup-130">Test Setup</h4>
<ol type="1">
<li>The EUT is configured to use a STOMP server which exists in the test environment.</li>
<li>Ensure the STOMP server supports heartbeats.</li>
</ol>
<h4 id="test-metrics-130">Test Metrics</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.STOMP.Connection.&lt;STOMP server in use&gt;.
                    param_settings: [
                        {
                            param: EnableHeartbeats
                            value: true
                        },
                        {
                            param: IncomingHeartbeat
                            value: 10
                        },
                        {
                            param: OutgoingHeartbeat
                            value: 15
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to reconnect to the STOMP server.</li>
<li>Wait for 60 seconds</li>
</ol>
<h4 id="test-metrics-131">Test Metrics</h4>
<ol type="1">
<li>In the STOMP frame sent to the STOMP server during step 2, the <code>heart-beat</code> header sent by the EUT contains “15, 10”.</li>
<li>After the EUT is connected to the STOMP server, the EUT sends heartbeat messages every 15 seconds.</li>
</ol>
<h3 id="error-handling---unprocessed-record">6.9 Error Handling - Unprocessed Record</h3>
<h4 id="purpose-130">Purpose</h4>
<p>The purpose of this test is to ensure the EUT will correctly send an ERROR STOMP frame when a malformed USP record is received.</p>
<h4 id="functionality-tags-50">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-131">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use a STOMP server that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-121">Test Procedure</h4>
<ol type="1">
<li>Send a malformed USP record to the EUT.</li>
<li>Wait 60 seconds for the EUT to send a response.</li>
</ol>
<h4 id="test-metrics-132">Test Metrics</h4>
<ol type="1">
<li>The EUT does not send a response to the malformed record.</li>
</ol>
<h3 id="agents-stomp-destination-is-changed">6.10 Agent’s STOMP destination is changed</h3>
<h4 id="purpose-131">Purpose</h4>
<p>The purpose of this test is to ensure that when the EUT’s destination is altered it properly unsubscribes and subscribes to the new destination.</p>
<h4 id="functionality-tags-51">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-132">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use a STOMP server that exists in the test environment.</li>
<li>Ensure the STOMP server is configured to not provide a destination via the <code>subscribe-dest</code> header.</li>
</ol>
<h4 id="test-procedure-122">Test Procedure</h4>
<ol type="1">
<li>Send a Set message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: SET
}
body {
    request {
        set {
            update_objs: [
                {
                    obj_path: Device.LocalAgent.MTP.&lt;active MTP instance&gt;.STOMP.
                    param_settings: [
                        {
                            param: Destination
                            value: &lt;new destination&gt;
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<h4 id="test-metrics-133">Test Metrics</h4>
<ol type="1">
<li>After the STOMP destination was changed the EUT sent an UNSUBSCRIBE message message to the STOMP server.</li>
<li>After the EUT sent an UNSUBSCRIBE to the STOMP server it sent a SUBSCRIBE message with the new destination to the STOMP server.</li>
</ol>
<h3 id="stomp---use-of-tls">6.11 STOMP - Use of TLS</h3>
<h4 id="purpose-132">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can secure STOMP communication via TLS.</p>
<h4 id="functionality-tags-52">Functionality Tags</h4>
<p>Conditional Mandatory (supports the STOMP MTP)</p>
<h4 id="test-setup-133">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to the use a STOMP server that exists in the test environment.</li>
<li>Ensure the EUT and STOMP server are configured with the appropriate certificates to communicate over TLS.</li>
</ol>
<h4 id="test-procedure-123">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT</li>
<li>Wait for the EUT to reconnect to the STOMP server</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for the EUT to send a GetResponse</li>
</ol>
<h4 id="test-metrics-134">Test Metrics</h4>
<ol type="1">
<li>All communication between the EUT and STOMP server after step 1 are encrypted using TLS</li>
</ol>
<h2 id="websocket-test-cases">7 WebSocket Test Cases</h2>
<h3 id="session-establishment">7.1 Session Establishment</h3>
<h4 id="purpose-133">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can establish a session using WebSocket as the MTP.</p>
<h4 id="functionality-tags-53">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-134">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket and to communicate to the controller that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-124">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to reconnect to the controller.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for a GetResponse from the EUT</li>
</ol>
<h4 id="test-metrics-135">Test Metrics</h4>
<ol type="1">
<li>The EUT is able to establish a WebSocket connection to the controller</li>
<li>The EUT sends a GetResponse to the Get message sent in step 3</li>
</ol>
<h3 id="use-of-only-one-session">7.2 Use of only one session</h3>
<h4 id="purpose-134">Purpose</h4>
<p>The purpose of this test is to ensure the EUT maintains only one WebSocket connection to a controller at a time.</p>
<h4 id="functionality-tags-54">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-135">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket and to comminucate to the controller that exists in the test environment.</li>
</ol>
<h4 id="test-procedure-125">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT using the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Open a second WebSocket connection to the EUT</li>
<li>Attempt to send the same message from step 1 over the second WebSocket connection</li>
</ol>
<h4 id="test-metrics-136">Test Metrics</h4>
<ol type="1">
<li>After the second WebSocket connection is opened the EUT closes either the first or second WebSocket connection.</li>
</ol>
<h3 id="agent-session-acceptance-from-controller">7.3 Agent session acceptance from Controller</h3>
<h4 id="purpose-135">Purpose</h4>
<p>The purpose of this test is to ensure an EUT can accept the establishment of a WebSocket session from a USP controller.</p>
<h4 id="functionality-tags-55">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP with requirement R-WS.6)</p>
<h4 id="test-setup-136">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSockets.</li>
<li>Configure the controller to block new WebSocket connections from the EUT.</li>
</ol>
<h4 id="test-procedure-126">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Open a WebSocket connection to the EUT from the controller.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for a GetResponse from the EUT.</li>
</ol>
<h4 id="test-metrics-137">Test Metrics</h4>
<ol type="1">
<li>The EUT allows a WebSocket connection from the controller.</li>
<li>The EUT sends a GetResponse.</li>
</ol>
<h3 id="closing-a-websocket-connection">7.4 Closing a WebSocket Connection</h3>
<h4 id="purpose-136">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly implements the procedure to close a WebSocket connection.</p>
<h4 id="functionality-tags-56">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-137">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket.</li>
<li>Ensure there is an active WebSocket connection between the EUT and the controller that was initiated by the EUT.</li>
</ol>
<h4 id="test-procedure-127">Test Procedure</h4>
<ol type="1">
<li>Send a <code>Close</code> WebSocket control frame to the EUT.</li>
<li>Wait for the EUT to close the underlying TCP session.</li>
</ol>
<h4 id="test-metrics-138">Test Metrics</h4>
<ol type="1">
<li>The EUT closes the underlying TCP session after step 1.</li>
</ol>
<h3 id="rejection-of-session-establishment">7.5 Rejection of Session Establishment</h3>
<h4 id="purpose-137">Purpose</h4>
<p>The purpose of this test is to ensure the EUT will correctly reject WebSocket sessions.</p>
<h4 id="functionality-tags-57">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-138">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket.</li>
<li>Configure the controller to reject WebSocket connections from the EUT.</li>
</ol>
<h4 id="test-procedure-128">Test Procedure</h4>
<ol type="1">
<li>Configure he controller to not include the <code>Sec-WebSocket-Protocol</code> when opening new WebSocket connections.</li>
<li>Reboot the EUT</li>
<li>Attempt to start a WebSocket connection to the EUT.</li>
</ol>
<h4 id="test-metrics-139">Test Metrics</h4>
<ol type="1">
<li>The EUT rejects the WebSocket connection with the missing <code>Sec-WebSocket-Protocol</code> header.</li>
</ol>
<h3 id="error-handling---unprocessed-records">7.6 Error Handling - Unprocessed Records</h3>
<h4 id="purpose-138">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly closes the WebSocket connection when a malformed USP Record is receieved.</p>
<h4 id="functionality-tags-58">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-139">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket</li>
<li>Ensure there is an active WebSocket connection between the EUT and controller.</li>
</ol>
<h4 id="test-procedure-129">Test Procedure</h4>
<ol type="1">
<li>Send a malformed USP record to the EUT.</li>
</ol>
<h4 id="test-metrics-140">Test Metrics</h4>
<ol type="1">
<li>After step 1 the EUT closes the WebSocket connection with a WebSocket <code>Close</code> control frame containing status code 1003.</li>
</ol>
<h3 id="use-of-ping-and-pong-frames">7.7 Use of Ping and Pong frames</h3>
<h4 id="purpose-139">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly uses <code>Ping</code> and <code>Pong</code> control frames to keep the WebSocket session alive.</p>
<h4 id="functionality-tags-59">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-140">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket</li>
<li>Ensure there is an active WebSocket session between the EUT and the Controller.</li>
</ol>
<h4 id="test-procedure-130">Test Procedure</h4>
<ol type="1">
<li>Send a <code>Ping</code> control frame to the EUT.</li>
<li>Wait up to 60 seconds for a <code>Pong</code> control frame from the EUT.</li>
<li>Send a <code>Pong</code> control frame to the EUT.</li>
</ol>
<h4 id="test-metrics-141">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a <code>Pong</code> control frame in response to the <code>Ping</code> control frame.</li>
<li>The EUT doesn’t terminate the WebSocket connection after recieving an unsolicited <code>Pong</code> control frame.</li>
</ol>
<h3 id="websocket-session-retry">7.8 WebSocket Session Retry</h3>
<h4 id="purpose-140">Purpose</h4>
<p>The purpose of this test is to ensure the EUT will correctly attempt to reestablish a WebSocket session if a session is unexpectedly closed.</p>
<h4 id="functionality-tags-60">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-141">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket.</li>
<li>Ensure there is an active WebSocket connection between the EUT and controller.</li>
</ol>
<h4 id="test-procedure-131">Test Procedure</h4>
<ol type="1">
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.&lt;test controller instance&gt;.MTP.&lt;active MTP instance&gt;.
        }
    }
}</code></pre>
<ol type="1">
<li>Configure the controller to reject new WebSocket connections.</li>
<li>Terminate the underlying TCP connection on the existing WebSocket connection.</li>
<li>Wait for the EUT to attempt to establish a WebSocket connection.</li>
<li>Configure the controlle to accept new WebSocket connections.</li>
<li>Wait for the EUT to attempt to establish a WebSocket connection.</li>
</ol>
<h4 id="test-metrics-142">Test Metrics</h4>
<ol type="1">
<li>The EUT attempts to start a new WebSocket connection in conformance with the <code>SessionRetryMinimumWaitInterval</code> parameter.</li>
<li>The EUT makes a second attempt to start a new WebSocket connection in confromance with the <code>SessionRetryMinimumWaitInterval</code> and <code>SessionRetryIntervalMultiplier</code> parameters.</li>
</ol>
<h3 id="use-of-tls">7.9 Use of TLS</h3>
<h4 id="purpose-141">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can establish and use a secure WebSocket connection.</p>
<h4 id="functionality-tags-61">Functionality Tags</h4>
<p>Conditional Mandatory (supports the WebSocket MTP)</p>
<h4 id="test-setup-142">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to use WebSocket.</li>
<li>Ensure the EUT and controller both have the required certificates to secure a websocket connection.</li>
</ol>
<h4 id="test-procedure-132">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to connect to the controller.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    mgs_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Wait for GetResponse from the EUT.</li>
</ol>
<h4 id="test-metrics-143">Test Metrics</h4>
<ol type="1">
<li>The EUT starts a WebSocket connection with the controller using TLS.</li>
<li>The EUT sends a GetReponse in step 4.</li>
</ol>
<h2 id="discovery-test-cases">8 Discovery Test Cases</h2>
<h3 id="dhcp-discovery---agent-request-requirements">8.1 DHCP Discovery - Agent Request Requirements</h3>
<h4 id="purpose-142">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly requests controller information via DHCP. <em>Note: this test can be run over DHCPv4 or DHCPv6, depending on the deployment model of the EUT.</em></p>
<h4 id="functionality-tags-62">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via DHCP Options)</p>
<h4 id="test-setup-143">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to request controller DHCP information.</li>
<li>Ensure the EUT is configured to acquire an address via DHCP.</li>
</ol>
<h4 id="test-procedure-133">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to request an address via DHCP.</li>
</ol>
<h4 id="test-metrics-144">Test Metrics</h4>
<ol type="1">
<li>The EUT includes a Vendor Class option with Enterprise Number 3561 and vendor-class-data “usp” in the DHCP request.</li>
</ol>
<h3 id="dhcp-discovery---agent-handling-of-received-options">8.2 DHCP Discovery - Agent handling of received options</h3>
<h4 id="purpose-143">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can properly handle the USP options provided by a DHCP server.</p>
<h4 id="functionality-tags-63">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via DHCP Options)</p>
<h4 id="test-setup-144">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to request controller DHCP information</li>
<li>Ensure the EUT is configured to acquire an address via DHCP.</li>
<li>Ensure the EUT’s <code>ProvisioningCode</code> parameter is set to a value other than that which will be set during the test procedure.</li>
</ol>
<h4 id="test-procedure-134">Test Procedure</h4>
<ol type="1">
<li>Configure the DHCP server to provide a null terminated provisioning code.</li>
<li>Reboot the EUT.</li>
<li>Wait for the EUT to request an address via DHCP.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.&lt;test controller instance&gt;.
        }
    }
}</code></pre>
<ol start="5" type="1">
<li>Wait for the GetResponse from the EUT.</li>
</ol>
<h4 id="test-metrics-145">Test Metrics</h4>
<ol type="1">
<li>The <code>ProvisioningCode</code> parameter found in the GetReponse matches the provisioning code configured on the DHCP server.</li>
</ol>
<h3 id="dhcp-discovery---fqdn-leads-to-dns-query">8.3 DHCP Discovery - FQDN Leads to DNS Query</h3>
<h4 id="purpose-144">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly uses DNS to retrieve additonal controller information upon receiving a FQDN of a controller.</p>
<h4 id="functionality-tags-64">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via DHCP Options)</p>
<h4 id="test-setup-145">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT is configured to request controller information via DHCP.</li>
<li>Ensure the EUT is configured to acquire an address via DHCP.</li>
</ol>
<h4 id="test-procedure-135">Test Procedure</h4>
<ol type="1">
<li>Configure the DHCP server to provide a controller URL with a FQDN.</li>
<li>Reboot the EUT.</li>
<li>Wait for the EUT to request an address.</li>
<li>Wait for the EUT to query the DNS with the FQDN.</li>
<li>Wait for the EUT to connect to the controller.</li>
</ol>
<h4 id="test-metrics-146">Test Metrics</h4>
<ol type="1">
<li>After the EUT receives a FQDN in the DHCP Offer, the EUT uses DNS to retrive additional information about the controller.</li>
</ol>
<h3 id="mdns">8.4 mDNS</h3>
<h4 id="purpose-145">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly implements mDNS.</p>
<h4 id="functionality-tags-65">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via mDNS, supports the Reboot:1 profile)</p>
<h4 id="test-setup-146">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT has mDNS enabled.</li>
<li>Ensure the controller exists on the same network as the EUT.</li>
<li>Ensure that the EUT has the Controller’s URL, which contains “.local.” is preconfigured on the EUT.</li>
<li>Ensure that a Subscription exists for the Boot! event on the EUT with the test Controller as the Recipient.</li>
</ol>
<h4 id="test-procedure-136">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to send a mDNS request for the FQDN.</li>
<li>Allow the controller to respond to the mDNS request.</li>
</ol>
<h4 id="test-metrics-147">Test Metrics</h4>
<ol type="1">
<li>After the EUT receieves a FQDN via DHCP containing “.local.” the EUT uses mDNS to resolve it.</li>
</ol>
<h3 id="mdns-and-message-transfer-protocols">8.5 mDNS and Message Transfer Protocols</h3>
<h4 id="purpose-146">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly advertises the MTP it supports. This use case is exclusive to CoAP, so this test case only applies to CoAP based Endpoints.</p>
<h4 id="functionality-tags-66">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via mDNS, supports CoAP)</p>
<h4 id="test-setup-147">Test Setup</h4>
<ol type="1">
<li>Ensure the EUT has mDNS enabled.</li>
<li>Ensure the Controller exists on the same network as the EUT.</li>
<li>For STOMP connections, ensure the Agent has an active connection to a STOMP broker.</li>
</ol>
<h4 id="test-procedure-137">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to acquire an address.</li>
<li>Wait for the EUT to send an unsolicited mDNS response.</li>
</ol>
<h4 id="test-metrics-148">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an unsolicated multicast DNS response containing in the answer section a record for each supported MTP.</li>
</ol>
<h3 id="dns---dns-record-requirements">8.6 DNS - DNS Record Requirements</h3>
<h4 id="purpose-147">Purpose</h4>
<p>The purpose of this test is to ensure the EUT provides valid DNS-SD records.</p>
<h4 id="functionality-tags-67">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via mDNS)</p>
<h4 id="test-setup-148">Test Setup</h4>
<ol type="1">
<li>Ensure mDNS is enabled on the EUT.</li>
</ol>
<h4 id="test-procedure-138">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Wait for the EUT to acquire a new address.</li>
<li>Wait for to the EUT to send a multicast mDNS advertisement.</li>
</ol>
<h4 id="test-metrics-149">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a multicast mDNS advertisement containing a TXT record for every supported MTP.</li>
<li>Every TXT record in the mDNS advertisement has a “path” and “name” attribute.</li>
</ol>
<h3 id="mdns-request-response">8.7 mDNS request response</h3>
<h4 id="purpose-148">Purpose</h4>
<p>The purpose of this test is to ensure the EUT will respond to mDNS requests.</p>
<h4 id="functionality-tags-68">Functionality Tags</h4>
<p>Conditional Mandatory (supports discovery via mDNS)</p>
<h4 id="test-setup-149">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT is configured to listen for mDNS requests.</li>
</ol>
<h4 id="test-procedure-139">Test Procedure</h4>
<ol type="1">
<li>Reboot the EUT.</li>
<li>Send an mDNS query to the multicast domain that includes the EUT.</li>
<li>Wait for an mDNS response from the EUT.</li>
</ol>
<h4 id="test-metrics-150">Test Metrics</h4>
<ol type="1">
<li>The EUT responds to the mDNS query with the proper information.</li>
</ol>
<h2 id="functionality-test-cases">9 Functionality Test Cases</h2>
<h3 id="use-of-the-timer-event">9.1 Use of the Timer! Event</h3>
<h4 id="purpose-149">Purpose</h4>
<p>The purpose of this test is to ensure the Timer! event can be configured, and the EUT correctly triggers the event.</p>
<h4 id="functionality-tags-69">Functionality Tags</h4>
<p>Conditional Mandatory (supports Device.LocalAgent.Controller.{i}.ScheduleTimer() command)</p>
<h4 id="test-setup-150">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-140">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: &quot;Device.LocalAgent.Controller.&lt;Controller ID&gt;.ScheduleTimer()&quot;
            input_args: {
                DelaySeconds: 60
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for the EUT to send a Notification.</li>
</ol>
<h4 id="test-metrics-151">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an OperateResponse with ScheduleTimer() in the executed_command element.</li>
<li>The EUT sends a Notify message with an event element containing Timer!</li>
</ol>
<h3 id="use-of-device.localagent.addcertificate">9.2 Use of Device.LocalAgent.AddCertificate()</h3>
<h4 id="purpose-150">Purpose</h4>
<p>The purpose of this test is to ensure the AddCertificate() operation on the EUT functions correctly.</p>
<h4 id="functionality-tags-70">Functionality Tags</h4>
<p>Conditional Mandatory (supports Device.LocalAgent.AddCertificate() command)</p>
<h4 id="test-setups">Test Setups</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Have an alternate certificate that the EUT hasn’t seen.</li>
</ol>
<h4 id="test-procedure-141">Test Procedure</h4>
<ol type="1">
<li><p>Send an Operate message to the EUT with the following structure:</p>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.AddCertificate()
            send_resp: true
            input_args: {
                Alias: addedCert
                Certificate: &lt;new certificate&gt;
            }
        }
    }
}</code></pre></li>
<li><p>Reconfigure the Controller to use the new certificate.</p></li>
<li><p>Reestablish a connection to the EUT.</p></li>
<li><p>Send a Get message to the EUT with the following structure:</p></li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.LocalAgent.Certificate.&quot;
        }
    }
}</code></pre>
<ol start="5" type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.Certificate.&lt;cert instance&gt;.Delete()
        }
    }
}</code></pre>
<h4 id="test-metrics-152">Test Metrics</h4>
<ol type="1">
<li>The EUT sends an OperateResponse after step 1.</li>
<li>The EUT accepts the connection after the Controller has been reconfigured to use the new certificate.</li>
<li>The EUT returns a GetResponse after step 4 which contains an instance with an Alias which matches the certificate added in step 1.</li>
<li>The EUT sends an OperateResponse after step 5.</li>
</ol>
<h3 id="upgraded-the-agents-firmware---autoactivate-enabled">9.3 Upgraded the Agent’s Firmware - Autoactivate enabled</h3>
<h4 id="purpose-151">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can download firmware and automatically activate it using the AutoActivate parameter.</p>
<h4 id="functionality-tags-71">Functionality Tags</h4>
<p>Conditional Mandatory (supports Firmware:1 profile)</p>
<h4 id="test-setup-151">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that the EUT has a Subscription to the TransferComplete! and Boot! events with the recipient being the instance used for testing.</li>
</ol>
<h4 id="test-procedure-142">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.FirmwareImage.&lt;inactive instance&gt;.Download()
            input_args: {
                AutoActivate: true
                URL: &lt;firmware URL&gt;
                Username: &lt;optional username&gt;
                Password: &lt;optional password&gt;
                FileSize: &lt;file size&gt;
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for the EUT to send a Notification</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.DeviceInfo.
        }
    }
}</code></pre>
<h4 id="test-metrics-153">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message after step 1 containing a oper_complete element with a command_name of Download()</li>
<li>The EUT sends a Notify message with a TransferComplete! event.</li>
<li>The EUT sends a Notify message with a Boot! event, with the FirmwareUpdated argument set to true.</li>
<li>The EUT sends a GetResponse message after step 3 which shows that <code>Device.DeviceInfo.ActiveFirmwareImage</code> matches the FirmwareImage instance on which the Download() operation was called; also that <code>Device.LocalAgent.SoftwareVersion</code> matches the expected version.</li>
</ol>
<h3 id="upgrading-the-agents-firmware---using-timewindow-immediate">9.4 Upgrading the Agent’s Firmware - Using TimeWindow, Immediate</h3>
<h4 id="purpose-152">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can activate a firmware image when a TimeWindow object is used with Immediately mode.</p>
<h4 id="functionality-tags-72">Functionality Tags</h4>
<p>Conditional Mandatory (supports Firmware:1 profile with Activate() operation)</p>
<h4 id="test-setup-152">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the EUT has a FirmwareImage instance containing inactive firmware.</li>
<li>Ensure the EUT has a Subscription instance for Boot! with the used for testing set as the Recipient.</li>
</ol>
<h4 id="test-procedure-143">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    mgs_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: &quot;Device.DeviceInfo.FirmwareImage.&lt;instance&gt;.Activate()&quot;
            input_args: {
                TimeWindow.1.Start: 1
                TimeWindow.1.End: 100
                TimeWindow.1.Mode: Immediately
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for Notify message from the EUT.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.DeviceInfo.SoftwareVersion&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-154">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message within 5 seconds with an OperationComplete element with a command_name of Activate().</li>
<li>The EUT sends a Notify message with a Boot! event and a FirmwareUpdated argument set to true.</li>
<li>The EUT responds to the Get message with a GetResponse containing a SoftwareVersion element with the expected software version.</li>
</ol>
<h3 id="upgrading-the-agents-firmware---using-timewindow-anytime">9.5 Upgrading the Agent’s Firmware - Using TimeWindow, AnyTime</h3>
<h4 id="purpose-153">Purpose</h4>
<p>The pupose of this test is to ensure the EUT can activate a firmware image when a TimeWindow instance used with the AnyTime mode.</p>
<h4 id="functionality-tags-73">Functionality Tags</h4>
<p>Conditonally Mandatory (implements Firmware:1 and Activate() operation)</p>
<h4 id="test-setup-153">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the EUT has a FirmwareImage instance containing inactive firmware.</li>
<li>Ensure the EUT has a Subscription to the Boot! event with the Controller used for testing set as the Recipient.</li>
</ol>
<h4 id="test-procedure-144">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    mdg_type: OPERATE
}
body {
    request {
        operate {
            command: &quot;Device.DeviceInfo.FirmwareImage.&lt;inactive instance&gt;.Activate()&quot;
            input_args: {
                TimeWindow.1.Start: 0
                TimeWindow.1.End:   120
                TimeWindow.1.Mode:  AnyTime
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a Notify message from the EUT.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.DeviceInfo.SoftwareVersion&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-155">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message within 2 minutes after step 1.</li>
<li>The Notify message has a OperationComplete element.</li>
<li>The EUT sends a Notify message with a Boot! event and a FirmwareUpdated argument set to true.</li>
<li>The EUT sends a GetResponse after step 3 with a SoftwareVersion parameter that matches the expected version.</li>
</ol>
<h3 id="upgrading-the-agents-firmware---validated-firmware">9.6 Upgrading the Agent’s Firmware - Validated Firmware</h3>
<h4 id="purpose-154">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can validate the integrity of downloaded firmware.</p>
<h4 id="functionality-tags-74">Functionality Tags</h4>
<p>Conditional Mandatory (supports Firmware:1 profile)</p>
<h4 id="test-setup-154">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that the EUT has a Subscription to the TransferComplete! event with the recipient being the instance used for testing.</li>
</ol>
<h4 id="test-procedure-145">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure using an invalid checksum:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: &quot;Device.DeviceInfo.FirmwareImage.&lt;inactive slot&gt;.Download()&quot;
            input_args: {
                URL: &lt;firmware URL&gt;
                CheckSumAlgorithm: &quot;SHA-1&quot;
                CheckSum: &quot;&lt;invalid checksum&gt;&quot;
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a Notify message from the EUT.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: &quot;Device.DeviceInfo.FirmwareImage.&lt;previously used instance&gt;.&quot;
        }
    }
}</code></pre>
<h4 id="test-metrics-156">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message with an OperationComplete element.</li>
<li>The ETU sends a Notify message with a TransferComplete! event.</li>
<li>The EUT sends a Get response with a Status parameter of ValidationFailed.</li>
</ol>
<h3 id="upgrading-the-agents-firmware---download-to-active-bank">9.7 Upgrading the Agent’s Firmware - Download to Active Bank</h3>
<h4 id="purpose-155">Purpose</h4>
<p>The purpose of this test is to ensure the EUT is capable downloading and installing new firmware for EUTs that may support only the active firmware bank.</p>
<h4 id="functionality-tags-75">Functionality Tags</h4>
<p>Conditional Mandatory (supports Firmware:1 profile)</p>
<h4 id="test-setup-155">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure that the EUT has a Subscription to the TransferComplete! event with the recipient being the instance used for testing.</li>
<li>Ensure the EUT has a Subscription to the Boot! event and the Controller used for testing is set as the Recipient.</li>
<li>Record the number of firmware banks the EUT supports.</li>
</ol>
<h4 id="test-procedure-146">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: &quot;Device.DeviceInfo.FirmwareImage.&lt;active firmware slot&gt;.Download()&quot;
            input_args: {
                URL: &quot;&lt;firmware URL&gt;&quot;
                AutoActivate: true
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Wait for a Notify message from the EUT.</li>
</ol>
<h4 id="test-metrics-157">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a Notify message with an OperationComplete or, if multiple firmware banks are supported, an error indicating that downloading to an active firmware slot is not allowed.</li>
<li>If an OperationComplete Notification is sent, the EUT sends a Notify message with a Boot! event and a FirmwareUpdated argument set to true.</li>
</ol>
<h3 id="upgrading-the-agents-firmware---cancelling-a-request-using-the-cancel-command">9.8 Upgrading the Agent’s Firmware - Cancelling a request using the Cancel() command</h3>
<h4 id="purpose-156">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can correctly cancel a Download() operation.</p>
<h4 id="functionality-tags-76">Functionality Tags</h4>
<p>Conditional Mandatory (supports Firmware:1 profile and Device.LocalAgent.Request.{i}.Cancel() operation)</p>
<h4 id="test-setup-156">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>Ensure the EUT has inactive firmware in one of FirmwareImage slots.</li>
<li>Ensure the EUT has a subscription to the Boot! event with the Controller used for testing set as the Recipient.</li>
</ol>
<h4 id="test-procedure-147">Test Procedure</h4>
<ol type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.DeviceInfo.FirmwareImage.&lt;valid instance&gt;.Activate()
            input_args: {
                TimeWindow.1.Start: 120
                TimeWindow.1.End:  500
                TimeWindow.1.Mode: AnyTime
            }
            send_resp: true
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.Request.&lt;returned in step 1&gt;.Cancel()
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Wait up to 500 seconds for a Boot! event from the EUT.</li>
<li>Send a Get message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Request.
        }
    }
}</code></pre>
<h4 id="test-metrics-158">Test Metrics</h4>
<ol type="1">
<li>The EUT sends a OperationResponse after step 1 with a executed_command element of Activate() and a req_obj_path referencing an entry in the Device.LocalAgent.Request table.</li>
<li>The EUT never sends a Boot! event.</li>
<li>In the GetResponse from the EUT after step 4, the Request instance is either non-existent or the Status parameter of the relevant request is either Cancelled or Cancelling.</li>
</ol>
<h3 id="adding-a-new-controller---onboardrequest">9.9 Adding a New Controller - OnBoardRequest</h3>
<h4 id="purpose-157">Purpose</h4>
<p>The purpose of this test is to ensure the EUT can handle the manual adding of a new Controller.</p>
<h4 id="functionality-tags-77">Functionality Tags</h4>
<p>Conditional Mandatory (supports Controller:1 profile with the ability to create instances of the Device.LocalAgent.Controller. object)</p>
<h4 id="test-setup-157">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
<li>A valid role instance is configured on the EUT for use with the new certificate.</li>
<li>A valid certificate instance is configured on the EUT</li>
<li>A secondary Controller is configured and ready to communicate with another endpoint.</li>
</ol>
<h4 id="test-procedure-148">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure.</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            create_objs {
                obj_path: Device.LocalAgent.Controller.
                param_settings: [
                    {
                        param: Alias
                        value: usp-111-Controller
                    },
                    {
                        param: EndpointID
                        value: &lt;new Controller endpoint ID&gt;
                    },
                    {
                        param: Enable
                        value: true
                    },
                    {
                        param: AssignedRole
                        value: &lt;valid role instance&gt;
                    }
                ]
            }
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            obj_path: Device.LocalAgent.Controller.&lt;new Controller instance&gt;.MTP.
            param_setttings: [
                {
                    param: Enable
                    value: true
                },
                {
                    param: Protocol
                    value: &lt;supported MTP&gt;
                },
                .
                .
                &lt;configure supported MTP&gt;
                .
                .
            ]
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.LocalAgent.Controller.&lt;new instance&gt;.SendOnBoardRequest()
        }
    }
}</code></pre>
<ol start="4" type="1">
<li>Allow the secondary Controller to receive the OnBoardRequest() and send a NotifyResponse.</li>
</ol>
<h4 id="test-metrics-159">Test Metrics</h4>
<ol type="1">
<li>The EUT is able to start a session with the secondary Controller.</li>
<li>The EUT sends a Notify message to the secondary Controller containing an OnBoardRequest element.</li>
</ol>
<h3 id="use-of-the-boot-event-and-bootparameters">9.10 Use of the Boot! event and BootParameters</h3>
<h4 id="purpose-158">Purpose</h4>
<p>The purpose of this test is to ensure the EUT correctly triggers the Boot! event and correctly includes the configured BootParameters.</p>
<h4 id="functionality-tags-78">Functionality Tags</h4>
<p>Conditional Mandatory (supports Reboot:1 profile)</p>
<h4 id="test-setup-158">Test Setup</h4>
<ol type="1">
<li>Ensure that the EUT and test equipment have the necessary information to send and receive USP Records to each other.</li>
</ol>
<h4 id="test-procedure-149">Test Procedure</h4>
<ol type="1">
<li>Send an Add message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: ADD
}
body {
    request {
        add {
            create_objs: [
                {
                    obj_path: Device.LocalAgent.Subscription.
                    param_settings: [
                        {
                            param: NotifType
                            value: Event
                        },
                        {
                            param: ReferenceList
                            value: Device.Boot!
                        },
                        {
                            param: Enable
                            value: true
                        }
                    ]
                },
                {
                    obj_path: Device.LocalAgent.Controller.&lt;Controller instance&gt;.BootParameter.
                    param_settings: [
                        {
                            param: Enable
                            value: true
                        },
                        {
                            param: ParameterName
                            value: Device.DeviceInfo.BootFirmwareImage
                        }
                    ]
                }
            ]
        }
    }
}</code></pre>
<ol start="2" type="1">
<li>Send an Operate message to the EUT with the following structure:</li>
</ol>
<pre><code>header {
    msg_id: &quot;&lt;msg_id&gt;&quot;
    msg_type: OPERATE
}
body {
    request {
        operate {
            command: Device.Reboot()
        }
    }
}</code></pre>
<ol start="3" type="1">
<li>Wait for a Notify message from the EUT.</li>
</ol>
<h4 id="test-metrics-160">Test Metrics</h4>
<ol type="1">
<li>After step 2 the EUT sends a Notify message with an event element containing a ParameterMap argument with Device.LocalAgent.BootFirmwareImage</li>
</ol>
