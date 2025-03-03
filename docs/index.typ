#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#import "typst-template.typ": *

#set smartquote(enabled: false)

#show: doc => conf(
  title: [USP – The User Services Platform],
  subtitle: [Issue: 1 Amendment 3 Corrigendum 1 #bbf-release[]],
  date: [Issue Date: February 2025],
  pagenumbering: none,
  cols: 1,
  linenumbering: none,
  info: (
    PYTHONDIR: [.\/..\/..\/install\/pandoc\/\/..\/python],
    analyticstag: [],
    autoSectionLabels: [true],
    bbfBuild: [],
    bbfCertProductType: [#strong[\<type of product>];],
    bbfCertProgram: [#strong[\<BBF.NNN>];],
    bbfContrib: [],
    bbfDraft: [],
    bbfExtra: [0],
    bbfIssue: [Issue],
    bbfMajor: [1],
    bbfMicro: [0],
    bbfMinor: [3],
    bbfMonth: [February],
    bbfNumber: [TP\-469],
    bbfPatch: [1],
    bbfProjectStream: [],
    bbfStatus: [],
    bbfTitle: [Conformance Test Plan for USP Agents],
    bbfType: [],
    bbfVersion: [1 Amendment 3 Corrigendum 1],
    bbfWorkArea: [],
    bbfYear: [2025],
    citation-style: [bbf.csl],
    copydate: [2025],
    date: [Issue Date: February 2025],
    description: [This repository contains the Broadband Forum
specification TP\-469, which is the test plan for certifying TR\-369
(USP) Agents.

The files in this document are used to build index.md, which is used to
render the text of TP\-469 for web consumption.

],
    description-meta: [USP – The User Services Platform:
Conformance Test Plan for USP Agents],
    doctitle: [TP\-469 – Conformance Test Plan for USP Agents],
    lastDelim: [ and ],
    link-citations: [true],
    linkReferences: [true],
    lofTitle: [

#heading(level: 3, outlined: false)[
  List of Figures
] <list-of-figures>

],
    lolTitle: [

#heading(level: 3, outlined: false)[
  List of Listings
] <list-of-listings>

],
    lotTitle: [

#heading(level: 3, outlined: false)[
  List of Tables
] <list-of-tables>

],
    nameInLink: [true],
    notice: [tp],
    numberSections: [false],
    pairDelim: [ and ],
    project: [The User Services Platform],
    reference-section-title: [References],
    repodesc: [specification source],
    reponame: [usp\-test],
    sectionsDepth: [\-1],
    shortname: [USP],
    siteurl: [index.html],
    status: [],
    subtitle: [Issue: 1 Amendment 3 Corrigendum 1 #bbf-release[]],
    summary: [],
    tagline: [Conformance Test Plan for USP Agents],
    template: [typst-template.typ],
    theme-color: [\#157878],
    title: [USP – The User Services Platform],
    title-prefix: [BBF],
    titleDelim: [ –],
    titleid: [title],
    toc: [false],
    uspMajor: [1],
    uspMinor: [2],
    version: [],
    website: [https:\/\/usp\-test.broadband\-forum.org],
    ),
  doc,
)

// This header block can be overridden by the typst-headers metadata variable.

#let bbf-table-fill(columns: none, header-rows: 1, x, y) = {
  if header-rows > 0 and y == 0 {white.darken(10%)}
  // XXX have disabled fill for even rows
  // else if calc.even(x) {red.lighten(98%)}
}

// scale = 1 will size the image at 1px = 1pt
#let bbf-image-scale = 1
#let bbf-image(scale: bbf-image-scale, ..args) = context {
  let named = args.named()
  if "width" in named or "height" in named {
    image(..args)
  } else {
    let (width, height) = measure(image(..args))
    layout(page => {
      // XXX should allow control over this hard-coded (1.0, 0.9)
      let (max_width, max_height) = (1.0 * page.width, 0.9 * page.height)
      let (new_width, new_height) = (scale * width, scale * height)
      if new_width > max_width {
        let width_scale = max_width / new_width
        new_width *= width_scale // so it's now max_width
        new_height *= width_scale
      }
      if new_height > max_height {
        let height_scale = max_height / new_height
        new_width *= height_scale
        new_height *= height_scale // so it's now max_height
      }
      image(..args, width: new_width, height: new_height)
    })
  }
}

#bbf-new-page[
#heading(level: 3, outlined: false)[
  Notice
] <sec:notice>]

The Broadband Forum is a non\-profit corporation organized to create
guidelines for broadband network system development and deployment. This
Test Plan is owned and copyrighted by the Broadband Forum, and portions
of this Test Plan may be owned and\/or copyrighted by Broadband Forum
members.

#heading(level: 3, outlined: false)[
  Intellectual Property
] <sec:intellectual-property>

Recipients of this document are requested to submit, with their
comments, notification of any relevant patent claims or other
intellectual property rights of which they may be aware that might be
infringed by any implementation of this Test Plan, and to provide
supporting documentation.

#heading(level: 3, outlined: false)[
  Terms of Use
] <sec:terms-of-use>

Recipients of this document may use it (a) for internal review and study
purposes, (b) to provide to the Broadband Forum the comments and
notification requested in the preceding paragraph, and (c) if the
Recipient is a Broadband Forum member, to implement the Test Plan in a
product or service made commercially available. Any other use of this
Test Plan is expressly prohibited without the prior written consent of
the Broadband Forum.

THIS TEST PLAN IS BEING OFFERED WITHOUT ANY WARRANTY WHATSOEVER, AND IN
PARTICULAR, ANY WARRANTY OF NONINFRINGEMENT AND ANY IMPLIED WARRANTIES
ARE EXPRESSLY DISCLAIMED. ANY USE OF THIS TEST PLAN SHALL BE MADE
ENTIRELY AT THE USER’S OR IMPLEMENTER’S OWN RISK, AND NEITHER THE FORUM,
NOR ANY OF ITS MEMBERS OR SUBMITTERS, SHALL HAVE ANY LIABILITY
WHATSOEVER TO ANY USER, IMPLEMENTER OR THIRD PARTY FOR ANY DAMAGES OF
ANY NATURE WHATSOEVER, DIRECTLY OR INDIRECTLY, ARISING FROM THE USE OF
THIS TEST PLAN, INCLUDING BUT NOT LIMITED TO, ANY CONSEQUENTIAL,
SPECIAL, PUNITIVE, INCIDENTAL AND INDIRECT DAMAGES.

All copies of this Test Plan (or any portion hereof) must include the
notices, legends and other provisions set forth on this page.

#bbf-note[
© 2025, The Broadband Forum. All rights reserved. This Broadband Forum
document (TP\-469) specifies the Test Plan on which is based the
#strong[\<BBF.NNN>]; Certification Program for #strong[\<type of
product>]; products. Through an open selection process, the Broadband
Forum entered into an agreement with one or more independent Test
Agencies to offer commercial testing services against this Test Plan and
to confirm results to the Broadband Forum in connection with the Forum’s
delivery of #strong[\<BBF.NNN>]; Certification. Offering Certification
testing services against this Test Plan is reserved to the Test Agencies
duly authorized by the Broadband Forum. Broadband Forum members can
independently test against TP\-469, but may only produce limited reports
which only detail where a given product has failed a test case.

NOTE: The right to display a Broadband Forum Certification Logo may only
be granted by the Broadband Forum, and that right is available only to
Broadband Forum members that have successfully passed certification
testing by a duly authorized Test Agency. Further details on the
Broadband Forum Certification Programs can be found at
#link("http://www.broadband-forum.org")[http:\/\/www.broadband\-forum.org].
]

#bbf-new-page[
]

#heading(level: 3, outlined: false)[
  Issue History
] <sec:issue-history>

#bbf-issue-history[
  #show table.cell.where(y: 0): strong
  #set par(justify: false)
  #set text(hyphenate: true)
  #show regex("\>,"): "," + sym.zws
  #show regex("\>\."): "." + sym.zws
  #table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    fill: bbf-table-fill.with(columns: 3, header-rows: 1),
    table.header(
    [Issue Number
    ],
    [Approval Date
    ],
    [Changes
    ]),
    [#link("https://www.broadband-forum.org/download/TP-469.pdf")[Release
    1.0]
    ],
    [October 2019
    ],
    [- First release of this test plan, containing test cases for basic
      compliance with TR\-369\/USP
    ],
    [Release 1.0.1
    ],
    [April 2020
    ],
    [- Deprecated test 7.3
    - Added flag to the features list to indicate which features are
      "not\-in\-force" and not yet available for certification
    - Various procedure and metric fixes
    ],
    [#link("https://www.broadband-forum.org/download/TP-469_Corrigendum-2.pdf")[Release
    1.0.2]
    ],
    [June 2020
    ],
    [- Both mandatory and conditional mandatory tests can use alternate
      objects or parameters if available
    - Updated features and requirements
    - Altered test setup of 1.50 to include three objects
    - Fixed metrics of 1.25 to use new DeleteResp logic
    - Fixed tests 1.16 and 1.21 to use the correct error codes
    - Fixed test 1.20 to only check for at least one error
    - Fixed test 4.1 to include "OnBoardRequest()" as a conditional
      requirement
    - Fixed test 1.32 to use new DeleteResp logic
    - Fixed tests 1.73, 1.74, 1.75 to use new GetSupportedDM
      first\_level\_only logic
    - Fixed error code metric of test 1.8
    ],
    [Release 1.0.3
    ],
    [October 2020
    ],
    [- The metrics of test 1.9 now do not imply order
    - Test 1.22 metric now requires "at least one" element rather than a
      "single" element
    - Renamed test 1.23
    - Fixed the metric of test 1.38 to include the instance identifier
      of the path
    - Reworded the purpose of test 1.41
    - Clarified the test setup of tests 1.66 and 1.67
    - Fixed a typo in test 6.1 metrics (ServerRetryInitialMultiplier to
      ServerRetryIntervalMultiplier)
    - Fixes other typographical errors
    ],
    [#link("https://www.broadband-forum.org/download/TP-469_Amendment-1.pdf")[Release
    1.1]
    ],
    [January 2022
    ],
    [- Adds test 1.78 Removal of subscriptions that have no associated
      controller
    - Adds test 1.80 GetSupportedProtocol
    - Adds language reinforcing required tests based on supported
      features
    - Adds test case 1.81 to test automatic unique key generation by the
      Agent
    - Adds negative test metrics to several Set and Delete tests to
      validate that operations did not occur upon error (1.7, 1.8, 1.14,
      1.15, 1.20, 1.24, 1.27, 1.28, 1.31, 1.32, 1.33, 1.34, 1.35)
    - Adds section 10 for bulk data collection tests
    - Adds tests 1.82 and 1.83 to validate Get and GetInstances using
      expressions that match zero objects
    - Adds test 1.84 to exercise the use of search paths in
      Subscriptions
    - Defines deprecation for tests
    - Deprecates test 1.63 in favor of test 1.79
    - Deprecates test 9.1 in favor of test 9.11
    - Deprecates tests 2.3, 2.4, and 2.5
    - Completely deletes test 1.69
    - Updates functionality tag on test 1.71 to "supports at least one
      multi\-instance object"
    - Clarifies the definition of an empty oper\_success element in test
      1.32
    - Rewrites test 2.20 to accomplish its original intent
    - Changes test 3.6 to check that an Agent does not accept TLS
      renegotiation
    - Changes test 2.15 and 2.16 to use "Enable" rather than "Alias" as
      a test parameter
    - Simplifies test 4.1
    - Various typographical fixes, some in test procedure path names
    - Normalizes all protobuf examples in test procedures
    - Fixes test 2.20 to use the correct permissions
    - Fixes test 1.47 to use the correct operator
    - Eases the requirements of test 9.7 for implementation flexibility
    - Removes the concept of "not\-in\-force" test cases and features
    - Updates tests 1.59, 1.84 to use allow\_partial false”
    - Allows tests 1.3, 1.7, 1.8, 1.21 to use only an invalid parameter
      value (not an invalid parameter) and accept 7012 as an acceptable
      error code
    ],
    [#link("https://www.broadband-forum.org/download/TP-469_Amendment-2.pdf")[Release
    1.2]
    ],
    [November 2022
    ],
    [- Deprecates COAP tests
    - Adds MQTT test cases
    - Adds tests 1.86, 1.87 to test Get with unmatched search path
    - Adds new Connect Record test cases to STOMP and WebSocket sections
    - Adds MQTT bulk data collection test cases
    - Adds test 1.88 to check that unique keys are always treated as
      required
    - Adds test 1.89 to exercise max\_depth feature in Get
    - Adds test 1.90 to check Delete with unmatched search path
    - Adds test 1.91 to very an Agent ignores unknown arguments in a
      command
    - Adds test 1.92 to test that operate uses default values when
      absent
    - Updates test 1.23 metrics to require the return of an empty
      oper\_success
    - Updates GetSupportedDM test cases to check for new USP 1.2 fields
    - Updates tests 1.3, 1.4, 1.6, 1.21 to include additional test
      metrics
    - Updates tests 1.64 and 1.65 to check for correct command\_key
      value
    - Updates tests to account for requirement R\-MTP.5 in USP 1.2
    - Fixes metric in test 1.20 and 1.21 to allow for single failure
    - Fixes test setup in 9.4, 9.5, 9.6
    - Fixes test 8.5 to remove MTP specific language and require mDNS
      info
    - Reverts metric in test 6.7
    - Fixes test 1.47 test metrics for correct equivalence
    - Set send\_resp to true for several Operate tests where needed
    - Various typographical fixes
    ],
    [#link("https://www.broadband-forum.org/download/TP-469_Amendment-3.pdf")[Release
    1.3]
    ],
    [July 2024
    ],
    [- Deprecates tests 6.9 and 7.6
    - Error code requirements in the test metrics of several tests have
      been clarified or loosened. This change applies to tests 1.3, 1.4,
      1.6, 1.7, 1.8, 1.9, 1.14, 1.15, 1.16, 1.17, 1.26, 1.28, 1.30,
      1.31, 1.41, 1.42, and 1.77.
    - Updates 11.11 to check that no additional USP records are sent
    - Updates 1.20 to require SetResponse containing an error rather
      than a USP Error message
    - Updates 2.18 to allow for OperateResponse with an error or a USP
      Error message
    - Fixes test 9.3 test setup to require the proper subscriptions
    - Updates 2.21 and 2.22 with proper role setup and behavior
    - Adds new tests 1.93 and 1.94 for TriggerAction
    - Adds new tests 1.95, 2.23 and 2.24 for Add message with Search
      Expression
    - Adds new tests 2.25 and 2.26 for Add message when some parameters
      aren’t writable
    - Adds new test 1.96 for non\-functional unique key immutability
    - Adds new test 2.27 for the use of SecuredRole
    - Adds new tests 1.97 and 1.98 to verify GetSupportedDMResponse
      fields
    - Adds new test 7.11 for WebSocket response with no
      bbf\-usp\-protocol
    - TraceRoute no longer specifically required to run Asyc operation
      tests 1.64 and 1.65
    - Updates 1.88 to use a unique key that starts with a number as an
      invalid value, rather than an empty unique key. Updates test
      parameter to Alias.
    - Updates tests 11.9 and 11.13 to be compatible with MQTT 3.1.1
    - Various other typographical and procedure fixes
    ],
    [#link("https://www.broadband-forum.org/download/TP-469_Amendment-3_Corrigendum-1.pdf")[Release
    1.3.1]
    ],
    [February 2025
    ],
    [- Corrections to the Feature ID Table
    - Fixed typo in test 1.86
    - Fixed tests 2.23 \- 2.26 to use 'Param' instead of invalid 'Obj'
      permissions
    ]
  )
]

Comments or questions about this Broadband Forum should be directed to
#link("mailto:info@broadband-forum.org")[info\@broadband\-forum.org].

#heading(level: 3, outlined: false)[
  Work Area Directors
] <sec:bbfworkarea-work-area-directors>

#bbf-wads[
  #show table.cell.where(y: 0): strong
  #set par(justify: false)
  #set text(hyphenate: true)
  #show regex("\>,"): "," + sym.zws
  #show regex("\>\."): "." + sym.zws
  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    fill: bbf-table-fill.with(columns: 4, header-rows: 1),
    table.header(
    [Name
    ],
    [Company
    ],
    [Email
    ],
    [Role
    ]),
    [Jason Walls
    ],
    [QA Cafe, LLC
    ],
    [jason\@qacafe.com
    ],
    [Broadband User Services Work Area Director
    ],
    [John Blackford
    ],
    [Vantiva
    ],
    [john.blackford\@vantiva.com
    ],
    [Broadband User Services Work Area Director
    ]
  )
]

#heading(level: 3, outlined: false)[
  Editors
] <sec:editors>

#bbf-editors[
  #show table.cell.where(y: 0): strong
  #set par(justify: false)
  #set text(hyphenate: true)
  #show regex("\>,"): "," + sym.zws
  #show regex("\>\."): "." + sym.zws
  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    fill: bbf-table-fill.with(columns: 4, header-rows: 1),
    table.header(
    [Name
    ],
    [Company
    ],
    [Email
    ],
    [Role
    ]),
    [Jason Walls
    ],
    [QA Cafe, LLC
    ],
    [jason\@qacafe.com
    ],
    [Editor
    ]
  )
]

#pagebreak()

#outline(
  title: [Table of Contents],
  depth: 3
)

#outline(
  title: [List of Figures],
  target: figure.where(kind: image)
)

#outline(
  title: [List of Tables],
  target: figure.where(kind: table)
)

#show link: underline

#pagebreak()

== Executive Summary <sec:executive-summary>

Testing is crucial to promoting the interoperability and adoption of
standards. To meet this, the Broadband Forum regularly produces test
suites that validate the conformance of implementations of their
standards. This specification defines the test setup, test procedures,
and test metrics to validate Agent and implementations of the
#link("https://usp.technology")[User Services Platform (USP)], published
as BBF TR\-369.

This test plan is used to validate USP Agent implementations for the
#link("https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification")[BBF.369
USP Agent Certification Program]. Companies looking to certify their
products, or to acquire certified products, can find full details on the
program, approved test tools and labs, and the list of certified
products
#link("https://www.broadband-forum.org/testing-and-certification-programs/bbf-369-usp-certification")[here].

== Purpose <sec:purpose>

This purpose of this document is to provide a definitive guide for
validating the compliance of USP Agents in accordance with the
specification.

== Scope <sec:scope>

The tests defined below are intended to validate the specific
requirements outlined in the USP specification, as well as those
requirements defined in the Device:2 Data Model for USP Agents for
objects, parameters, commands, and events necessary for the operation of
USP.

= Test Setup <sec:test-setup>

== Test Equipment <sec:test-equipment>

There are a number of components necessary to the implementation of this
test suite.

#strong[Traffic Generator]; \- One or more traffic generators are
necessary in order to transmit the required traffic to execute the test
procedures. Traffic generation can be done with script\-able, real
implementations of DHCP servers, mDNS endpoints, and USP endpoints (for
example), or can be simulated through other means. For tests that
exercise the presence of multiple Controllers or agents, the traffic
generators can each represent a single endpoint, or multiple endpoints,
depending on its capabilities, as long as the traffic can be
differentiated by the Endpoint Under Test.

#strong[Analyzer]; \- One or more traffic analyzers are necessary to
confirm the receipt of messages and evaluate the test metrics outlined
in the tests below. This analyzer may exist at the traffic generator
source, in\-line, or accessed through a replicated interface that will
push traffic to the analyzer.

#strong[Test Network]; \- The tests below require IP layer connectivity
between the Traffic Generator and the Endpoint Under Test (EUT). Steps
SHOULD be taken to unsure that the underlying network does not interfere
with the test procedures or test metrics.

== Test Setup and Execution <sec:test-setup-and-execution>

=== Basic Test Setup <sec:basic-test-setup>

#figure(
  caption: [Figure 1 – Basic Test Setup
    ])[
  #bbf-image("././figure-1.png")<img:basic-test-setup>
] <fig:basic-test-setup>

=== Functionality Tags <sec:functionality-tags>

USP contains both required and optional functionality. To ensure that
all different classes of device can exercise this test suite, tests are
marked as "Mandatory", "Conditional Mandatory", or "Deprecated". This is
indicated in each individual test case under the "Functionality Tag".

Tests that are "Deprecated" represent tests that were removed or
replaced with newer tests.

==== Alternate parameters, objects, commands, and events in test procedures <sec:alternate-parameters-objects-commands-and-events-in-test-procedures>

For tests that make use of particular parameter, object, command, event
to validate the test metrics, a different subject can be substituted
that meets the needs of the test. For example, if an EUT does not
support the Reboot:1 profile, another synchronous operation can be
substituted for tests 1.61 and 1.62.

=== Endpoint Requirements and Metadata Collection <sec:endpoint-requirements-and-metadata-collection>

==== Required Profiles <sec:required-profiles>

The Device:2 Data Model for USP Agents outlines several profiles that
contain data model objects, parameters, commands, and events necessary
to the operation of USP. In order to be able to perform the tests below,
a USP Agent MUST implement, at minimum, the following profiles:

- LocalAgent:1
- Subscriptions:1
Conditional mandatory tests may require the implementation of additional
profiles.

==== Test Cases Required by Profile and Option Support <sec:test-cases-required-by-profile-and-option-support>

Those seeking to utilize this test plan can use the following feature
IDs to specify their support for conditional mandatory test cases. Since
the types of endpoints under test may vary widely in use cases and
complexity, this list is meant to act as a guide to ensure that many
kinds of products can achieve compliance. However, when determining
which tests must be passed to achieve compliance, testers must know
that:

#strong[An Endpoint Under Test (EUT) MUST complete all Mandatory test
cases, and MUST complete all Conditional Mandatory test cases for ALL
features supported by the EUT (see table below).];

#[
  #show table.cell.where(y: 0): strong
  #set par(justify: false)
  #set text(hyphenate: true)
  #show regex("\>,"): "," + sym.zws
  #show regex("\>\."): "." + sym.zws
  #table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    fill: bbf-table-fill.with(columns: 4, header-rows: 1),
    table.header(
    [Feature ID
    ],
    [Feature name
    ],
    [Test Cases
    ],
    [Notes
    ]),
    [1
    ],
    [At least one command
    ],
    [1.61, 1.62
    ], [],
    [2
    ],
    [At least one command with input arguments
    ],
    [1.79
    ], [],
    [3
    ],
    [At least one asynchronous command
    ],
    [1.64, 1.65
    ], [],
    [4
    ],
    [Subscription.{i}.NotifExpiration parameter
    ],
    [1.56
    ],
    [An extension to the Subscription:1 profile
    ],
    [5
    ],
    [Controller:1 profile
    ],
    [1.59
    ], [],
    [6
    ],
    [Device.LocalAgent.Subscription.{i}.TimeToLive
    ],
    [1.55
    ], [],
    [7
    ],
    [Controller:1 profile (writeable)
    ],
    [1.78, 9.9
    ],
    [EUT allows the creation of Device.LocalAgent.Controller.{i}.
    objects
    ],
    [8
    ],
    [Device.LocalAgent.Controller.{i}.SendOnBoardRequest()
    ],
    [1.60, 9.9
    ], [],
    [9
    ],
    [Device.ScheduleTimer()
    ],
    [1.79
    ], [],
    [10
    ],
    [Reboot:1 profile
    ],
    [1.61, 1.62, 9.10
    ], [],
    [11
    ],
    [(Removed)
    ], [], [],
    [12
    ],
    [ControllerTrust:1 profile
    ],
    [2.9, 2.10
    ], [],
    [13
    ],
    [ControllerTrust:1 profile (writeable)
    ],
    [2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.20, 2.21,
    2.22, 2.23, 2.24, 2.25, 2.26
    ],
    [Additionally supports at least one role that allows object
    creation, or supports writable parameters in
    Device.LocalAgent.ControllerTrust.{i}.Role.{i}.
    ],
    [14
    ],
    [(Removed)
    ], [], [],
    [15
    ],
    [TLS at the MTP Layer
    ],
    [4.1
    ], [],
    [16
    ],
    [CoAP MTP (DEPRECATED)
    ],
    [5.\*
    ], [],
    [17
    ],
    [STOMP MTP
    ],
    [6.\*
    ],
    [Excludes 6.8 unless option 18 is supported
    ],
    [18
    ],
    [STOMPHeartbeat:1 profile
    ],
    [6.8
    ], [],
    [19
    ],
    [WebSocket MTP
    ],
    [7.\*
    ], [],
    [20
    ],
    [(removed)
    ], [], [],
    [21
    ],
    [Discovery via DHCP Options
    ],
    [8.1, 8.2, 8.3
    ], [],
    [22
    ],
    [Discovery via mDNS
    ],
    [8.4, 8.5, 8.6, 8.7
    ], [],
    [23
    ],
    [Secure Message Exchange (TLS for USP Record Integrity)
    ],
    [3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.13
    ], [],
    [24
    ],
    [USP session context
    ],
    [2.6, 2.7, 2.8, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14, 3.15
    ], [],
    [25
    ],
    [Device.LocalAgent.AddCertificate()
    ],
    [9.2
    ], [],
    [26
    ],
    [Firmware:1 profile
    ],
    [9.3, 9.5, 9.6, 9.7
    ], [],
    [27
    ],
    [Firmware:1 profile (Activate)
    ],
    [9.4, 9.5
    ],
    [Supports Firmware:1 profile and additionally supports the
    Activate() operation
    ],
    [28
    ],
    [Device.LocalAgent.Request.{i}.Cancel()
    ],
    [9.8
    ],
    [Applies only if option 26 is supported
    ],
    [29
    ],
    [(Removed)
    ], [], [],
    [30
    ],
    [Device.DeviceInfo.BootFirmwareImage
    ],
    [9.10
    ], [],
    [31
    ],
    [The product supports at least one nested multi\-instance object
    ],
    [1.10, 1.71, 1.83
    ], [],
    [32
    ],
    [HTTP bulk data collection with JSON encoding
    ],
    [10.1, 10.2, 10.5, 10.6, 10.7, 10.8, 10.9
    ], [],
    [33
    ],
    [HTTP bulk data collection with CSV encoding
    ],
    [10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9
    ], [],
    [34
    ],
    [Bulk data collection via the Push! Event
    ],
    [10.10, 10.11, 10.12
    ], [],
    [35
    ],
    [MQTT MTP, version 3.1.1
    ],
    [11.\*
    ],
    [Excludes 11.4, 11.7, 11.8, 11.10, & 11.15, MQTT 5.0 only tests
    ],
    [36
    ],
    [MQTT MTP, version 5.0
    ],
    [11.\*
    ], [],
    [37
    ],
    [TriggerAction
    ],
    [1.93, 1.94
    ],
    [Supports the Device.LocalAgent.Subscription.{i}.TriggerAction and
    Device.LocalAgent.Subscription.{i}.TriggerConfigSettings parameters
    ],
    [38
    ],
    [Command with input arguments
    ],
    [1.97
    ],
    [Supports a command that includes one or more input arguments
    ],
    [39
    ],
    [Event with arguments
    ],
    [1.98
    ],
    [Supports an event that includes one or more arguments
    ],
    [40
    ],
    [Device.LocalAgent.ControllerTrust.SecuredRoles
    ],
    [2.27
    ],
    [Supports the use of the SecuredRole for Secured Parameters
    ],
    [41
    ],
    [Bulk data collection over MQTT
    ],
    [10.13
    ], []
  )
]

==== Elements Specified in the Test Procedure <sec:elements-specified-in-the-test-procedure>

Many of the mandatory and conditional mandatory tests specify the
objects, parameters, or operations to be used for the test. If the
specific elements are not supported by the EUT, other elements that will
satisfy the test criteria MAY be used instead. If so, the test report
MUST include the alternate elements used.

==== Required EUT Information and Resources <sec:required-eut-information-and-resources>

In order to be able to perform the tests and create a report of the
results, the following must be provided concerning the Endpoint Under
Test:

+ The software and\/or firmware version of the EUT.
+ The number of firmware banks available if the Firmware:1 profile is
  supported.
+ A list of the feature IDs supported.
+ If the service elements specified in the tests are not supported,
  provide a list of alternate elements used in the testing.

=== Clean\-Up Procedures <sec:clean-up-procedures>

A number of tests that make changes to the EUT have procedures that are
not part of the validation portion of the test case. These procedures
are intended to "clean up" any changes that were made during the test to
ensure that the EUT is in a relatively known state from one test case to
the next. The most obvious example is using the Delete message to remove
any objects that were added as part of the procedure, but the clean\-up
procedure may include any number of steps.

== Universal Test Metrics <sec:universal-test-metrics>

Due to the nature of performative testing of protocol messages, certain
requirements in the specification are effectively tested every time.
Writing additional test cases for these metrics is unnecessary, but the
requirements must still be met by endpoint implementations.

+ The Endpoint ID of the Endpoint Under Test is valid (ARC.3, ARC.4,
  ARC.5, and the requirements outlined in the
  #link("http://usp.technology/specification/architecture/#endpoint_identifier")[authority\-scheme
  table]).
+ The USP records and USP messages of the Endpoint Under Test are valid
  according to the usp\-record.proto and usp\-msg.proto schemas (ENC.0,
  ENC.1).
+ The Path Names and Search Paths used in messages sent by the Endpoint
  Under Test are valid according to
  #link("http://usp.technology/specification/architecture/#data_model_path_grammar")[Data
  Model Path Grammar] and TR\-106 (ARC.7).
+ Path Names in messages originating from the EUT use instance number
  addressing (R\-MSG.3).

=== Appropriate Error Codes <sec:appropriate-error-codes>

When test cases specify that the EUT include "an appropriate error
code", the error code must be applicable to the USP message for which it
was triggered, as is documented in the
#link("https://usp.technology/specification/index.html#sec:error-codes")[Error
Codes table].

== Notes about test case descriptions <sec:notes-about-test-case-descriptions>

Each of the test cases below have the following sections:

#strong[Purpose]; \- The purpose describes the reasoning for the test
case, based on the normative requirements defined in USP.

#strong[Functionality Tag]; \- The functionality tag indicates whether
the test is mandatory or conditional mandatory. If it is the latter,
this section will list any additional Device:2 profiles necessary to the
performance of the test case.

#strong[Test Setup]; \- The test setup section indicates any special
prior conditions that must be configured before performing the test.

#strong[Test Procedure]; \- The procedure indicates the steps, in order,
taken to perform the test.

#strong[Test Metrics]; \- The metrics indicate the required behavior
that must be observed to consider the test passed.

=== Use of examples <sec:use-of-examples>

The test setup, procedure, and metrics in each test case may contain
examples of the data to be sent to or received from the EUT. In these
examples, elements that are to be filled with a known value dependent on
the protocol’s behavior are indicated with greater\-than\/less\-than
brackets (\<for example>), to indicate a variable. These examples should
not be taken literally.

= 1 Messages and Path Names <sec:messages-and-path-names>

== 1.1 Add message with allow partial false, single object, required parameters succeed <sec:add-message-with-allow-partial-false-single-object-required-parameters-succeed>

=== Purpose <sec:purpose-1>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, and all
required parameters to be set upon Object Creation succeed.

=== Functionality Tag <sec:functionality-tag>

Mandatory

=== Test Setup <sec:test-setup-1>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send an AddResp.
+ Record the instance identifier of the created object as reported by
  the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics>

+ The EUT sends an AddResp.
+ The AddResp contains a single CreatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains no parameter errors and 3 elements in the
  unique key map: Alias, Recipient, and ID. Alternatively, the
  OperationSuccess contains 2 elements in the unique key map if the
  Alias parameter is not supported: Recipient, and ID.
+ The EUT creates the Subscription object.
+ The Subscription object’s values match the values set in the
  `param_settings` element.

== 1.2 Add message with allow partial true, single object, required parameters succeed <sec:add-message-with-allow-partial-true-single-object-required-parameters-succeed>

=== Purpose <sec:purpose-2>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to true, and all
required parameters to be set upon Object Creation succeed.

=== Functionality Tag <sec:functionality-tag-1>

Mandatory

=== Test Setup <sec:test-setup-2>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-1>

+ Send an Add message to the EUT with the following structure:

  ```
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
             param: 'Enable'
             value: 'true'
           }
          param_settings {
             param: 'ID'
             value: 'add2'
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
+ Allow the EUT to send an AddResp.
+ Record the instance identifier of the created object as reported by
  the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-1>

+ The EUT AddResp is valid.
+ The AddResp contains a single CreatedObjectResult that has an
  OperationStatus of OperationSuccess. The OperationSuccess contains no
  parameter errors and 3 elements in the unique key map: Alias,
  Recipient, and ID. Alternatively, the OperationSuccess contains 2
  elements in the unique key map if the Alias parameter is not
  supported: Recipient, and ID.
+ The EUT creates the Subscription object.
+ The Subscription object’s values match the values set in the
  `param_settings` element.

== 1.3 Add message with allow partial false, single object, required parameters fail <sec:add-message-with-allow-partial-false-single-object-required-parameters-fail>

=== Purpose <sec:purpose-3>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, and at
least one required parameter fails, and only a single object is set.

=== Functionality Tag <sec:functionality-tag-2>

Mandatory

=== Test Setup <sec:test-setup-3>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-2>

+ Send an Add message to the EUT with the following structure:

  ```
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
             value: 'InvalidValue'
             required: true
           }
          param_settings {
             param: 'ID'
             value: 'add3'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          param_settings {
             param: 'ReferenceList'
             value: 'Device.LocalAgent.SoftwareVersion'
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error message.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-2>

+ The EUT sends an Error message.
+ The Error message contains an appropriate error code with the
  `param_errs` element containing a single error with a `param_path`
  that indicates the Enable parameter, and an appropriate error code.
+ The EUT did not create a new Subscription object.

== 1.4 Add message with allow partial false, single invalid object <sec:add-message-with-allow-partial-false-single-invalid-object>

=== Purpose <sec:purpose-4>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, and a
single invalid object is set.

=== Functionality Tag <sec:functionality-tag-3>

Mandatory

=== Test Setup <sec:test-setup-4>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-3>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }

  body {
    request {
      add {
        allow_partial: false
        create_objs {
          obj_path: 'Device.LocalAgent.InvalidObject.'
          param_settings {
             param: 'Enable'
             value: 'true'
           }
          param_settings {
             param: 'ID'
             value: 'add4'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          param_settings {
             param: 'ReferenceList'
             value: 'Device.LocalAgent.SoftwareVersion'
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error message.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-3>

+ The EUT sends an Error message.
+ The Error message contains an appropriate error code with the
  `param_errs` element containing a single error with a `param_path` of
  'Device.LocalAgent.InvalidObject.', and an appropriate error code.
+ The EUT did not create a new Subscription object.

== 1.5 Add message with allow partial false, multiple objects <sec:add-message-with-allow-partial-false-multiple-objects>

=== Purpose <sec:purpose-5>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, multiple
objects are attempted, and all required parameters to be set upon Object
Creation succeed.

=== Functionality Tag <sec:functionality-tag-4>

Mandatory

=== Test Setup <sec:test-setup-5>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-4>

+ Send an Add message to the EUT with the following structure:

  ```
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
             param: 'ID'
             value: 'add51'
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
        create_objs {
          obj_path: 'Device.LocalAgent.Subscription.'
          param_settings {
             param: 'Enable'
             value: 'true'
           }
          param_settings {
             param: 'ID'
             value: 'add52'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          param_settings {
             param: 'ReferenceList'
             value: 'Device.LocalAgent.EndpointID'
             required: true
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp.
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier 1>.'
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier 2>.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
  msg_id: '<msg_id>'
  msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier 1>.'
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier 2>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-4>

+ The EUT AddResp is valid.
+ The AddResp contains two CreatedObjectResults that each have an
  OperationStatus of OperationSuccess. The OperationSuccess elements
  contains no parameter errors and 3 elements in the unique key map:
  Alias, Recipient, and ID. Alternatively, the OperationSuccess contains
  2 elements in the unique key map if the Alias parameter is not
  supported: Recipient, and ID.
+ The EUT creates the Subscription objects.
+ The first Subscription object’s values match the values set in the
  `param_settings` element.
+ The second Subscription object’s values match the values set in the
  `param_settings` element.

== 1.6 Add message with allow partial false, multiple objects with an invalid object <sec:add-message-with-allow-partial-false-multiple-objects-with-an-invalid-object>

=== Purpose <sec:purpose-6>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, multiple
objects are attempted, and one of the objects is invalid.

=== Functionality Tag <sec:functionality-tag-5>

Mandatory

=== Test Setup <sec:test-setup-6>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-5>

+ Send an Add message to the EUT with the following structure:

  ```
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
             param: 'ID'
             value: 'add61'
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
        create_objs {
          obj_path: 'Device.LocalAgent.InvalidObject.'
          param_settings {
             param: 'Enable'
             value: 'true'
           }
          param_settings {
             param: 'ID'
             value: 'add62'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          param_settings {
             param: 'ReferenceList'
             value: 'Device.LocalAgent.EndpointID'
             required: true
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-5>

+ The EUT sends an Error message.
+ The Error message contains an appropriate error code with the
  `param_errs` element containing a single error with a `param_path` of
  'Device.LocalAgent.InvalidObject.', and an appropriate error code.
+ The EUT did not create a new Subscription object.

== 1.7 Add message with allow partial false, multiple objects, required parameters fail in single object <sec:add-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object>

=== Purpose <sec:purpose-7>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to false, and at
least one required parameter fails in one of multiple objects.

=== Functionality Tag <sec:functionality-tag-6>

Mandatory

=== Test Setup <sec:test-setup-7>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-6>

+ Send an Add message to the EUT with the following structure:

  ```
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
             value: 'InvalidValue'
             required: true
           }
          param_settings {
             param: 'ID'
             value: 'add71'
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
        create_objs {
          obj_path: 'Device.LocalAgent.Subscription.'
          param_settings {
             param: 'Enable'
             value: 'true'
           }
          param_settings {
             param: 'ID'
             value: 'add72'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error.
+ Send a Get message to the EUT with the request path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-6>

+ The EUT sends an Error message.
+ The Error message contains an appropriate error code with the
  `param_errs` element containing a single error with a `param_path`
  that indicates the Enable parameter, and an appropriate error code.
+ The GetResp from the EUT does not contain a Subscription instance with
  ID 'add71' or 'add72'.

== 1.8 Add message with allow partial true, required parameters fail, invalid type, single object <sec:add-message-with-allow-partial-true-required-parameters-fail-invalid-type-single-object>

=== Purpose <sec:purpose-8>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to true, and at
least one required parameter fails (with an invalid value) in a single
object.

=== Functionality Tag <sec:functionality-tag-7>

Mandatory

=== Test Setup <sec:test-setup-8>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-7>

+ Send an Add message to the EUT with the following structure:

  ```
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
             param: 'Enable'
             value: 'InvalidValue'
             required: true
           }
          param_settings {
             param: 'ID'
             value: 'add8'
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
+ Allow the EUT to send an AddResp.
+ Send a Get message to the EUT with the request path of
  'Device.LocalAgent.Subscription.'.

=== Test Metrics <sec:test-metrics-7>

+ The EUT sends an AddResp message.
+ The AddResp contains a single CreatedObjectResult that has an
  OperationStatus that is an element of type OperationFailure. The
  OperationFailure element contains an appropriate error code.
+ The GetResp from the EUT does not contain a Subscription instance with
  ID 'add8'.

== 1.9 Add message with allow partial true, required parameters fail, multiple objects <sec:add-message-with-allow-partial-true-required-parameters-fail-multiple-objects>

=== Purpose <sec:purpose-9>

The purpose of this test is to validate that the EUT properly handles an
Add message when the `allow_partial` element is set to true, and at
least one required parameter fails in one of multiple objects.

=== Functionality Tag <sec:functionality-tag-8>

Mandatory

=== Test Setup <sec:test-setup-9>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-8>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'Enable'
              value: 'true'
            }
          param_settings {
              param: 'ID'
              value: 'add91'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.SoftwareVersion'
            }
          }
        create_objs {
          obj_path: 'Device.LocalAgent.Subscription.'
          param_settings {
              param: 'Enable'
              value: 'true'
            }
          param_settings {
              param: 'ID'
              value: 'add91'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.SoftwareVersion'
            }
          param_settings {
              param: 'InvalidParameter'
              value: 'IrrelevantValue'
              required: true
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp.
+ Record the instance identifier of the created object as reported by
  the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-8>

+ The EUT sends an AddResp message.
+ The AddResp contains two CreatedObjectResults.

  + One CreateObjectResult is an element of type OperationSuccess. The
    OperationSuccess element contains no parameter errors and 3 elements
    in the unique key map: Alias, Recipient, and ID. Alternatively, the
    OperationSuccess contains 2 elements in the unique key map if the
    Alias parameter is not supported: Recipient, and ID.
  + The other CreateObjectResult is an element of type OperationFailure.
    The OperationFailure element contains an appropriate error code.
+ The EUT creates the first Subscription object, and does not create the
  second Subscription object.
+ The Subscription object’s values match the values set in the
  `param_settings` element.

== 1.10 Add message with unique key addressing in path <sec:add-message-with-unique-key-addressing-in-path>

=== Purpose <sec:purpose-10>

The purpose of this test is to validate that the EUT properly handles an
Add message when the Controller uses unique key addressing.

=== Functionality Tag <sec:functionality-tag-9>

Conditional Mandatory (Product supports at least one nested
multi\-instance object)

=== Test Setup <sec:test-setup-10>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-9>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }

  body {
    request {
      add {
        allow_partial: false
        create_objs {
          obj_path: 'Device.LocalAgent.Controller.[EndpointID=="< EndpointID>"&&Alias=="<Alias if supported>"].BootParameter.'
          param_settings {
              param: 'Enable'
              value: 'true'
            }
          param_settings {
              param: 'ParameterName'
              value: 'Device.LocalAgent.SoftwareVersion'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp.
+ Record the instance identifier of the created object as reported by
  the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-9>

+ The EUT sends an AddResp.
+ The AddResp contains a single CreatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains no parameter errors and 2 elements in the
  unique key map: Alias and ParameterName. Alternatively, the
  OperationSuccess contains one element in the unique key map if the
  Alias parameter is not supported: ParameterName.
+ The EUT creates the BootParameter object.
+ The BootParameter object’s values match the values set in the
  `param_settings` element.

== 1.11 Set message with allow partial false, required parameters pass <sec:set-message-with-allow-partial-false-required-parameters-pass>

=== Purpose <sec:purpose-11>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to false, and all
required parameters to be updated succeed.

=== Functionality Tag <sec:functionality-tag-10>

Mandatory

=== Test Setup <sec:test-setup-11>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-10>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-10>

+ The EUT sends a SetResp.
+ The SetResp contains a single UpdatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdateInstanceResult, with the
  `affected_path` equal to 'Device.LocalAgent.Subscription.\<instance
  number>.', and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element.

== 1.12 Set message with allow partial true, required parameters pass <sec:set-message-with-allow-partial-true-required-parameters-pass>

=== Purpose <sec:purpose-12>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to true, and all
required parameters to be updated succeed.

=== Functionality Tag <sec:functionality-tag-11>

Mandatory

=== Test Setup <sec:test-setup-12>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-11>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: true
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
    body {
      request {
        get {
          param_paths: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry'
        }
      }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-11>

+ The EUT sends a SetResp.
+ The SetResp contains a single UpdatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdateInstanceResult, with the
  `affected_path` equal to 'Device.LocalAgent.Subscription.\<instance
  number>.', and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element.

== 1.13 Set message with allow partial false, multiple objects <sec:set-message-with-allow-partial-false-multiple-objects>

=== Purpose <sec:purpose-13>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to false, and all
required parameters to be updated succeed.

=== Functionality Tag <sec:functionality-tag-12>

Mandatory

=== Test Setup <sec:test-setup-13>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT, and
  the instance identifiers are known by the traffic generator.

=== Test Procedure <sec:test-procedure-12>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<second instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry'
        param_paths: 'Device.LocalAgent.Subscription.<second instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-12>

+ The EUT sends a SetResp.
+ The SetResp contains two UpdatedObjectResults that each have an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdateInstanceResult, with the
  affected\_path equal to 'Device.LocalAgent.Subscription.\<instance
  number>.', and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element for each object.

== 1.14 Set message with allow partial false, required parameters fail <sec:set-message-with-allow-partial-false-required-parameters-fail>

=== Purpose <sec:purpose-14>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to false, and a
required parameter fails.

=== Functionality Tag <sec:functionality-tag-13>

Mandatory

=== Test Setup <sec:test-setup-14>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-13>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.'
          param_settings {
           param: 'InvalidParameter'
           value: 'IrrelevantValue'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send an Error.
+ Send a Get message to the EUT with a request path of
  'Device.LocalAgent.Subscription.\<instance identifier from test
  setup>.'.

=== Test Metrics <sec:test-metrics-13>

+ The EUT sends an Error.
+ The Error contains an appropriate error code and a single ParamError
  element. The ParamError element contains a `param_path` of
  'Device.LocalAgent.Subscription.\<instance
  identifier>.InvalidParameter' and an appropriate error code.
+ The GetResp contains a single Subscription instance that does not
  include a 'InvalidParameter' parameter.

== 1.15 Set message with allow partial false, multiple objects, required parameters fail in single object <sec:set-message-with-allow-partial-false-multiple-objects-required-parameters-fail-in-single-object>

=== Purpose <sec:purpose-15>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to false, and
required parameters in one of multiple objects fail.

=== Functionality Tag <sec:functionality-tag-14>

Mandatory

=== Test Setup <sec:test-setup-15>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT, and
  the instance identifiers are known by the traffic generator.

=== Test Procedure <sec:test-procedure-14>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
           }
        }
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<second instance identifier from test setup>.'
          param_settings {
           param: 'InvalidParameter'
           value: 'IrrelevantValue'
           required: true
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-14>

+ The EUT sends an Error.
+ The Error contains an appropriate error code and a single ParamError
  element. The ParamError element contains a `param_path` of
  'Device.LocalAgent.Subscription.\<instance
  identifier>.InvalidParameter' and an appropriate error code.
+ The GetResp contains at least two Subscription instances, neither of
  which contain a `InvalidParameter` parameter and the first instance
  from the test setup does not have an updated `NotifRetry` value.

== 1.16 Set message with allow partial true, required parameter fails, multiple objects <sec:set-message-with-allow-partial-true-required-parameter-fails-multiple-objects>

=== Purpose <sec:purpose-16>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to true, and a
required parameter on one of multiple objects fails.

=== Functionality Tag <sec:functionality-tag-15>

Mandatory

=== Test Setup <sec:test-setup-16>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT, and
  the instance identifiers are known by the traffic generator.

=== Test Procedure <sec:test-procedure-15>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: true
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<second instance identifier from test setup>.'
          param_settings {
           param: 'InvalidParameter'
           value: 'IrrelevantValue'
           required: true
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-15>

+ The EUT sends a SetResp.
+ The SetResp contains two UpdatedObjectResults.

  + The first UpdatedObjectResult has an OperationStatus that is an
    element of type OperationSuccess. The OperationSuccess contains a
    single UpdatedInstanceResult, with the `affected_path` equal to
    'Device.LocalAgent.Subscription.\<instance number>.', and a single
    entry in the `updated_params` map containing 'NotifRetry' as the
    key.
  + The second UpdatedObjectResult has an OperationStatus that is an
    element of type OperationFailure. The OperationFailure contains an
    appropriate error code and a single UpdatedInstanceFailure element.
    The UpdatedInstanceFailure has an `affected_path` with a value of
    'Device.LocalAgent.Subscription.\<instance identifier>.', and a
    single ParameterError element.
  + The ParameterError has a `param` element with a value of
    'InvalidParameter' and an appropriate error code.
+ The retrieved value matches the value set in the `param_settings`
  element for the first object.

== 1.17 Set message with allow partial true, non\-required parameter fails, multiple parameters <sec:set-message-with-allow-partial-true-non-required-parameter-fails-multiple-parameters>

=== Purpose <sec:purpose-17>

The purpose of this test is to validate that the EUT properly handles a
Set message when the `allow_partial` element is set to true, and one of
multiple non\-required parameters fail.

=== Functionality Tag <sec:functionality-tag-16>

Mandatory

=== Test Setup <sec:test-setup-17>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-16>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: true
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
         }
          param_settings {
           param: 'InvalidParameter'
           value: 'IrrelevantValue'
         }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-16>

+ The EUT sends a SetResp.
+ The SetResp contains a single UpdatedObjectResult with an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdatedInstanceResult element.

  + The UpdatedInstanceResult `affected_path` is equal to
    'Device.LocalAgent.Subscription.\<instance number>.'.
  + The UpdatedInstanceResult has a single entry in the `updated_params`
    map containing 'NotifRetry' as the key.
  + The UpdatedInstanceResult has a single ParameterError element, with
    the 'param' field set to 'InvalidParameter', and an appropriate
    error code.
+ The retrieved value of NotifRetry matches the value set in the
  `param_settings` element.

== 1.18 Set message with unique key addressing in path <sec:set-message-with-unique-key-addressing-in-path>

=== Purpose <sec:purpose-18>

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses unique key addressing.

=== Functionality Tag <sec:functionality-tag-17>

Mandatory

=== Test Setup <sec:test-setup-18>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the unique keys and their values are known by the traffic generator.

=== Test Procedure <sec:test-procedure-17>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {

      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.<unique key instance identifier from test setup>.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-17>

+ The EUT sends a SetResp.
+ The SetResp contains a single UpdatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdateInstanceResult, with the
  `affected_path` equal to 'Device.LocalAgent.Subscription.\<instance
  number>.', and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element.

== 1.19 Set message with wildcard search path, allow partial false, required parameters pass <sec:set-message-with-wildcard-search-path-allow-partial-false-required-parameters-pass>

=== Purpose <sec:purpose-19>

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses a wildcard search path and the
requested updates succeed.

=== Functionality Tag <sec:functionality-tag-18>

Mandatory

=== Test Setup <sec:test-setup-19>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-18>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.*.'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<first instance identifier from test setup>.NotifRetry'
        param_paths: 'Device.LocalAgent.Subscription.<second instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-18>

+ The EUT sends a SetResp.
+ The SetResp contains an UpdatedObjectResults element that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains at least two UpdateInstanceResults, each
  with the `affected_path` equal to
  'Device.LocalAgent.Subscription.\<instance number>.' of the respective
  instance, and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element for each object.

== 1.20 Set message with wildcard search path, allow partial false, required parameters fail <sec:set-message-with-wildcard-search-path-allow-partial-false-required-parameters-fail>

=== Purpose <sec:purpose-20>

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses a wildcard search path,
`allow_partial` element is set to false, and required parameters in
multiple objects fail.

=== Functionality Tag <sec:functionality-tag-19>

Mandatory

=== Test Setup <sec:test-setup-20>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-19>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {

      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.*.'
          param_settings {
           param: 'InvalidParameter'
           value: 'IrrelevantValue'
           required: true
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-19>

+ The EUT sends a SetResp.
+ The SetResp contains an UpdatedObjectResults element.
+ The UpdatedObjectResults has an OperationStatus that is an element of
  type OperationFailure. The OperationFailure contains an appropriate
  error code and at least one UpdatedInstanceFailure element. The
  UpdatedInstanceFailure has an affected\_path with a value of
  'Device.LocalAgent.Subscription.\<instance identifier>.' for the
  respective failed instance, and a single ParameterError element. The
  ParameterError has a param element that indicates the InvalidParameter
  parameter, and an appropriate error code.
+ In the GetResp there are no Subscription instances with an
  'InvalidParameter' parameter.

== 1.21 Set message with wildcard search path, allow partial true, required parameters fail <sec:set-message-with-wildcard-search-path-allow-partial-true-required-parameters-fail>

=== Purpose <sec:purpose-21>

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses a wildcard search path, the
`allow_partial` element is set to true, and a required parameter on
multiple objects fails.

=== Functionality Tag <sec:functionality-tag-20>

Mandatory

=== Test Setup <sec:test-setup-21>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-20>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }

  body {
    request {
      set {
        allow_partial: true
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.*.'
          param_settings {
           param: 'Enable'
           value: 'InvalidValue'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-20>

+ The EUT sends a SetResp.
+ The SetResp contains an UpdatedObjectResults element.
+ The UpdatedObjectResults has an OperationStatus that is an element of
  type OperationFailure. The OperationFailure contains an appropriate
  error code and at least one UpdatedInstanceFailure elements. The
  UpdatedInstanceFailure has an `affected_path` with a value of
  'Device.LocalAgent.Subscription.\<instance identifier>.' for the
  respective failed instance, and a single ParameterError element. The
  ParameterError has a `param` element that indicates the Enable
  parameter, and an appropriate error code.
+ The EUT has no Subscription objects that have an Enable parameter set
  to 'InvalidValue'.

== 1.22 Set message with search expression search path <sec:set-message-with-search-expression-search-path>

=== Purpose <sec:purpose-22>

The purpose of this test is to validate that the EUT properly handles a
Set message when the Controller uses a search path.

=== Functionality Tag <sec:functionality-tag-21>

Mandatory

=== Test Setup <sec:test-setup-22>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT with a
  value for the NotifExpiration that is greater than 0.

=== Test Procedure <sec:test-procedure-21>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.[NotifExpiration>0].'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier from test setup>.NotifRetry'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-21>

+ The EUT sends a SetResp.
+ The SetResp contains at least one UpdatedObjectResult that has an
  OperationStatus that is an element of type OperationSuccess. The
  OperationSuccess contains a single UpdateInstanceResult, with the
  `affected_path` equal to 'Device.LocalAgent.Subscription.\<instance
  number>.', and a single entry in the `updated_params` map containing
  'NotifRetry' as the key.
+ The retrieved value matches the value set in the `param_settings`
  element.

== 1.23 Set message with path that matches no objects <sec:set-message-with-path-that-matches-no-objects>

=== Purpose <sec:purpose-23>

The purpose of this test is to validate that the EUT properly handles a
Set message when the requested path is a search path that does not match
any objects, returning an empty `oper_success` element.

=== Functionality Tag <sec:functionality-tag-22>

Mandatory

=== Test Setup <sec:test-setup-23>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-22>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: true
        update_objs {
          obj_path: 'Device.LocalAgent.Subscription.[Recipient=="InvalidValue"].'
          param_settings {
           param: 'NotifRetry'
           value: '<Valid Value>'
           required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a SetResp.

=== Test Metrics <sec:test-metrics-22>

+ The EUT sends a SetResp.
+ The SetResp contains one UpdatedObjectResult with an empty
  `oper_success` element (i.e.~`oper_success {}`).

== 1.24 Delete message with allow partial false, valid object instance <sec:delete-message-with-allow-partial-false-valid-object-instance>

=== Purpose <sec:purpose-24>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to false, and the
object to be deleted is valid.

=== Functionality Tag <sec:functionality-tag-23>

Mandatory

=== Test Setup <sec:test-setup-24>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT, and the instance
  identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-23>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-23>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains a single `deleted_obj_response` with a
  `requested_path` equal to 'Device.LocalAgent.Subscription.\<instance
  identifier>.' and an `oper_success` element, with one `affected_path`
  element equal to the path name of the Deleted object.
+ The GetResp does not contain the Subscription instance that was
  deleted.

== 1.25 Delete message with allow partial false, object instance doesn’t exist <sec:delete-message-with-allow-partial-false-object-instance-doesnt-exist>

=== Purpose <sec:purpose-25>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to false, and the
object instance to be deleted does not exist.

=== Functionality Tag <sec:functionality-tag-24>

Mandatory

=== Test Setup <sec:test-setup-25>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned any existing
  Subscription objects and their instance identifiers.

=== Test Procedure <sec:test-procedure-24>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: false
         obj_paths: 'Device.LocalAgent.Subscription.<non-existent instance identifier>.'
       }
     }
   }
  ```
+ Allow the EUT to send an DeleteResp.

=== Test Metrics <sec:test-metrics-24>

+ The EUT sends a DeleteResp containing an empty `oper_success` element.

== 1.26 Delete message with allow partial false, invalid object <sec:delete-message-with-allow-partial-false-invalid-object>

=== Purpose <sec:purpose-26>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to false, and the
object to be deleted is invalid.

=== Functionality Tag <sec:functionality-tag-25>

Mandatory

=== Test Setup <sec:test-setup-26>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-25>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
   }
   body {
     request {
       delete {
         allow_partial: false
         obj_paths: 'Device.LocalAgent.InvalidObject.'
       }
     }
   }
  ```
+ Allow the EUT to send an Error message.

=== Test Metrics <sec:test-metrics-25>

+ The EUT sends an Error message.
+ The Error contains an appropriate error code with the `param_errs`
  element containing a single error with a `param_path` of
  'Device.LocalAgent.InvalidObject.', and an appropriate error code.

== 1.27 Delete message with allow partial false, multiple objects <sec:delete-message-with-allow-partial-false-multiple-objects>

=== Purpose <sec:purpose-27>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to false, with
multiple valid objects.

=== Functionality Tag <sec:functionality-tag-26>

Mandatory

=== Test Setup <sec:test-setup-27>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT, and
  the instance identifiers are known by the traffic generator.

=== Test Procedure <sec:test-procedure-26>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: false
         obj_paths: 'Device.LocalAgent.Subscription.<first instance identifier>.'
         obj_paths: 'Device.LocalAgent.Subscription.<second instance identifier>.'
       }
     }
    }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-26>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains two `deleted_obj_results`, each with a
  `requested_path` equal to the `obj_paths` of the Delete message, and
  an `oper_success` element containing an `affected_path` element equal
  to the path name of the deleted object.
+ The GetResp does not contain the deleted Subscription objects.

== 1.28 Delete message with allow partial false, multiple objects, invalid object <sec:delete-message-with-allow-partial-false-multiple-objects-invalid-object>

=== Purpose <sec:purpose-28>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to false, and one
of the objects to be deleted is invalid.

=== Functionality Tag <sec:functionality-tag-27>

Mandatory

=== Test Setup <sec:test-setup-28>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-27>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: false
         obj_paths: 'Device.LocalAgent.Subscription.<instance identifier.>'
         obj_paths: 'Device.LocalAgent.InvalidObject.'
       }
     }
   }
  ```
+ Allow the EUT to send an Error message.
+ Send a Get message to the EUT with a request path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-27>

+ The EUT sends an Error message.
+ The Error contains an appropriate error code with the `param_errs`
  element containing a single error with a `param_path` of
  'Device.LocalAgent.InvalidObject.', and an appropriate error code.
+ The GetResp contains the Subscription that was not deleted by step 1.

== 1.29 Delete message with allow partial true, object instance doesn’t exist <sec:delete-message-with-allow-partial-true-object-instance-doesnt-exist>

=== Purpose <sec:purpose-29>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to true, and the
object instance to be deleted does not exist.

=== Functionality Tag <sec:functionality-tag-28>

Mandatory

=== Test Setup <sec:test-setup-29>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-28>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: true
         obj_paths: 'Device.LocalAgent.Subscription.<invalid instance identifier>.'
       }
     }
   }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-28>

+ The EUT sends a DeleteResp containing an empty `oper_success` element
  (i.e., `oper_success{}`).

== 1.30 Delete message with allow partial true, invalid object <sec:delete-message-with-allow-partial-true-invalid-object>

=== Purpose <sec:purpose-30>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to true, and the
object is not valid in the Agent’s supported data model.

=== Functionality Tag <sec:functionality-tag-29>

Mandatory

=== Test Setup <sec:test-setup-30>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-29>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
   }
   body {
     request {
       delete {
         allow_partial: true
         obj_paths: 'Device.LocalAgent.InvalidObject.'
       }
     }
   }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-29>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains a single `deleted_obj_result` message with a
  `requested_path` of 'Device.LocalAgent.InvalidObject.' and an
  `oper_failure` element, with an appropriate error code.

== 1.31 Delete message with allow partial true, multiple objects, invalid object <sec:delete-message-with-allow-partial-true-multiple-objects-invalid-object>

=== Purpose <sec:purpose-31>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to true, and one
of multiple objects is invalid.

=== Functionality Tag <sec:functionality-tag-30>

Mandatory

=== Test Setup <sec:test-setup-31>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-30>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: true
         obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
         obj_paths: 'Device.LocalAgent.InvalidObject.'
       }
     }
   }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-30>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains two `deleted_obj_results` elements, one with
  an `oper_success` element, containing an `affected_path` element with
  the value 'Device.LocalAgent.Subscription.\<instance identifier>.',
  and the other with an `oper_failure` element containing an appropriate
  error code.
+ The GetResp does not contain the Subscription instance deleted in step
  1.

== 1.32 Delete message with allow partial true, multiple objects, object doesn’t exist <sec:delete-message-with-allow-partial-true-multiple-objects-object-doesnt-exist>

=== Purpose <sec:purpose-32>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the `allow_partial` element is set to true, and one
of multiple objects does not exist in the Agent’s instantiated data
model.

=== Functionality Tag <sec:functionality-tag-31>

Mandatory

=== Test Setup <sec:test-setup-32>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-31>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
  body {
    request {
      delete {
        allow_partial: true
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
        obj_paths: 'Device.LocalAgent.Subscription.<invalid instance identifier>.'
        }
       }
      }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`.

=== Test Metrics <sec:test-metrics-31>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains two deleted\_obj\_results elements. One
  contains an `oper_success` element with an `affected_path` element
  listing 'Device.LocalAgent.Subscription.\<instance identifier>.'. The
  second contains an empty `oper_success` element (i.e.,
  `oper_success{}`).
+ The GetResp does not contain the Subscription instance deleted in step
  1.

== 1.33 Delete message with unique key addressing <sec:delete-message-with-unique-key-addressing>

=== Purpose <sec:purpose-33>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the Controller uses unique key addressing.

=== Functionality Tag <sec:functionality-tag-32>

Mandatory

=== Test Setup <sec:test-setup-33>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Obtain the unique key values of the Device.LocalAgent. object that
  correlates with the source of the test USP messages.
+ Ensure that at least one
  Device.LocalAgent.Controller.{i}.BootParameter. object exists on the
  EUT, and the instance identifier of the object is known by the traffic
  generator.

=== Test Procedure <sec:test-procedure-32>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Controller.[EndpointID=="< EndpointID>"&&Alias=="<Alias if supported>"].BootParameter.<instance identifier>.'
        }
      }
    }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Controller.<instance ID>.BootParameter.`

=== Test Metrics <sec:test-metrics-32>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains a single `deleted_obj_result` with a requested
  path equal to the path specified in the `obj_path` of the Delete
  message, containing an `oper_success` element, with one
  `affected_path` element equal to the path name of the Deleted object.
+ The `affected_path` element uses instance number addressing.
+ The GetResp does not contain the BootParameter deleted in step 1.

== 1.34 Delete message with wildcard search path, valid objects <sec:delete-message-with-wildcard-search-path-valid-objects>

=== Purpose <sec:purpose-34>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the Controller uses a wildcard search to delete
multiple valid objects.

=== Functionality Tag <sec:functionality-tag-33>

Mandatory

=== Test Setup <sec:test-setup-34>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-33>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.*.'
        }
      }
    }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Subscription.`

=== Test Metrics <sec:test-metrics-33>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains a single `deleted_obj_result` with a requested
  path equal to ’Device.LocalAgent.Subscription.\*.’ and an
  `oper_success` element with one or more `affected_path` elements equal
  to the path names of the Deleted objects.
+ The GetResp does not contain any of the Subscription instances deleted
  in step 1.

== 1.35 Delete message with search expression search path <sec:delete-message-with-search-expression-search-path>

=== Purpose <sec:purpose-35>

The purpose of this test is to validate that the EUT properly handles a
Delete message when the Controller uses a search expression to delete
one or more valid objects.

=== Functionality Tag <sec:functionality-tag-34>

Mandatory

=== Test Setup <sec:test-setup-35>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the instance identifier of the Controller object that
  represents the traffic generator is known by the traffic generator.
+ Ensure that at least two Device.LocalAgent.Controller.\<instance
  identifier>.BootParameter. objects exist on the EUT. At least one of
  these BootParameter objects has a value of 'false' for its 'Enable'
  parameter, and at least one of these BootParameter objects has a value
  of 'true' for its 'Enable' parameter.

=== Test Procedure <sec:test-procedure-34>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Controller.<instance identifier>.BootParameter.[Enable==true].'
        }
      }
    }
  ```
+ Allow the EUT to send a DeleteResp.
+ Send a Get message to the EUT with a requested path of
  `Device.LocalAgent.Controller.<instance ID>.BootParameter.`.

=== Test Metrics <sec:test-metrics-34>

+ The EUT sends a DeleteResp.
+ The DeleteResp contains a single `deleted_obj_results` element, with a
  `requested_path` equal to 'Device.LocalAgent.Controller.\<instance
  identifier>.BootParameter.\[Enable\=\=true\]' and an `oper_success`
  element with the `affected_path` elements equal to the path names of
  the successfully Deleted objects.
+ The BootParameter whose Enable parameter was equal to 'false' was not
  deleted.
+ The GetResp does not contain any BootParameter instances where
  `Enable==true`.

== 1.36 Get message with full parameter path <sec:get-message-with-full-parameter-path>

=== Purpose <sec:purpose-36>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when a
single full parameter path is specified.

=== Functionality Tag <sec:functionality-tag-35>

Mandatory

=== Test Setup <sec:test-setup-36>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-35>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.EndpointID'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-35>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `req_path_results` has no errors, a `requested_path` equal to
  'Device.LocalAgent.EndpointID', and contains a single
  `resolved_path_results` element. The `resolved_path_results` element
  contains a `resolved_path` equal to 'Device.LocalAgent.' and a single
  `result_params` element with a key of 'EndpointID' and a value equal
  to the EUT’s EndpointID.

== 1.37 Get message with multiple full parameter paths, same object <sec:get-message-with-multiple-full-parameter-paths-same-object>

=== Purpose <sec:purpose-37>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when
multiple full parameter paths are specified within the same object.

=== Functionality Tag <sec:functionality-tag-36>

Mandatory

=== Test Setup <sec:test-setup-37>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-36>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.EndpointID'
        param_paths: 'Device.LocalAgent.SoftwareVersion'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-36>

+ The EUT sends a GetResp.
+ The GetResp contains two `req_path_results` elements. The
  `requested_path_results` have no errors. Each contains a single
  `resolved_path_results` element. One `resolved_path_result` element
  contains a `requested_path` equal to 'Device.LocalAgent.EndpointID', a
  single `resolved_path` equal to 'Device.LocalAgent.', and a single
  `result_params` element with a key of 'EndpointID' and a value equal
  to the EUT EndpointID. The other `resolved_path_result` element
  contains a `requested_path` equal to
  'Device.LocalAgent.SoftwareVersion', a single `resolved_path` equal to
  'Device.LocalAgent.', and a single `result_params` element with a key
  of 'SoftwareVersion' with a valid value.

== 1.38 Get message with multiple full parameter paths, different objects <sec:get-message-with-multiple-full-parameter-paths-different-objects>

=== Purpose <sec:purpose-38>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when
multiple full parameter paths are specified within multiple objects.

=== Functionality Tag <sec:functionality-tag-37>

Mandatory

=== Test Setup <sec:test-setup-38>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  its instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-37>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.EndpointID'
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier>.Enable'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-37>

+ The EUT sends a GetResp.
+ The GetResp contains two `req_path_results` elements. The
  `requested_path_results` have no errors. Each contains a single
  `resolved_path_results` element. One `resolved_path_result` element
  contains a `requested_path` equal to 'Device.LocalAgent.EndpointID', a
  single `resolved_path` equal to 'Device.LocalAgent.', and a single
  `result_params` element with a key of 'EndpointID' and a value equal
  to the EUT EndpointID. The other `resolved_path_result` element
  contains a `requested_path` equal to
  'Device.LocalAgent.Subscription.\<instance identifier>.Enable', a
  single `resolved_path` equal to
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a single
  `result_params` element with a key of 'Enable' with a valid value.

== 1.39 Get message with object path <sec:get-message-with-object-path>

=== Purpose <sec:purpose-39>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when an
object path is specified.

=== Functionality Tag <sec:functionality-tag-38>

Mandatory

=== Test Setup <sec:test-setup-39>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-38>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-38>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.', and a set of `resolved_path_results`
  elements. One contains a `resolved_path` of 'Device.LocalAgent.', and
  a number of `result_params` elements contain keys and values of the
  parameters of 'Device.LocalAgent.'. Additional `resolved_path_results`
  exist for each of the sub\-objects of Device.LocalAgent., with
  `result_params` containing the keys and values of each sub\-object’s
  parameters.
+ The keys of all `result_params` elements are relative paths.

== 1.40 Get message with object instance path <sec:get-message-with-object-instance-path>

=== Purpose <sec:purpose-40>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when a path
to an object instance is specified.

=== Functionality Tag <sec:functionality-tag-39>

Mandatory

=== Test Setup <sec:test-setup-40>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  its instance identifier is known by the traffic generator.

=== Test Procedure <sec:test-procedure-39>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-39>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\<instance identifier>.', and a
  single `resolved_path_results` element, with a `resolved_path` of
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a series
  of `result_params` elements containing the keys and values of the
  parameters of the instance.
+ The keys of all `result_params` elements are relative paths.

== 1.41 Get message with invalid parameter <sec:get-message-with-invalid-parameter>

=== Purpose <sec:purpose-41>

The purpose of this test is to ensure the Agent can properly handle a
Get message when a single invalid parameter is requested.

=== Functionality Tag <sec:functionality-tag-40>

Mandatory

=== Test Setup <sec:test-setup-41>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-40>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.InvalidParameter'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-40>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has a `requested_path` equal to
  'Device.LocalAgent.InvalidParameter', and an appropriate error code.

== 1.42 Get message with invalid parameter and valid parameter <sec:get-message-with-invalid-parameter-and-valid-parameter>

=== Purpose <sec:purpose-42>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when both a
valid and invalid parameter are requested.

=== Functionality Tag <sec:functionality-tag-41>

Mandatory

=== Test Setup <sec:test-setup-42>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-41>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
         param_paths: 'Device.LocalAgent.EndpointID'
         param_paths: 'Device.LocalAgent.InvalidParameter'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-41>

+ The EUT sends a GetResp.
+ The GetResp contains two `req_path_results` elements. One
  `requested_path_results` has no errors, and contains a single
  `resolved_path_results` element. The `resolved_path_results` element
  contains a `requested_path` equal to 'Device.LocalAgent.EndpointID', a
  single `resolved_path`equal to 'Device.LocalAgent.', and a single
  `result_params` element with a key of 'EndpointID' and a value equal
  to the EUT EndpointID. The other `requested_path_results` has a
  `requested_path` equal to 'Device.LocalAgent.InvalidParameter', and an
  appropriate error code.

== 1.43 Get message using unique key addressing <sec:get-message-using-unique-key-addressing>

=== Purpose <sec:purpose-43>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses unique key addressing.

=== Functionality Tag <sec:functionality-tag-42>

Mandatory

=== Test Setup <sec:test-setup-43>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the unique keys and their values are known by the traffic generator.

=== Test Procedure <sec:test-procedure-42>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.<unique key identifier>.Enable'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-42>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\<unique key identifier>.Enable',
  and a single `resolved_path_results` element, with a `resolved_path`
  of 'Device.LocalAgent.Subscription.\<instance identifier>.', and a
  result\_params element containing a key of 'Enable' and a valid value.

== 1.44 Get message using wildcard search path on full parameter <sec:get-message-using-wildcard-search-path-on-full-parameter>

=== Purpose <sec:purpose-44>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a wildcard to retrieve a single parameter from
multiple objects.

=== Functionality Tag <sec:functionality-tag-43>

Mandatory

=== Test Setup <sec:test-setup-44>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-43>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.*.Enable'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-43>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to ’Device.LocalAgent.Subscription.\*.Enable’, and at least two
  `resolved_path_results` elements, each with a `resolved_path` of
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a
  `result_params` element containing a key of 'Enable' and a valid
  value.

== 1.45 Get message using wildcard search path on object path <sec:get-message-using-wildcard-search-path-on-object-path>

=== Purpose <sec:purpose-45>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a wildcard to retrieve all parameters from multiple
object instances.

=== Functionality Tag <sec:functionality-tag-44>

Mandatory

=== Test Setup <sec:test-setup-45>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-44>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.*.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-44>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to ’Device.LocalAgent.Subscription.\*.’, and a set of
  `resolved_path_results` elements. Each contains a `resolved_path` of
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a number
  of `result_params` elements containing keys and values of the
  parameters of each Subscription object.
+ The keys of all `result_params` elements are relative paths.

== 1.46 Get message using search expression search path (equivalence) <sec:get-message-using-search-expression-search-path-equivalence>

=== Purpose <sec:purpose-46>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that match a particular value.

=== Functionality Tag <sec:functionality-tag-45>

Mandatory

=== Test Setup <sec:test-setup-46>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of 'true'
  for its Enable parameter, and at least one should have a value of
  'false' for its Enable parameter.

=== Test Procedure <sec:test-procedure-45>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[Enable==true].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-45>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[Enable\=\=true\].', and a set of
  `resolved_path_results` elements. Each contains a `resolved_path` of
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a number
  of `result_params` elements containing keys and values of the
  parameters of each Subscription object where the Enable parameter is
  'true'.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  Enable parameter is 'false'.

== 1.47 Get message using search expression search path (non\-equivalence) <sec:get-message-using-search-expression-search-path-non-equivalence>

=== Purpose <sec:purpose-47>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path that does not match a particular
value.

=== Functionality Tag <sec:functionality-tag-46>

Mandatory

=== Test Setup <sec:test-setup-47>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of 'true'
  for its Enable parameter, and at least one should have a value of
  'false' for its Enable parameter.

=== Test Procedure <sec:test-procedure-46>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[Enable!=true].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-46>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[Enable!\=true\].', and a set of
  `resolved_path_results` elements. Each contains a `resolved_path` of
  'Device.LocalAgent.Subscription.\<instance identifier>.', and a number
  of `result_params` elements containing keys and values of the
  parameters of each subscription object where the Enable parameter is
  'false'.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  Enable parameter is 'true'.

== 1.48 Get message using search expression search path (exclusive greater comparison) <sec:get-message-using-search-expression-search-path-exclusive-greater-comparison>

=== Purpose <sec:purpose-48>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are greater than a particular value.

=== Functionality Tag <sec:functionality-tag-47>

Mandatory

=== Test Setup <sec:test-setup-48>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of '10'
  for its NotifExpiration parameter, and at least one with a value of
  '20' for its NotifExpiration parameter.

=== Test Procedure <sec:test-procedure-47>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[NotifExpiration>10].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-47>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[NotifExpiration>10\].', and a set
  of `resolved_path_results` elements. Each contains a `resolved_path`
  of 'Device.LocalAgent.Subscription.\<instance identifier>.', and a
  number of `result_params` elements containing keys and values of the
  parameters of each Subscription object where the NotifExpiration
  parameter is greater than 10.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  NotifExpiration parameter is equal to or less than 10.

== 1.49 Get message using search expression search path (exclusive lesser comparison) <sec:get-message-using-search-expression-search-path-exclusive-lesser-comparison>

=== Purpose <sec:purpose-49>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are less than a particular value.

=== Functionality Tag <sec:functionality-tag-48>

Mandatory

=== Test Setup <sec:test-setup-49>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least two Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of '10'
  for its NotifExpiration parameter, and at least one with a value of
  '5' for its NotifExpiration parameter.

=== Test Procedure <sec:test-procedure-48>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[NotifExpiration<10].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-48>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[NotifExpiration\<10\].', and a
  set of `resolved_path_results` elements. Each contains a
  `resolved_path` of 'Device.LocalAgent.Subscription.\<instance
  identifier>.', and a number of `result_params` elements contain keys
  and values of the parameters of each Subscription object where the
  NotifExpiration parameter is less than 10.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  NotifExpiration parameter is equal to or greater than 10.

== 1.50 Get message using search expression search path (inclusive greater comparison) <sec:get-message-using-search-expression-search-path-inclusive-greater-comparison>

=== Purpose <sec:purpose-50>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are greater than or equal to a particular value.

=== Functionality Tag <sec:functionality-tag-49>

Mandatory

=== Test Setup <sec:test-setup-50>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least three Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of '10'
  for its NotifExpiration parameter, at least one with a value of '20'
  for its NotifExpiration parameter, and at least one with a value of
  '5' for its NotifExpiration parameter.

=== Test Procedure <sec:test-procedure-49>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[NotifExpiration>=10].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-49>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[NotifExpiration>\=10\].', and a
  set of `resolved_path_results` elements. Each contains a
  `resolved_path` of 'Device.LocalAgent.Subscription.\<instance
  identifier>.', and a number of `result_params` elements containing
  keys and values of the parameters of each Subscription object where
  the NotifExpiration parameter is greater than or equal to 10.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  NotifExpiration parameter is less than 10.

== 1.51 Get message using search expression search path (inclusive lesser comparison) <sec:get-message-using-search-expression-search-path-inclusive-lesser-comparison>

=== Purpose <sec:purpose-51>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model when the
requested path uses a search path to retrieve objects that that
parameters that are less than or equal to a particular value.

=== Functionality Tag <sec:functionality-tag-50>

Mandatory

=== Test Setup <sec:test-setup-51>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least three Subscription objects exist on the EUT. At
  least one of these Subscription objects should have a value of '10'
  for its NotifExpiration parameter, at least one with a value of '20'
  for its NotifExpiration parameter, and at least one with a value of
  '5' for its NotifExpiration parameter.

=== Test Procedure <sec:test-procedure-50>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[NotifExpiration<=10].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-50>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[NotifExpiration\<\=10\].', and a
  set of `resolved_path_results` elements. Each contains a
  `resolved_path` of 'Device.LocalAgent.Subscription.\<instance
  identifier>.', and a number of `result_params` elements containing
  keys and values of the parameters of each Subscription object where
  the NotifExpiration parameter is less than or equal to 10.
+ The keys of all `result_params` elements are relative paths.
+ The EUT does not return any parameters from Subscription objects whose
  NotifExpiration parameter is greater than 10.

== 1.52 Notify \- Subscription creation using Value Change <sec:notify---subscription-creation-using-value-change>

=== Purpose <sec:purpose-52>

The purpose of this test is to ensure that the Agent will create
Subscriptions requested by the Controller, and notifies the Controller
when the conditions of the subscription are triggered. This test uses
the ValueChange event to exercise these functions, validating the
behavior of ValueChange in the process.

=== Functionality Tag <sec:functionality-tag-51>

Mandatory

=== Test Setup <sec:test-setup-52>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue52'.

=== Test Procedure <sec:test-procedure-51>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify52'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
          param_settings {
            param: 'ProvisioningCode'
            value: 'TestValue52'
            required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.

=== Test Metrics <sec:test-metrics-51>

+ The EUT sends a successful AddResp.
+ The EUT sends a Notify message with a `subscription_id` field equal to
  'Notify52', and an event element of `value_change` with a `param_path`
  of 'Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode' and a `param_value` of 'TestValue52'.

== 1.53 Notify \- Subscription Deletion Using Value Change <sec:notify---subscription-deletion-using-value-change>

=== Purpose <sec:purpose-53>

The purpose of this test is to ensure that the Agent will remove and
terminate a Subscription when the Controller uses the Delete message.

=== Functionality Tag <sec:functionality-tag-52>

Mandatory

=== Test Setup <sec:test-setup-53>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue53'.

=== Test Procedure <sec:test-procedure-52>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify53'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp, and store the instance identifier of
  the Subscription object.
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
          param_settings {
            param: 'ProvisioningCode'
            value: 'TestValue53'
            required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.
+ Send a Delete message with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
        }
      }
    }
  ```
+ Allow the EUT to send a DeleteResp.
+ Repeat step 3, changing the value of ProvisioningCode to
  'notify53\-2'.
+ Wait 20 seconds.

=== Test Metrics <sec:test-metrics-52>

+ The EUT sends a successful DeleteResp.
+ The EUT does not send a Notify message based on the activity in the
  ProvisioningCode parameter.

== 1.54 Notification Retry using Value Change <sec:notification-retry-using-value-change>

=== Purpose <sec:purpose-54>

The purpose of this test is to ensure that the Agent will attempt to
resend Notify messages when the NotifRetry parameter in a Subscription
object is set to true and the Controller does not send a NotifyResp.

=== Functionality Tag <sec:functionality-tag-53>

Mandatory

=== Test Setup <sec:test-setup-54>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue54'.
+ Ensure that the Device.LocalAgent.Controller.\<instance
  identifier>.USPNotifRetryMinimumWaitInterval is set to its default
  value (5).

=== Test Procedure <sec:test-procedure-53>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify54'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
          param_settings {
            param: 'ProvisioningCode'
            value: 'TestValue54'
            required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Do not send a NotifyResp to the EUT.
+ Wait 10 seconds to allow the EUT to send a Notify message.
+ Do not send a NotifyResp to the EUT.
+ Wait 20 seconds to allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.

=== Test Metrics <sec:test-metrics-53>

+ The EUT retries the Notify message.
+ The first retry occurs within 5\-10 seconds. The second retry occurs
  within 10\-20 seconds.

== 1.55 Subscription Expiration using Value Change <sec:subscription-expiration-using-value-change>

=== Purpose <sec:purpose-55>

The purpose of this test is to ensure that the Agent removes a
Subscription from the Subscription table after its TimeToLive has
expired.

=== Functionality Tag <sec:functionality-tag-54>

Conditionally Mandatory (Supports TimeToLive in
Device.LocalAgent.Subscription.)

=== Test Setup <sec:test-setup-55>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue55'.

=== Test Procedure <sec:test-procedure-54>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify55'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          param_settings {
              param: 'TimeToLive'
              value: '20'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
          param_settings {
            param: 'ProvisioningCode'
            value: 'TestValue55'
            required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.
+ Wait 20 seconds.
+ Send a GetInstances message to the EUT with the following structure:

  ```
  header {
        msg_id: '<msg_id>'
        msg_type: GET_INSTANCES
      }
  body {
        request {
          get_instances {
            obj_paths: 'Device.LocalAgent.Subscription.'
          }
        }
      }
  ```
+ Allow the EUT to send a GetInstancesResponse.
+ Repeat step 3 with a value of 'TestValue55\-2'.
+ Wait 10 seconds.

=== Test Metrics <sec:test-metrics-54>

+ The EUT sends a Notify message after step 3.
+ The GetInstancesResponse does not list the instance of the
  Subscription object created in step 1.
+ The EUT does not send a Notify message after step 9.

== 1.56 Notification Retry Expiration using Value Change <sec:notification-retry-expiration-using-value-change>

=== Purpose <sec:purpose-56>

The purpose of this test is to ensure that the Agent will cease attempts
to retry Notify messages after an amount of time specified in value of
the NotifExpiration parameter in the Subscription object has passed.

=== Functionality Tag <sec:functionality-tag-55>

Conditional Mandatory (supports Subscription.{i}.NotifExpiration
parameter).

=== Test Setup <sec:test-setup-56>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue56'.
+ Ensure that the Device.LocalAgent.Controller.\<instance
  identifier>.USPNotifRetryMinimumWaitInterval is set to its default
  value (5).

=== Test Procedure <sec:test-procedure-55>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify56'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          param_settings {
              param: 'NotifExpiration'
              value: '20'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
        allow_partial: false
        update_objs {
          obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
          param_settings {
            param: 'ProvisioningCode'
            value: 'TestValue56'
            required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Do not send a NotifyResp to the EUT.
+ Wait 10 seconds to allow the EUT to send a Notify message.
+ Do not send a NotifyResp to the EUT.
+ Wait 20 seconds to allow the EUT to send a Notify message.
+ Do not send a Notify Response to the EUT.
+ Wait 30 seconds.

=== Test Metrics <sec:test-metrics-55>

+ The EUT retries the Notify message within 20 seconds.
+ The EUT does not retry the Notify message after 20 seconds.

== 1.57 ObjectCreation Notification <sec:objectcreation-notification>

=== Purpose <sec:purpose-57>

The purpose of this test is to ensure that the Agent will send a Notify
message to the Controller when the Controller is Subscribed to the
ObjectCreation event.

=== Functionality Tag <sec:functionality-tag-56>

Mandatory

=== Test Setup <sec:test-setup-57>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-56>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify57'
            }
          param_settings {
              param: 'NotifType'
              value: 'ObjectCreation'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Subscription.'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify57-2'
            }
          param_settings {
              param: 'NotifType'
              value: 'ValueChange'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.

=== Test Metrics <sec:test-metrics-56>

+ The EUT sends a successful AddResp.
+ The EUT sends a Notify message with a `subscription_id` field equal to
  'Notify57', and an event element of `obj_creation` with a `obj_path`
  of 'Device.LocalAgent.Subscription.\<instance number>.' and a map
  element of `unique_keys` with values of 'ID, ’Notify57\-2' and
  'Recipient, Device.LocalAgent.Controller.\<instance identifier>.'.

== 1.58 ObjectDeletion Notification <sec:objectdeletion-notification>

=== Purpose <sec:purpose-58>

The purpose of this test is to ensure that the Agent will send a Notify
message to the Controller when the Controller is Subscribed to the
ObjectDeletion event.

=== Functionality Tag <sec:functionality-tag-57>

Mandatory

=== Test Setup <sec:test-setup-58>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that at least one Subscription object exists on the EUT, and
  the unique keys and their values are known by the traffic generator.

=== Test Procedure <sec:test-procedure-57>

+ Send an Add message to the EUT with the following structure:

  ```
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
              param: 'ID'
              value: 'notify58'
            }
          param_settings {
              param: 'NotifType'
              value: 'ObjectDeletion'
            }
          param_settings {
              param: 'ReferenceList'
              value: 'Device.LocalAgent.Subscription.'
              required: true
            }
          param_settings {
              param: 'NotifRetry'
              value: 'true'
            }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an AddResp
+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier from test setup 2>.'
        }
      }
    }
  ```
+ Allow the EUT to send a DeleteResp
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.

=== Test Metrics <sec:test-metrics-57>

+ The EUT sends a successful AddResp.
+ The EUT sends a Notify message with a `subscription_id` field equal to
  'Notify58', and an event element of `obj_deletion` with a `obj_path`
  of 'Device.LocalAgent.Subscription.\<instance number>.'

== 1.59 Event Notification using Periodic! <sec:event-notification-using-periodic>

=== Purpose <sec:purpose-59>

The purpose of this test is to ensure that the Agent will send a Notify
message to the Controller when the Controller is Subscribed to an Event
notification that correlates with an event defined in its supported data
model.

=== Functionality Tag <sec:functionality-tag-58>

Conditional Mandatory (supports Controller:1 profile and
Device.LocalAgent.Controller.{i}.PeriodicNotifTime parameter)

=== Test Setup <sec:test-setup-59>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-58>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
            allow_partial: false
              update_objs {
                  obj_path: 'Device.LocalAgent.Controller.<Controller ID>.'
                  param_settings {
                      param: 'PeriodicNotifInterval'
                      value: '60'
                  }
                  param_settings {
                      param: 'PeriodicNotifTime'
                      value: '2019-01-01T00:00:00Z'
                  }
              }
          }
      }
  }
  ```
+ Send an Add message to the EUT with the following structure:

  ```
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
                        param: 'ID'
                        value: 'sub-103'
                    }
                param_settings {
                        param: 'NotifType'
                        value: 'Event'
                    }
                param_settings {
                        param: 'ReferenceList'
                        value: 'Device.LocalAgent.Periodic!'
                    }
                }
          }
      }
  }
  ```
+ Wait for a Notification from the EUT.
+ Wait for a Notification from the EUT.

=== Test Metrics <sec:test-metrics-58>

+ The EUT sends a SetResponse with an `oper_success` after step 1.
+ The EUT sends an AddResponse with an `oper_success` after step 2.
+ The EUT sends a Notification with an Periodic! event element.
+ A second Periodic event is sent by the EUT 60 (+\/\- 4) seconds after
  the first.

== 1.60 OnBoardRequest Notification <sec:onboardrequest-notification>

=== Purpose <sec:purpose-60>

The purpose of this test is to ensure that the Agent will send a Notify
message to the Controller when the Controller initiates a
SendOnBoardRequest() operation.

=== Functionality Tag <sec:functionality-tag-59>

Conditional Mandatory (supports
Device.LocalAgent.Controller.{i}.SendOnBoardRequest() command)

=== Test Setup <sec:test-setup-60>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-59>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: OPERATE
  }
  body {
    request {
      operate {
        command: 'Device.LocalAgent.Controller.<instance identifier of traffic generator>.SendOnBoardRequest()'
        command_key: 'test60'
        send_resp: false
      }
    }
  }
  ```
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.

=== Test Metrics <sec:test-metrics-59>

+ The EUT sends a Notify message with (at minimum) a `subscription_id`
  field set to an empty string, and an event element of `on_board_req`
  with appropriate values for the `oui`, `product_class`,
  `serial_number`, and `agent_supported_protocol_versions` fields.

== 1.61 Operate message using Reboot() with send\_resp true <sec:operate-message-using-reboot-with-send_resp-true>

=== Purpose <sec:purpose-61>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message using the Reboot() operation as a trigger
when `send_resp` is true.

=== Functionality Tag <sec:functionality-tag-60>

Conditional Mandatory (supports Reboot:1 or any other command)

=== Test Setup <sec:test-setup-61>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-60>

+ Send an Operate message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: OPERATE
}
body {
  request {
    operate {
      command: 'Device.Reboot()'
      command_key: 'test61'
      send_resp: true
    }
  }
}
```
+ Allow the EUT to send an OperateResp
+ Allow the EUT to reboot.

=== Test Metrics <sec:test-metrics-60>

+ The EUT sends an OperateResp message with a single `operation_results`
  element containing an `executed_command` of 'Device.Reboot()' and a
  `req_output_args` element containing an empty `output_args` element.
+ The EUT reboots and resumes connectivity with the test system.

== 1.62 Operate message using Reboot() with send\_resp false <sec:operate-message-using-reboot-with-send_resp-false>

=== Purpose <sec:purpose-62>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message using the Reboot() operation as a trigger
when `send_resp` is false.

=== Functionality Tag <sec:functionality-tag-61>

Conditional Mandatory (supports Reboot:1 or any other command)

=== Test Setup <sec:test-setup-62>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-61>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: OPERATE
  }
  body {
    request {
      operate {
        command: 'Device.Reboot()'
        command_key: 'test62'
        send_resp: false
      }
    }
  }
  ```
+ Allow the EUT to reboot.

=== Test Metrics <sec:test-metrics-61>

+ The EUT reboots and resumes connectivity with the test system.

== 1.63 Operate message using input arguments (DEPRECATED by 1.79) <sec:operate-message-using-input-arguments-deprecated-by-1.79>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message with input arguments.

#emph[Note: as of TP\-469 Amendment 1, this test has been deprecated to
sync with the deprecation of
Device.LocalAgent.Controller.{i}.ScheduleTimer() in Device:2.14. The
command was replaced with Device.ScheduleTimer() and is covered by test
1.79];

=== Functionality Tag <sec:functionality-tag-62>

Conditional Mandatory (supports
Device.LocalAgent.Controller.{i}.ScheduleTimer() command or at least one
operation that contains input arguments)

=== Test Setup <sec:test-setup-63>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT, subscribed to the
  Timer! event.

=== Test Procedure <sec:test-procedure-62>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: OPERATE
  }
  body {
      request {
          operate {
              command: 'Device.LocalAgent.Controller.<Controller instance>.ScheduleTimer()'
              command_key: 'test63'
              send_resp: true
              input_args {
                  key: 'DelaySeconds'
                  value: '30'
              }
          }
      }
  }
  ```
+ Allow the EUT to send a Timer! event.

=== Test Metrics <sec:test-metrics-62>

+ The EUT sends an OperateResp message with a single `operation_results`
  element containing an executed\_command of
  'Device.LocalAgent.Controller.\<Controller instance>.ScheduleTimer()'
  and a `req_output_args` element containing an empty `output_args`
  element.
+ The EUT sends a Notify message containing a Event message with
  `obj_path` of 'Device.LocalAgent.Controller.\<Controller
  instance>.ScheduleTimer()'.

== 1.64 Asynchronous operation with send\_resp true <sec:asynchronous-operation-with-send_resp-true>

=== Purpose <sec:purpose-63>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message where the operation is asynchronous and
`send_resp` is set to true.

=== Functionality Tag <sec:functionality-tag-63>

Conditional Mandatory (supports the TraceRoute:1 profile or at least one
other asynchronous operation)

=== Test Setup <sec:test-setup-64>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT that is subscribed
  to the OperationComplete notification for the supported asynchronous
  operation.

=== Test Procedure <sec:test-procedure-63>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: OPERATE
  }
  body {
      request {
          operate {
              command: '<supported async operation>'
              command_key: 'test64'
              send_resp: true
              input_args {
                 key: '<required input argument>'
                 value: '<value>'
              }
          }
      }
  }
  ```
+ Allow the EUT to send an OperateResp message with an
  `executed_command` which matches the command sent in the Operate
  message.
+ Allow the EUT to send a Notify message with an inner OperationComplete
  message with a `obj_path` element matching the command sent in the
  Operate Message.

=== Test Metrics <sec:test-metrics-63>

+ The EUT sends an OperateResp message with a single `operation_results`
  element containing an `executed_command` matching the command sent in
  the Operate message and a `req_obj_path` field containing a path name
  to the Request object created by the EUT.
+ The EUT sends a Notify message with `obj_path` and `command_name`
  forming the command sent in the Operate message, and a `command_key`
  of 'test64'.

== 1.65 Asynchronous operation with send\_resp false <sec:asynchronous-operation-with-send_resp-false>

=== Purpose <sec:purpose-64>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message where the operation is asynchronous and
`send_resp` is set to false.

=== Functionality Tag <sec:functionality-tag-64>

Conditional Mandatory (supports the TraceRoute:1 profile or at least one
other asynchronous operation)

=== Test Setup <sec:test-setup-65>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT that is subscribed
  to the OperationComplete notification for the supported asynchronous
  operation.

=== Test Procedure <sec:test-procedure-64>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: OPERATE
  }
  body {
      request {
          operate {
              command: '<supported async operation>'
              command_key: 'test65'
              send_resp: false
              input_args {
                 key: '<required input argument>'
                 value: '<value>'
              }
          }
      }
  }
  ```
+ Allow the EUT to send a Notify message containing an OperationComplete
  message with `obj_path` and `command_name` forming the command sent in
  the Operate message.

=== Test Metrics <sec:test-metrics-64>

+ The EUT does not send an OperateResp message.
+ The EUT sends a Notify message containing an OperationComplete message
  with `obj_path` and `command_name` forming the command in the Operate
  message, and a `command_key` of 'test65'.

== 1.66 GetInstances using a single object, first\_level\_only true <sec:getinstances-using-a-single-object-first_level_only-true>

=== Purpose <sec:purpose-65>

The purpose of this test is to ensure that the Agent will correctly
process a GetInstances message on a single object when
first\_level\_only is true.

=== Functionality Tag <sec:functionality-tag-65>

Mandatory

=== Test Setup <sec:test-setup-66>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the Agent has at least one entry in the
  Device.LocalAgent.Controller.{i}. table and supports at least one
  multi\-instance sub\-object (e.g., .MTP.{i}., etc.)

=== Test Procedure <sec:test-procedure-65>

+ Send a GetInstances message to the EUT with the following structure:
```
header {
    msg_id: '<msg_id>'
    msg_type: GET_INSTANCES
}
body {
    request {
        get_instances {
            obj_paths: 'Device.LocalAgent.Controller.'
            first_level_only: true
        }
    }
}
```

=== Test Metrics <sec:test-metrics-65>

+ The EUT sends a GetInstancesResp with one `req_path_results` elements
  containing a `requested_path` of 'Device.LocalAgent.Controller.' and
  at least one `cur_insts` element.
+ All `instantiated_obj_path` elements in the GetInstancesResp only
  contain 'Device.LocalAgent.Controller.' instances.

== 1.67 GetInstances using a single object, first\_level\_only false <sec:getinstances-using-a-single-object-first_level_only-false>

=== Purpose <sec:purpose-66>

The purpose of this test is to ensure that the Agent will correctly
process a GetInstances message on a single object when
`first_level_only` is false.

=== Functionality Tag <sec:functionality-tag-66>

Mandatory

=== Test Setup <sec:test-setup-67>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the Agent has at least one entry in the
  Device.LocalAgent.Controller.{i}. table and supports at least one
  multi\-instance sub\-object (e.g., .MTP.{i}., etc.)

=== Test Procedure <sec:test-procedure-66>

+ Send a GetInstances message to the EUT with the following structure:
```
header {
    msg_id: '<msg_id>'
    msg_type: GET_INSTANCES
}
body {
    request {
        get_instances {
            obj_paths: 'Device.LocalAgent.Controller.'
            first_level_only: false
        }
    }
}
```

=== Test Metrics <sec:test-metrics-66>

+ The EUT sends a GetInstancesResp with one `req_path_results` elements
  containing a `requested_path` of 'Device.LocalAgent.Controller.', and
  lists all instances of the Controller object, plus any instances of
  all sub\-objects.

== 1.68 GetInstances with multiple objects <sec:getinstances-with-multiple-objects>

=== Purpose <sec:purpose-67>

The purpose of this test is to ensure that the Agent will correctly
process a GetInstances message on multiple objects.

=== Functionality Tag <sec:functionality-tag-67>

Mandatory

=== Test Setup <sec:test-setup-68>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-67>

+ Send a GetInstances message to the EUT with the following structure:
```
header {
    msg_id: '<msg_id>'
    msg_type: GET_INSTANCES
}
body {
    request {
        get_instances {
            obj_paths: 'Device.LocalAgent.Controller.'
            obj_paths: 'Device.LocalAgent.MTP.'
            first_level_only: true
        }
    }
}
```

=== Test Metrics <sec:test-metrics-67>

+ The EUT sends a GetInstancesResp with two `req_path_results` elements
  containing a `requested_path` of 'Device.LocalAgent.Controller.' and
  'Device.LocalAgent.MTP.'
+ Both `req_path_results` and each having at least one `cur_insts`
  element.

== #emph[1.69 DELETED]; <sec:deleted>

#emph[Note: This test was formerly named "GetInstances with root object"
and was invalid. It has been removed from this version of the test plan
and exists only as a placeholder for numeric consistency.];

== 1.70 GetInstances with wildcard search path <sec:getinstances-with-wildcard-search-path>

=== Purpose <sec:purpose-68>

The purpose of this test is to ensure that the Agent will correctly
process a GetInstances message when a wildcard search path is used.

=== Functionality Tag <sec:functionality-tag-68>

Mandatory

=== Test Setup <sec:test-setup-69>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-68>

+ Send a GetInstances message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET_INSTANCES
  }
  body {
      request {
          get_instances {
              obj_paths: 'Device.LocalAgent.Controller.*.MTP.'
              first_level_only: true
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-68>

+ The EUT sends a GetInstancesResp with at least one `req_path_results`
  element containing a 'Device.LocalAgent.Controller.{i}.MTP.' instance.

== 1.71 GetInstances with search expression search path <sec:getinstances-with-search-expression-search-path>

=== Purpose <sec:purpose-69>

The purpose of this test is to ensure that the Agent will correctly
process a GetInstances message when a search expression search path is
used.

=== Functionality Tag <sec:functionality-tag-69>

Conditional Mandatory (Supports least one nested multi\-instance object)

=== Test Setup <sec:test-setup-70>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure there is at least one BootParameter for the Controller instance
  used for testing.
+ Ensure the Alias of the Controller used for testing is known.

=== Test Procedure <sec:test-procedure-69>

+ Send a GetInstances message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET_INSTANCES
  }

  body {
      request {
          get_instances {
              obj_paths: 'Device.LocalAgent.Controller.[Alias=="<Controller alias>"].BootParameter.'
              first_level_only: false
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-69>

+ The EUT sends a GetInstancesResp with at least one `req_path_results`
  element containing a 'Device.LocalAgent.Controller.\<Controller
  instance>.BootParameter.' instance.

== 1.72 GetSupportedDM using a single object, first\_level\_only false, all options <sec:getsupporteddm-using-a-single-object-first_level_only-false-all-options>

=== Purpose <sec:purpose-70>

The purpose of this test is to ensure that the Agent will correctly
process a GetSupportedDM message using a single object, when
`first_level_only` is false and all options are true.

=== Functionality Tag <sec:functionality-tag-70>

Mandatory

=== Test Setup <sec:test-setup-71>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-70>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths: 'Device.LocalAgent.'
              first_level_only: false
              return_commands: true
              return_events: true
              return_params: true
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-70>

+ The EUT sends a GetSupportedDMResp.
+ Every `req_obj_results` element contains all parameters, events, and
  commands below the specified partial path, plus the supported data
  model information of all sub\-objects.
+ Each SupportedParamResult field contains the `param_name`, `access`,
  `value_type`, and `value_change` fields with valid information, if the
  element is a parameter.
+ Each SupportedCommandResult field contains the `command_name` field,
  `command_type` field, and a set of `input_arg_names` and
  `output_arg_names` fields with valid information, if the element is a
  command.
+ Each SupportedEventResult field contains the `event_name` field and a
  set of `arg_names` fields with valid information, if the element is an
  event.

== 1.73 GetSupportedDM using a single object, first\_level\_only true, all options <sec:getsupporteddm-using-a-single-object-first_level_only-true-all-options>

=== Purpose <sec:purpose-71>

The purpose of this test is to ensure that the Agent will correctly
process a GetSupportedDM message using a single object, when
`first_level_only` is true and all options are true.

=== Functionality Tag <sec:functionality-tag-71>

Mandatory

=== Test Setup <sec:test-setup-72>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-71>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths: 'Device.LocalAgent.'
              first_level_only: true
              return_commands: true
              return_events: true
              return_params: true
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-71>

+ The EUT sends a GetSupportedDMResp containing `req_object_results`
  elements for the specified object and each immediate child object.
+ Only the `req_obj_results` element of the object specified in
  `obj_paths` contains parameters, events, and commands.
+ Each SupportedParamResult field contains the `param_name`, `access`,
  `value_type`, and `value_change` fields with valid information, if
  applicable.
+ Each SupportedCommandResult field contains the `command_name` field,
  `command_type` field, and a set of `input_arg_names` and
  `output_arg_names` fields with valid information, if applicable.
+ Each SupportedEventResult field contains the `event_name` field and a
  set of `arg_names` fields with valid information, if applicable.

== 1.74 GetSupportedDM using a single object, first\_level\_only true, no options <sec:getsupporteddm-using-a-single-object-first_level_only-true-no-options>

=== Purpose <sec:purpose-72>

The purpose of this test is to ensure that the Agent will correctly
process a GetSupportedDM message using a single object, when
`first_level_only` is true and all options are false.

=== Functionality Tag <sec:functionality-tag-72>

Mandatory

=== Test Setup <sec:test-setup-73>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-72>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths: 'Device.LocalAgent.'
              first_level_only: true
              return_commands: false
              return_events: false
              return_params: false
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-72>

+ The EUT sends a GetSupportedDMResp containing `req_object_results`
  elements for the specified object and each immediate child object.
+ None of the `req_obj_results` elements contain any commands, events,
  or params.

== 1.75 GetSupportedDM using multiple objects, first\_level\_only true, all options <sec:getsupporteddm-using-multiple-objects-first_level_only-true-all-options>

=== Purpose <sec:purpose-73>

The purpose of this test is to ensure that the Agent will correctly
process a GetSupportedDM message using multiple objects, when
`first_level_only` is true and all options are true.

=== Functionality Tag <sec:functionality-tag-73>

Mandatory

=== Test Setup <sec:test-setup-74>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-73>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths: 'Device.LocalAgent.Controller.'
              obj_paths: 'Device.LocalAgent.MTP.'
              first_level_only: true
              return_commands: true
              return_events: true
              return_params: true
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-73>

+ The EUT sends a GetSupportedDMResp containing `req_object_results`
  elements for the specified objects and each immediate child object.
+ Only the `req_obj_results` element of the object specified in
  `obj_paths` contains parameters, events, and commands.
+ Each SupportedParamResult field contains the `param_name`, `access`,
  `value_type`, and `value_change` fields with valid information, if
  applicable.
+ Each SupportedCommandResult field contains the `command_name` field,
  `command_type` field, and a set of `input_arg_names` and
  `output_arg_names` fields with valid information, if applicable.
+ Each SupportedEventResult field contains the `event_name` field and a
  set of `arg_names` fields with valid information, if applicable.

== 1.76 GetSupportedDM on root object, all options <sec:getsupporteddm-on-root-object-all-options>

=== Purpose <sec:purpose-74>

The purpose of this test is to ensure the Agent will correctly process a
GetSupportedDM message when the requested path is the root of the data
model.

=== Functionality Tag <sec:functionality-tag-74>

Mandatory

=== Test Setup <sec:test-setup-75>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-74>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths:'Device.'
              first_level_only: false
              return_commands: true
              return_events: true
              return_params: true
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-74>

+ The EUT sends a GetSupportedDMResp message with one or more
  `req_obj_results` specifying its entire supported data model, listing
  commands, parameters, and events.
+ Each SupportedParamResult field contains the `param_name`, `access`,
  `value_type`, and `value_change` fields with valid information, if
  applicable.
+ Each SupportedCommandResult field contains the `command_name` field,
  `command_type` field, and a set of `input_arg_names` and
  `output_arg_names` fields with valid information, if applicable.
+ Each SupportedEventResult field contains the `event_name` field and a
  set of `arg_names` fields with valid information, if applicable.

== 1.77 GetSupportedDM on unsupported object <sec:getsupporteddm-on-unsupported-object>

=== Procedure <sec:procedure>

The purpose of this test is to ensure the Agent will correctly process a
GetSupportedDM message when the requested path is an unsupported object.

=== Functionality Tag <sec:functionality-tag-75>

Mandatory

=== Test Setup <sec:test-setup-76>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-75>

+ Send a GetSupportedDM to the EUT with the following structure:
```
header {
    msg_id: '<msg_id>'
    msg_type: GET_SUPPORTED_DM
}
body {
    request {
        get_supported_dm {
            obj_paths:'Device.LocalAgent.UnsupportedObject.'
            first_level_only: false
            return_commands: true
            return_events: true
            return_params: true
        }
    }
}
```

=== Test Metrics <sec:test-metrics-75>

+ The EUT returns a GetSupportedDMResp with a single `req_obj_results`
  with an appropriate error code.

== 1.78 Removal of subscriptions that have no associated controller <sec:removal-of-subscriptions-that-have-no-associated-controller>

=== Purpose <sec:purpose-75>

According to the Device.LocalAgent.Subscription.{i}.Recipient parameter:

```
The value MUST be the Path Name of the Controller instance that will receive the Notification associated with this Subscription. If the referenced object is deleted, this instance MUST also be deleted (so the parameter value will never be an empty string).
```
This test validates that if a Controller is removed from the Agent’s
Device.LocalAgent.Controller.{i}. table, any associated Subscription
objects are also removed.

=== Functionality Tag <sec:functionality-tag-76>

Conditional Mandatory (supports Controller:1 profile with the ability to
create instances of the Device.LocalAgent.Controller. object)

=== Test Setup <sec:test-setup-77>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has two Controller instances in its
  Device.LocalAgent. Controller.{i}. table, and that both Controllers
  can be simulated by the test equipment. Consider one to be the primary
  Controller, and the other to be the secondary Controller. Record the
  secondary Controller’s instance identifier.
+ Ensure that there is at least one Subscription object in the EUT
  Device.LocalAgent.Subscription.{i}. table created by the secondary
  Controller.

=== Test Procedure <sec:test-procedure-76>

+ Send a Delete message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Controller.<instance identifier of secondary Controller>.'
      }
    }
  }
  ```
+ Allow the EUT to send an DeleteResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-76>

+ The Subscription table does not contain the Subscription object
  outlined in test setup step 3.

== 1.79 Operate message using input arguments <sec:operate-message-using-input-arguments>

=== Purpose <sec:purpose-76>

The purpose of this test is to ensure that the Agent will correctly
process an Operate message with input arguments.

=== Functionality Tag <sec:functionality-tag-77>

Conditional Mandatory (supports Device.ScheduleTimer() command or at
least one operation that contains input arguments)

=== Test Setup <sec:test-setup-78>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT with NotifType
  OperationComplete on Device.ScheduleTimer().

=== Test Procedure <sec:test-procedure-77>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: OPERATE
  }
  body {
    request {
        operate {
            command: 'Device.ScheduleTimer()'
            command_key: 'test79'
            send_resp: true
            input_args {
                key: 'DelaySeconds'
                value: '30'
            }
        }
    }
  }
  ```
+ Wait at least 30 seconds.
+ Allow the EUT to send a Notify message.

=== Test Metrics <sec:test-metrics-77>

+ The EUT sends an OperateResp message with the `req_obj_path` field,
  containing an Object Instance Path to the Request Object created as a
  result of this asynchronous operation.
+ The EUT sends a Notify message containing a valid OperationComplete
  event, with a `command_name` of 'ScheduleTimer()', an `obj_path` of
  'Device.', and a `command_key` of 'test79'.

== 1.80 GetSupportedProtocol <sec:getsupportedprotocol>

=== Purpose <sec:purpose-77>

The purpose of this test is to ensure the Controller can learn the
supported USP protocol version(s) of the EUT.

=== Functionality Tag <sec:functionality-tag-78>

Mandatory

=== Test Setup <sec:test-setup-79>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-78>

+ Send a GetSupportedProtocol message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET_SUPPORTED_PROTO
  }
  body {
    request {
      get_supported_protocol {
        controller_supported_protocol_versions: '<comma-separated list of USP specification versions>'
      }
    }
  }
  ```
+ Allow the EUT to send a GetSupportedProtocolResponse.

=== Test Metrics <sec:test-metrics-78>

+ The EUT sends a GetSupportedProtocolResponse.
+ The `agent_supported_protocol_versions` element contains a
  comma\-separated list of supported USP specification versions.

== 1.81 Automatic unique key generation <sec:automatic-unique-key-generation>

=== Purpose <sec:purpose-78>

The purpose of this test is to validate that the EUT assigns unique keys
which are not supplied in the Add message.

=== Functionality Tag <sec:functionality-tag-79>

Mandatory

=== Test Setup <sec:test-setup-80>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ If the EUT has a limit on the number of instances of the Subscription
  object, ensure that the number of existing Subscription object
  instances is less than the maximum supported.

=== Test Procedure <sec:test-procedure-79>

+ Send an Add message to the EUT with the following structure:

  ```
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
                      value: 'Device.LocalAgent.SoftwareVersion'
                    }
                }
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
                    value: 'Device.LocalAgent.EndpointID'
                  }
              }
          }
      }
    }
  ```
+ Allow the EUT to send an AddResp.
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Clean\-up: Send a Delete message to the EUT with the following
  structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: DELETE
  }
  body {
    request {
      delete {
        allow_partial: false
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier 1>.'
        obj_paths: 'Device.LocalAgent.Subscription.<instance identifier 2>.'
      }
    }
  }
  ```
+ Allow the EUT to send a DeleteResp.

=== Test Metrics <sec:test-metrics-79>

+ The EUT AddResp is valid.
+ The AddResp contains two CreatedObjectResults that each have an
  OperationStatus of OperationSuccess. The OperationSuccess elements
  contains no parameter errors and 3 elements in the unique key map:
  Alias, Recipient, and ID. The values of Alias and ID must differ
  between the two CreatedObjectResults, and the values of Recipient must
  be identical. Alternatively, the OperationSuccess contains 2 elements
  in the unique key map if the Alias parameter is not supported:
  'Recipient', and 'ID'. In this case the values of ID must differ
  between the two CreatedObjectResults, and the values of Recipient must
  be identical.

== 1.82 Get message with unmatched search expression <sec:get-message-with-unmatched-search-expression>

=== Purpose <sec:purpose-79>

The purpose of this test is to verify that the EUT sends a successful
empty response when a Get request using a search expression returns no
objects.

=== Functionality Tag <sec:functionality-tag-80>

Mandatory

=== Test Setup <sec:test-setup-81>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that no Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-80>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[Enable==true].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-80>

+ The EUT sends a GetResp.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Subscription.\[Enable\=\=true\].', and an empty
  `resolved_path_results` element (i.e., `resolved_path_results{}`).

== 1.83 GetInstances message with unmatched search expression <sec:getinstances-message-with-unmatched-search-expression>

=== Purpose <sec:purpose-80>

The purpose of this test is to verify that the EUT sends a successful
empty response when a GetInstances request using a search expression
returns no objects.

=== Functionality Tag <sec:functionality-tag-81>

Conditional Mandatory (supports least one nested multi\-instance object)

=== Test Setup <sec:test-setup-82>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-81>

+ Send a GetInstances message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET_INSTANCES
  }
  body {
    request {
      get_instances {
        obj_paths: 'Device.LocalAgent.Controller.[Alias=="<non-existent alias>"].BootParameter.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetInstancesResp.

=== Test Metrics <sec:test-metrics-81>

+ The EUT sends a GetInstancesResp.
+ The GetInstancesResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.Controller.\[Alias\=\="\<non\-existent
  alias>"\].BootParameter.', and an empty `curr_insts` element (i.e.,
  `curr_insts{}`).

== 1.84 Notification \- Subscription using search paths <sec:notification---subscription-using-search-paths>

=== Purpose <sec:purpose-81>

The purpose of this test is to ensure that the Agent will create and
acknowledge Subscriptions containing a search path, and notifies the
Controller when the conditions of the subscription are triggered.

=== Functionality Tag <sec:functionality-tag-82>

Mandatory

=== Test Setup <sec:test-setup-83>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure there are at least 2 enabled BootParameter instances under the
  Controller used for testing.

=== Test Procedure <sec:test-procedure-82>

+ Send an Add message to the EUT with the following structure:

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
          param_settings: {
              param: "Enable"
              value: "true"
          }
          param_settings: {
              param: "ID"
              value: "notify84"
          }
          param_settings: {
              param: "NotifType"
              value: "ValueChange"
          }
          param_settings: {
              param: "ReferenceList"
              value: "Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.*.Enable"
              required: true
          }
        }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:

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
          obj_path: "Device.LocalAgent.Controller.<instance identifier of Controller>.BootParameter.<valid BootParameter instance>"
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

=== Test Metrics <sec:test-metrics-82>

+ The EUT sends an AddResp.
+ The EUT sends a notification for the created subscription containing
  the BootParameter modified in step 3.

== 1.85 (For future work) Get message with unresolved instances \- addressing by instance number <sec:for-future-work-get-message-with-unresolved-instances---addressing-by-instance-number>

==== Purpose <sec:purpose-82>

This test was left out of version 1.2 of this document. There is some
ambiguity in TR\-369 Amendment 2 (USP 1.2) with regards to how paths
that use instance number addressing should be treated when they address
non\-existant objects. This will be clarified in a future release.

== 1.86 Get message with unresolved instances \- using a search path <sec:get-message-with-unresolved-instances---using-a-search-path>

=== Purpose <sec:purpose-83>

The purpose of this test is to ensure that the Agent successfully
responds to a Get request when the requested Instantiated Object Path is
valid but does not resolve to an existing object when using a search
path.

=== Functionality Tag <sec:functionality-tag-83>

Mandatory

=== Test Setup <sec:test-setup-84>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that no enabled Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-83>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.[Enable==true].'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-83>

+ The EUT’s sends a GetResp.
+ The GetResp contains no errors.
+ The GetResp contains a single `req_path_results` element. The
  `resolved_path_results` element is empty
  (i.e.~`resolved_path_results{}`).

== 1.87 Get message with unresolved instances \- using an object path <sec:get-message-with-unresolved-instances---using-an-object-path>

=== Purpose <sec:purpose-84>

The purpose of this test is to ensure that the Agent successfully
responds to a Get request when the requested Instantiated Object Path is
valid but does not resolve to an existing object when using an Object
Path.

=== Functionality Tag <sec:functionality-tag-84>

Mandatory

=== Test Setup <sec:test-setup-85>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that no Subscription objects exist on the EUT.

=== Test Procedure <sec:test-procedure-84>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.Subscription.'
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-84>

+ The EUT’s sends a GetResp.
+ The GetResp contains no errors.
+ The GetResp contains a single `req_path_results` element. The
  `requested_path_results` element is empty
  (i.e.~`requested_path_results{}`).

== 1.88 Add message fails when unique key is invalid <sec:add-message-fails-when-unique-key-is-invalid>

=== Purpose <sec:purpose-85>

The purpose of this test is to validate that the EUT will deliver an
error after it receives an Add message that includes a unique key
parameter that is not required but is set to an invalid value.

=== Functionality Tag <sec:functionality-tag-85>

Mandatory

=== Test Setup <sec:test-setup-86>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-85>

+ Send an Add message to the EUT with the following structure:

  ```
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
             value: 'True'
           }
          param_settings {
             param: 'Alias'
             value: '88InvalidAlias'
           }
          param_settings {
             param: 'NotifType'
             value: 'ValueChange'
           }
          param_settings {
             param: 'ReferenceList'
             value: 'Device.LocalAgent.SoftwareVersion'
           }
          }
        }
      }
    }
  ```
+ Allow the EUT to send an Error message.

=== Test Metrics <sec:test-metrics-85>

+ The EUT sends an Error message containing an appropriate error code.
+ The EUT does not create the new Subscription object.

== 1.89 Get message using max\_depth <sec:get-message-using-max_depth>

=== Purpose <sec:purpose-86>

The purpose of this test is to ensure the Controller can retrieve the
values of parameters in the Agent’s Instantiated Data Model using the
`max_depth` field to limit the tree depth of `result_params`.

=== Functionality Tag <sec:functionality-tag-86>

Mandatory

=== Test Setup <sec:test-setup-87>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-86>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.'
        max_depth: 1
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.'
        max_depth: 2
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: GET
  }
  body {
    request {
      get {
        param_paths: 'Device.LocalAgent.'
        max_depth: 0
      }
    }
  }
  ```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-86>

+ The first GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.', and a set of `resolved_path_results`
  elements. One contains a `resolved_path` of 'Device.LocalAgent.', and
  a number of `result_params` elements ONLY containing keys and values
  of the parameters of 'Device.LocalAgent.'. No additional
  `resolved_path_results` elements are included.
+ The second GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.', and a set of `resolved_path_results`
  elements. One contains a `resolved_path` of 'Device.LocalAgent.', and
  a number of `result_params` elements contain keys and values of the
  parameters of 'Device.LocalAgent.'. Additional `resolved_path_results`
  exist for each of the immediate\-child sub\-objects of
  Device.LocalAgent., with `result_params` containing the keys and
  values of each sub\-object’s parameters.
+ The third GetResp contains a single `req_path_results` element. The
  `requested_path_results` has no errors, has a `requested_path` equal
  to 'Device.LocalAgent.', and a set of `resolved_path_results`
  elements. One contains a `resolved_path` of 'Device.LocalAgent.', and
  a number of `result_params` elements contain keys and values of the
  parameters of 'Device.LocalAgent.'. Additional `resolved_path_results`
  exist for each of the sub\-objects of Device.LocalAgent., and their
  sub\-objects, with `result_params` containing the keys and values of
  each sub\-object’s parameters.
+ The keys of all `result_params` elements are Relative Paths.

== 1.90 Delete message with search expression that matches no objects <sec:delete-message-with-search-expression-that-matches-no-objects>

=== Purpose <sec:purpose-87>

The purpose of this test is to validate that the EUT properly handles a
Delete message using a search path that matches no objects.

=== Functionality Tag <sec:functionality-tag-87>

Mandatory

=== Test Setup <sec:test-setup-88>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that no Subscription objects exist in the Agent’s Instantiated
  Data Model with the Enable parameter set to 'false'.

=== Test Procedure <sec:test-procedure-87>

+ Send a Delete message to the EUT with the following structure:

  ```
   header {
     msg_id: '<msg_id>'
     msg_type: DELETE
    }
   body {
     request {
       delete {
         allow_partial: false
         obj_paths: 'Device.LocalAgent.Subscription.[Enable==false].'
       }
     }
   }
  ```
+ Allow the EUT to send an DeleteResp.

=== Test Metrics <sec:test-metrics-87>

+ The EUT sends a DeleteResp containing an empty `oper_success` element.

== 1.91 Unknown arguments in an Operate message <sec:unknown-arguments-in-an-operate-message>

=== Purpose <sec:purpose-88>

The purpose of this test is to ensure the Agent ignores unknown
arguments that are included in an operate message, using
Device.ScheduleTimer() as an example.

=== Functionality Tags <sec:functionality-tags-1>

Conditional Mandatory (supports Device.ScheduleTimer() command)

=== Test Setup <sec:test-setup-89>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-88>

+ Send an Operate message to the EUT with the following structure:

  ```
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
                  value: '10'
              }
              input_args {
                  key: 'InvalidArgument'
                  value: '2'
              }
          }
      }
  }
  ```
+ Wait for the EUT to send an OperateResp.

=== Test Metrics <sec:test-metrics-88>

+ The EUT sends a successful OperateResponse with 'ScheduleTimer()' in
  the `executed_command` element.

== 1.92 Agent uses default values for Operate arguments <sec:agent-uses-default-values-for-operate-arguments>

=== Purpose <sec:purpose-89>

The purpose of this test is to ensure that the Agent will correctly use
default values for non\-mandatory command arguments that include
defaults defined in the data model.

=== Functionality Tag <sec:functionality-tag-88>

Conditional Mandatory (supports the TraceRoute:1 profile)

=== Test Setup <sec:test-setup-90>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-89>

+ Send an Operate message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: OPERATE
  }
  body {
      request {
          operate {
              command: 'Device.IP.Diagnostics.TraceRoute()'
              command_key: 'test92'
              send_resp: true
              input_args {
                 key: 'Host'
                 value: '<remote host IP>'
              }
              input_args {
                 key: 'ProtocolVersion'
                 value: 'Any'
              }
          }
      }
  }
  ```
+ Allow the EUT to send an Operate Response message with an
  `executed_command` which matches the command sent in the Operate
  message.
+ Do not reply to the TraceRoute ICMP requests.

=== Test Metrics <sec:test-metrics-89>

+ The EUT sends an OperateResp message with a single `operation_results`
  element containing an `executed_command` of
  'Device.IP.Diagnostics.TraceRoute()' and a `req_obj_path` field
  containing a path name to the Request object created by the EUT.
+ The EUT attempts a TraceRoute diagnostic against the supplied host
  name. It retries 3 times within a 1% range of a 5000 millisecond delay
  between each retry, which are the default values.

== 1.93 Subscription using TriggerAction Config <sec:subscription-using-triggeraction-config>

=== Purpose <sec:purpose-90>

The purpose of this test is to ensure that the Agent will update its
configuration when the conditions of a subscription are fulfilled.

=== Functionality Tag <sec:functionality-tag-89>

Conditional Mandatory (supports the
Device.LocalAgent.Subscription.{i}.TriggerAction and
Device.LocalAgent.Subscription.{i}.TriggerConfigSettings parameters)

=== Test Setup <sec:test-setup-91>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue93'.

=== Test Procedure <sec:test-procedure-90>

+ Send an Add message to the EUT with the following structure:
```
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
          param: 'TriggerAction'
          value: 'Config'
        }
        param_settings {
            param: 'ID'
            value: 'notify93'
        }
        param_settings {
            param: 'NotifType'
            value: 'ValueChange'
        }
        param_settings {
            param: 'ReferenceList'
            value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
            required: true
        }
        param_settings {
            param: 'NotifRetry'
            value: 'true'
        }
      }
    }
  }
}
```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.'
        param_settings {
          param: 'TriggerConfigSettings'
          value: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.Enable=false'
          required: true
        }
      }
    }
  }
}
```
+ Send a Set message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
        param_settings {
          param: 'ProvisioningCode'
          value: 'TestValue93'
          required: true
        }
      }
    }
  }
}
```
+ Send a Get message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: GET
}
body {
  request {
    get {
      param_paths: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.Enable'
    }
  }
}
```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-90>

+ The EUT sends a successful AddResp.
+ The EUT sends a GetResp that contains a result\_params element with a
  key of 'Enable' and a value set to 'false'.

== 1.94 Subscription using TriggerAction NotifyAndConfig <sec:subscription-using-triggeraction-notifyandconfig>

=== Purpose <sec:purpose-91>

The purpose of this test is to ensure that the Agent will update its
configuration and notify the Controller when the conditions of a
subscription are fulfilled.

=== Functionality Tag <sec:functionality-tag-90>

Conditional Mandatory (supports the
Device.LocalAgent.Subscription.{i}.TriggerAction and
Device.LocalAgent.Subscription.{i}.TriggerConfigSettings parameters)

=== Test Setup <sec:test-setup-92>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the traffic generator has learned the instance identifier
  of the Device.LocalAgent.Controller. object that represents the
  Controller simulated by the traffic generator.
+ Set the Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode to an arbitrary value that is not
  'TestValue94'.

=== Test Procedure <sec:test-procedure-91>

+ Send an Add message to the EUT with the following structure:
```
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
          param: 'TriggerAction'
          value: 'NotifyAndConfig'
        }
        param_settings {
          param: 'ID'
          value: 'notify94'
          }
        param_settings {
          param: 'NotifType'
          value: 'ValueChange'
        }
        param_settings {
          param: 'ReferenceList'
          value: 'Device.LocalAgent.Controller.<instance identifier>.ProvisioningCode'
          required: true
        }
        param_settings {
          param: 'NotifRetry'
          value: 'true'
        }
      }
    }
  }
}
```
+ Allow the EUT to send an AddResp
+ Send a Set message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.'
        param_settings {
          param: 'TriggerConfigSettings'
          value: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.Enable=false'
          required: true
        }
      }
    }
  }
}
```
+ Send a Set message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: SET
}
body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: 'Device.LocalAgent.Controller.<instance identifier>.'
        param_settings {
          param: 'ProvisioningCode'
          value: 'TestValue94'
          required: true
        }
      }
    }
  }
}
```
+ Allow the EUT to send a Notify message.
+ Send a NotifyResp to the EUT.
+ Send a Get message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: GET
}
body {
  request {
    get {
      param_paths: 'Device.LocalAgent.Subscription.<instance identifier from step 2>.Enable'
    }
  }
}
```
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-91>

+ The EUT sends a successful AddResp.
+ The EUT sends a Notify message with a subscription\_id field equal to
  'Notify94', and an event element of value\_change with a param\_path
  of 'Device.LocalAgent.Controller.\<instance
  identifier>.ProvisioningCode' and a param\_value of 'TestValue94'.
+ The EUT sends a GetResp that contains a result\_params element with a
  key of 'Enable' and a value set to 'false'.

== 1.95 Add message with search expression <sec:add-message-with-search-expression>

=== Purpose <sec:purpose-92>

The purpose of this test is to ensure the EUT properly handles an Add
message that contains a search expression.

=== Functionality Tag <sec:functionality-tag-91>

Mandatory

=== Test Setup <sec:test-setup-93>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has at least two Controller instances in its
  Device.LocalAgent.Controller.{i}. table.

=== Test Procedure <sec:test-procedure-92>

+ Send an Add message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: ADD
}
body {
  request {
    add {
      allow_partial: false
      create_objs {
        obj_path: 'Device.LocalAgent.Controller.[Enable==true].BootParameter.'
        param_settings {
          param: 'Enable'
          value: 'true'
        }
        param_settings {
          param: 'ParameterName'
          value: 'Device.LocalAgent.SoftwareVersion'
        }
      }
    }
  }
}
```
+ Allow the EUT to send an AddResp.
+ Send a Get message to the EUT with the following structure:
```
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
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-92>

+ The AddResp contains at least one CreatedObjectResult object that has
  an OperationStatus that has an element of type OperationSuccess.
+ The EUT sends a GetResp that contains the new BootParameter object.

== 1.96 Non\-functional Unique Key Immutability <sec:non-functional-unique-key-immutability>

=== Purpose <sec:purpose-93>

The purpose of this test is to ensure the EUT does not allow a
non\-functional unique key to be changed.

=== Functionality Tag <sec:functionality-tag-92>

Mandatory

=== Test Setup <sec:test-setup-94>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-93>

+ Send an Add message to the EUT with the following structure:
```
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
          value: 'add96'
        }
      }
    }
  }
}
```
+ Send a Get message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: GET
}
body {
  request {
    get {
      param_paths: 'Device.LocalAgent.Subscription.<instance identifier>.'
    }
  }
}
```
+ Send a Set message to the EUT with the following structure:
```
header {
  msg_id: '<msg_id>'
  msg_type: SET
}

body {
  request {
    set {
      allow_partial: false
      update_objs {
        obj_path: 'Device.LocalAgent.Subscription.<instance identifier from step 1>.'
        param_settings {
        param: 'ID'
        value: 'add96-NEW'
        required: true
        }
      }
    }
  }
}
```
+ Allow the EUT to send an Error.

=== Test Metrics <sec:test-metrics-93>

+ The EUT sends an Error indicating it did not allow a non\-functional
  unique key to be changed.

== 1.97 GetSupportedDM on root object, commands <sec:getsupporteddm-on-root-object-commands>

=== Purpose <sec:purpose-94>

The purpose of this test is to ensure the EUT provides correctly
formatted input arguments for commands returned in GetSupportedDM Resp.

=== Functionality Tag <sec:functionality-tag-93>

Conditionally Mandatory (Supports a command that includes one or more
input arguments)

=== Test Setup <sec:test-setup-95>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-94>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths:'Device.'
              first_level_only: false
              return_commands: true
              return_events: false
              return_params: false
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-94>

+ The EUT sends a GetSupportedDMResp message with one or more
  `req_obj_results` specifying its entire supported data model, listing
  only commands.
+ Each SupportedCommandResult field contains a `command_name` field, an
  `input_arg_names` field, an `output_arg_names` field, and a
  `command_type` field.
+ The `command_type` field indicates if the command is asynchronous or
  synchronous.
+ At least one `input_arg_fields` contains a list of one or more input
  arguments. The input arguments are relative paths.

== 1.98 GetSupportedDM on root object, events <sec:getsupporteddm-on-root-object-events>

=== Purpose <sec:purpose-95>

The purpose of this test is to ensure the EUT provides correctly
formatted fields for events returned in GetSupportedDM Resp.

=== Functionality Tag <sec:functionality-tag-94>

Conditionally Mandatory (Supports an event that includes one or more
arguments)

=== Test Setup <sec:test-setup-96>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-95>

+ Send a GetSupportedDM to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths:'Device.'
              first_level_only: false
              return_commands: false
              return_events: true
              return_params: false
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-95>

+ The EUT sends a GetSupportedDMResp message with one or more
  `req_obj_results` specifying its entire supported data model, listing
  only events.
+ Each SupportedEventResult field contains the `event_name` field and an
  `arg_names` field.
+ At least one `arg_names` field contains a list of one or more
  arguments. The arguments are relative paths.

= 2 Authentication and Access Control Test Cases <sec:authentication-and-access-control-test-cases>

== 2.1 Agent does not accept messages from its own Endpoint ID <sec:agent-does-not-accept-messages-from-its-own-endpoint-id>

=== Purpose <sec:purpose-96>

The purpose of this test is to ensure the EUT does not respond to a USP
message when the `from_id` is the EUT endpoint ID.

=== Functionality Tag <sec:functionality-tag-95>

Mandatory

=== Test Setup <sec:test-setup-97>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Steps <sec:test-steps>

+ Send a message to the EUT with the following record structure:

  ```
      to_id: '<EUT_ID>'
      from_id: '<EUT_ID>'

      session_context {
          # ...
      }
  ```

=== Test Metrics <sec:test-metrics-96>

+ The EUT does not respond to the message.

== 2.2 Agent rejects messages that do not contain its to\_id in the USP Record <sec:agent-rejects-messages-that-do-not-contain-its-to_id-in-the-usp-record>

=== Purpose <sec:purpose-97>

The purpose of this test is to ensure the EUT does not respond to a USP
message when the USP record doesn’t contain a the EUT `to_id`.

=== Functionality Tags <sec:functionality-tags-2>

Mandatory

=== Test Setup <sec:test-setup-98>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Steps <sec:test-steps-1>

+ Send a message to the EUT with the following record structure:

  ```
      to_id: '<invalid ID>'
      from_id: '<EUT_ID>'

      # ...
  ```

=== Test Metrics <sec:test-metrics-97>

+ The EUT does not respond to the USP message.

== 2.3 Agent does not process messages without ’s certificate information \- DEPRECATED <sec:agent-does-not-process-messages-without-s-certificate-information---deprecated>

=== Purpose <sec:purpose-98>

The purpose of this test is to ensure that the EUT doesn’t process a USP
message when the EUT does not possess the Controller’s certificate
information.

=== Functionality Tags <sec:functionality-tags-3>

Deprecated

=== Test Setup <sec:test-setup-99>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Simulate a second Controller whose credentials are signed by an
  untrusted certificate authority.
+ Ensure that the UntrustedRole feature is either unsupported or
  disabled in the EUT.

=== Test Procedure <sec:test-procedure-96>

+ Send a Get message from the second simulated Controller to the EUT
  with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-98>

+ Ensure the EUT does not respond to the Get message.

== 2.4 Agent rejects messages from Endpoint IDs that are not in subjectAltName \- DEPRECATED <sec:agent-rejects-messages-from-endpoint-ids-that-are-not-in-subjectaltname---deprecated>

=== Purpose <sec:purpose-99>

The purpose of this test is to ensure that the EUT rejects a message
from an Endpoint ID that doesn’t match the subjectAltName in the
provided certificate.

=== Functionality Tags <sec:functionality-tags-4>

Deprecated

=== Test Setup <sec:test-setup-100>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-97>

+ Send a Get message to the EUT using a certificate with a
  subjectAltName that does not match the Controller’s Endpoint ID.

=== Test Metrics <sec:test-metrics-99>

+ The EUT does not respond to the Get message.

== 2.5 Agent use of self\-signed certificates \- DEPRECATED <sec:agent-use-of-self-signed-certificates---deprecated>

=== Purpose <sec:purpose-100>

The purpose of this test is to ensure the EUT can handle self\-signed
certificates.

=== Functionality Tags <sec:functionality-tags-5>

Deprecated

=== Test Setup <sec:test-setup-101>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the is configured to use a self\-signed certificate and
  Endpoint ID that the EUT has not seen.

=== Test Procedure <sec:test-procedure-98>

+ Send a Get message to the EUT using a self\-signed cert with the
  following structure:

  ```
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

=== Test Metrics <sec:test-metrics-100>

+ The EUT responds to the Get with a GetResponse containing a
  'Device.LocalAgent.ControllerTrust.{i}.Alias' parameter.

== 2.6 Connecting without absolute time <sec:connecting-without-absolute-time>

=== Purpose <sec:purpose-101>

The purpose of this test is to ensure the EUT can communicate with a
Controller if it cannot obtain an absolute time.

=== Functionality Tags <sec:functionality-tags-6>

Conditional Mandatory (Supports USP Session Context)

=== Test Setup <sec:test-setup-102>

+ The EUT is booted into a test environment where it cannot resolve
  absolute time.
+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller is configured to use an expired certificate.

=== Test Procedure <sec:test-procedure-99>

+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-101>

+ The EUT responds to the Get message with a GetResponse, ignoring the
  expired dates on the certificate.

== 2.7 Agent ignores unsigned or invalid Record signatures <sec:agent-ignores-unsigned-or-invalid-record-signatures>

=== Purpose <sec:purpose-102>

The purpose of this test is to ensure the EUT will ignore a USP record
when the signature field is invalid.

=== Functionality Tags <sec:functionality-tags-7>

Conditional Mandatory (Supports USP Session Context)

=== Test Setup <sec:test-setup-103>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-100>

+ Send a Get message to the EUT with an invalid signature value.

=== Test Metrics <sec:test-metrics-102>

+ The EUT does not respond to the Get message.

== 2.8 Agent ignores invalid TLS certificate <sec:agent-ignores-invalid-tls-certificate>

=== Purpose <sec:purpose-103>

The purpose of this test is to ensure the EUT rejects TLS connections
when an Endpoint’s TLS certificate is invalid.

=== Functionality Tags <sec:functionality-tags-8>

Conditional Mandatory (Supports USP Session Context)

=== Test Setup <sec:test-setup-104>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has obtained an absolute time reference.

=== Test Procedure <sec:test-procedure-101>

+ Send a Get message to the EUT with an expired TLS certificate.

=== Test Metrics <sec:test-metrics-103>

+ The EUT doesn’t respond to the Get message.

== 2.9 Use of the Untrusted role <sec:use-of-the-untrusted-role>

=== Purpose <sec:purpose-104>

The purpose of this test is to ensure the EUT correctly assigns new a
Role of Untrusted.

=== Functionality Tags <sec:functionality-tags-9>

Conditional Mandatory (supports the ControllerTrust:1 profile)

=== Test Setup <sec:test-setup-105>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-102>

+ Using a secondary Controller, connect to the EUT and send an Get
  message.
+ Using the primary trusted Controller send a Get message to the EUT
  with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-104>

+ Ensure the
  `Device.LocalAgent.Controller.<secondary Controller instance>.AssignedRole`
  matches the value of
  `Device.LocalAgent.ControllerTrust.UntrustedRole`.

== 2.10 Adding a Role <sec:adding-a-role>

=== Purpose <sec:purpose-105>

The purpose of this test is to ensure that the Add message can be used
to add new Roles to the EUT data model.

=== Functionality Tags <sec:functionality-tags-10>

Conditional Mandatory (supports the ControllerTrust:1 profile)

=== Test Setup <sec:test-setup-106>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-103>

+ Send a Add message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-105>

+ The EUT correctly sent an AddResponse with a new Role instance.

== 2.11 Permissions \- Object Creation Allowed <sec:permissions---object-creation-allowed>

=== Purpose <sec:purpose-106>

The purpose of this test is to ensure the EUT adheres to permissions set
to allow the creation of a particular object.

=== Functionality Tags <sec:functionality-tags-11>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-107>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Procedure <sec:test-procedure-104>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Add message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-106>

+ The EUT sends an AddResponse with a oper\_success element containing a
  new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an AddResponse with a oper\_success element containing a
  new Device.LocalAgent.Subscription. object in step 2.

== 2.12 Permissions \- Object Creation Not Allowed <sec:permissions---object-creation-not-allowed>

=== Purpose <sec:purpose-107>

The purpose of this test is to ensure the EUT adheres to permissions set
to restrict the creation of a particular object.

=== Functionality Tags <sec:functionality-tags-12>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-108>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Procedure <sec:test-procedure-105>

+ Send an Add message to the EUT with the following structure:
```
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
+ Send an Add message to the EUT with the following structure:
```
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

=== Test Metrics <sec:test-metrics-107>

+ The EUT sends an AddResponse with a oper\_success element containing a
  new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an Error containing type '7006' \- Permission Denied.

== 2.13 Permissions \- Object Deletion Allowed <sec:permissions---object-deletion-allowed>

=== Purpose <sec:purpose-108>

The purpose of this test is to ensure the EUT adheres to permissions set
to allow the deletion of a particular object.

=== Functionality Tags <sec:functionality-tags-13>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-109>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is one or more Subscription object that can be deleted.

=== Test Procedure <sec:test-procedure-106>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Delete message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-108>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an DeleteResponse with a `oper_success` element
  containing the Device.LocalAgent.Subscription. object in step 2.

== 2.14 Permissions \- Object Deletion Not Allowed <sec:permissions---object-deletion-not-allowed>

=== Purpose <sec:purpose-109>

The purpose of this test is to ensure the EUT adheres to permissions set
to restrict the deletion of a particular object.

=== Functionality Tags <sec:functionality-tags-14>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-110>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is one or more Subscription object that can be deleted.

=== Test Procedure <sec:test-procedure-107>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Delete message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-109>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an Error containing type '7006' \- Permission Denied.

== 2.15 Permissions \- Parameter Update Allowed <sec:permissions---parameter-update-allowed>

=== Purpose <sec:purpose-110>

The purpose of this test is to ensure the EUT adheres to permissions set
to allow the update of a particular object.

=== Functionality Tags <sec:functionality-tags-15>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-111>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is one or more Subscription object that can be edited.

=== Test Procedure <sec:test-procedure-108>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Set message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-110>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends a SetResponse with a `oper_success` element containing
  Device.LocalAgent.Subscription.{i}.Enable in step 2.

== 2.16 Permissions \- Parameter Update Not Allowed <sec:permissions---parameter-update-not-allowed>

=== Purpose <sec:purpose-111>

The purpose of this test is to ensure the EUT adheres to permissions set
to restrict the update of a particular object.

=== Functionality Tags <sec:functionality-tags-16>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-112>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is one or more Subscription object that can be edited.

=== Test Steps <sec:test-steps-2>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Set message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-111>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an Error containing type '7006' \- Permission Denied.

== 2.17 Permissions \- Operation Allowed <sec:permissions---operation-allowed>

=== Purpose <sec:purpose-112>

The purpose of this test is to ensure the EUT adheres to permissions set
to allow the invocation of commands on a particular object.

=== Functionality Tags <sec:functionality-tags-17>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-113>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Steps <sec:test-steps-3>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-112>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an OperateResponse with a `req_output_args` element in
  step 2.

== 2.18 Permissions \- Operation Not Allowed <sec:permissions---operation-not-allowed>

=== Purpose <sec:purpose-113>

The purpose of this test is to ensure the EUT adheres to permissions set
to restrict the invocation of commands on a particular object.

=== Functionality Tags <sec:functionality-tags-18>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-114>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Steps <sec:test-steps-4>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-113>

+ The EUT sends an AddResponse with a `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an OperateResponse message containing a `cmd_failure`
  element with an appropriate error code.
#emph[NOTE: The behavior required in Metric 2 was updated in USP 1.4,
and was updated here to ensure that implementations seeking
certification would use the correct behavior. If an implementation using
USP 1.3 or earlier is tested against this test case, it MAY respond with
a USP Error Message instead.];

== 2.19 Permissions \- Value Change Notification Allowed on Parameter <sec:permissions---value-change-notification-allowed-on-parameter>

=== Purpose <sec:purpose-114>

The purpose of this test is to ensure the EUT adheres to permissions set
to allow a Controller to subscribe to the ValueChange notification of a
particular parameter.

=== Functionality Tags <sec:functionality-tags-19>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-115>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Steps <sec:test-steps-5>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Set message to the EUT, setting
  Device.LocalAgent.Controller.\<Controller instance
  id>.PeriodicNotifInterval to a new value.
+ Wait for a Notification from the EUT.

=== Test Metrics <sec:test-metrics-114>

+ The EUT sends an AddResponse with an `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an AddResponse with an `oper_success` element containing
  a new Device.LocalAgent.Subscription. object in step 2.
+ The EUT sends a SetResponse with an `oper_success` element with the
  path 'Device.LocalAgent.Controller.\<Controller instance
  id>.PeriodicNotifInterval'.
+ The EUT sends a Notify message with a `value_change` element pointing
  to 'Device.LocalAgent.Controller.\<Controller
  instance>.PeriodicNotifInterval'.

== 2.20 Permissions \- Value Change Notification Not Allowed on Parameter <sec:permissions---value-change-notification-not-allowed-on-parameter>

=== Purpose <sec:purpose-115>

The purpose of this test is to ensure the EUT adheres to permissions set
to restrict a Controller from subscribing to the ValueChange
notification of a particular parameter.

=== Functionality Tags <sec:functionality-tags-20>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-116>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Steps <sec:test-steps-6>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Set message to the EUT, setting
  Device.LocalAgent.Controller.\<Controller instance
  id>.PeriodicNotifInterval to a new value.
+ Wait 30 seconds.

=== Test Metrics <sec:test-metrics-115>

+ The EUT sends an AddResponse with an `oper_success` element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an AddResponse with an `oper_success` element containing
  a new Device.LocalAgent.Subscription. object in step 2.
+ The EUT sends a SetResponse with an `oper_success` element with the
  path 'Device.LocalAgent.Controller.\<Controller instance
  id>.PeriodicNotifInterval'.
+ The EUT does not send a Notify message with a value\_change element
  pointing to 'Device.LocalAgent.Controller.\<Controller
  instance>.PeriodicNotifInterval'.

== 2.21 Permissions \- Overlapping Permissions <sec:permissions---overlapping-permissions>

=== Purpose <sec:purpose-116>

The purpose of this test is to ensure the EUT allows for the creation of
Permission instances, and when Permissions overlap the EUT behaves
correctly.

=== Functionality Tags <sec:functionality-tags-21>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-117>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is at least one BootParameter configured.

=== Test Procedure <sec:test-procedure-109>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-116>

+ The EUT sends an AddResponse message after step 1. The message
  contains two `oper_success` elements, one for each added permission.
+ The EUT sends a GetResponse with a `result_params` element containing
  parameters of the specified BootParameter instance.
+ The EUT sends an AddResponse message after step 3. The message
  contains an `oper_success` element.
+ The EUT sends a GetResponse that does not contain the specified
  BootParameter instance.

== 2.22 Using Get when no read permissions are available on some parameters <sec:using-get-when-no-read-permissions-are-available-on-some-parameters>

=== Purpose <sec:purpose-117>

The purpose of this test is to ensure the EUT correctly returns
parameters that are readable while ignoring parameters that do not have
read permissions.

=== Functionality Tags <sec:functionality-tags-22>

Conditional Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-118>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure there is at least one BootParameter configured.

=== Test Procedure <sec:test-procedure-110>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-117>

+ The EUT sends an AddResponse message after step 1. The message
  contains a `oper_success` element for the added Permission.
+ The EUT sends a GetResponse with a `result_params` element containing
  parameters of the specified BootParameter instance, with the exception
  of the 'ParameterName' parameter.

== 2.23 Permissions \- Add message with search path, allow partial true, required parameters fail <sec:permissions---add-message-with-search-path-allow-partial-true-required-parameters-fail>

=== Purpose <sec:purpose-118>

The purpose of this test is to ensure the EUT properly handles an add
message with a search path with allow\_partial set to true when some
objects fail to be added.

=== Functionality Tag <sec:functionality-tag-96>

Conditionally Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-119>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure that the EUT has at least two Controller instances in its
  Device.LocalAgent.Controller.{i}. table.

=== Test Procedure <sec:test-procedure-111>

+ Send an Add message to the EUT with the following structure:

  ```
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
                      param: 'Param'
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
                      param: 'Param'
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send an AddResp.

=== Test Metrics <sec:test-metrics-118>

+ The EUT sends an AddResponse message after step 1. The message
  contains two oper\_success elements, one for each added permission.
+ The AddResp in step 3 contains two CreatedObjectResults. One
  CreateObjectResult is an element of type OperationSuccess. The
  OperationSuccess element contains an instantiated\_path element
  containing the new BootParameter object under
  Device.LocalAgent.Controller.\<Controller instance id>.
+ The other CreateObjectResult is an element of type OperationFailure.
  The OperationFailure element contains an err\_code of '7006',
  'Permission Denied'

== 2.24 Permissions \- Add message with search path, allow partial false, required parameters fail <sec:permissions---add-message-with-search-path-allow-partial-false-required-parameters-fail>

=== Purpose <sec:purpose-119>

The purpose of this test is to ensure the EUT properly handles an add
message with a search path with allow\_partial set to false when some
objects fail to be added.

=== Functionality Tag <sec:functionality-tag-97>

Conditionally Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-120>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.
+ Ensure that the EUT has at least two Controller instances in its
  Device.LocalAgent.Controller.{i}. table.

=== Test Procedure <sec:test-procedure-112>

+ Send an Add message to the EUT with the following structure:

  ```
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
                          param: 'Param'
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
                          param: 'Param'
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send an Error.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-119>

+ The EUT sends an AddResponse message after step 1. The message
  contains two oper\_success elements, one for each added permission.
+ The EUT sends an Error message in step 3. The Error message contains
  an err\_code of 7006, 'Permission Denied', with the param\_errs
  element containing a single error with a param\_path of
  'Device.LocalAgent.Controller.\<Secondary Controller
  id>.BootParameter', and an err\_code of 7006, 'Permission Denied'.
+ The EUT did not create any new BootParameter objects.

== 2.25 Permissions \- Parameter within added object not allowed, omitted <sec:permissions---parameter-within-added-object-not-allowed-omitted>

=== Purpose <sec:purpose-120>

The purpose of this test is to ensure the EUT properly handles an add
message when a parameter within the added object cannot be written to
and the parameter is omitted from the Add message.

=== Functionality Tag <sec:functionality-tag-98>

Conditionally Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-121>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Procedure <sec:test-procedure-113>

+ Send an Add message to the EUT with the following structure:

  ```
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
                      param: 'Param'
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send an AddResp.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-120>

+ The EUT sends an AddResponse with a oper\_success element containing a
  new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The EUT sends an AddResp message with an oper\_success element
  containing a new Device.LocalAgent.Subscription. object.
+ The EUT sends a GetResp with a value of "false" for the Enable
  parameter of the new Subscription object.

== 2.26 Permissions \- Parameter within added object not allowed, included <sec:permissions---parameter-within-added-object-not-allowed-included>

=== Purpose <sec:purpose-121>

The purpose of this test is to ensure the EUT properly handles an add
message when a parameter within the added object cannot be written to
and the parameter is included in the Add message.

=== Functionality Tag <sec:functionality-tag-99>

Conditionally Mandatory (supports the ControllerTrust:1 profile with at
least one role that allows object creation, or supports writable
parameters in Device.LocalAgent.ControllerTrust.{i}.Role.{i}.)

=== Test Setup <sec:test-setup-122>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the Controller used for testing has an assigned Role that is
  writable.

=== Test Procedure <sec:test-procedure-114>

+ Send an Add message to the EUT with the following structure:

  ```
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
                      param: 'Param'
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send an AddResp.
+ Send a Get message to the EUT with the request path of
  'Device.LocalAgent.Subscription.'.

=== Test Metrics <sec:test-metrics-121>

+ The EUT sends an AddResponse with an oper\_success element containing
  a new Device.LocalAgent.ControllerTrust.Role.{i}.Permission. object in
  step 1.
+ The AddResp contains a single CreatedObjectResult that has an
  OperationStatus that is an element of type OperationFailure. The
  OperationFailure element contains an err\_code of '7006' 'Permission
  Denied'.
+ The GetResp from the EUT does not contain a Subscription instance with
  ID 'add26'.

== 2.27 Use of SecuredRole <sec:use-of-securedrole>

=== Purpose <sec:purpose-122>

The purpose of this test is to ensure the EUT shares secured parameters
with a Controller which is assigned the SecuredRole.

=== Functionality Tag <sec:functionality-tag-100>

Conditional Mandatory (supports the ControllerTrust:1 profile,
Device.LocalAgent.ControllerTrust.SecuredRoles, and a parameter with the
secured attribute)

=== Test Setup <sec:test-setup-123>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has two Controller instances in its
  Device.LocalAgent.Controller.{i}. table, and that both Controllers can
  be simulated by the test equipment. Consider one to be the primary
  Controller, and the other to be the secondary Controller.
+ Ensure that the EUT supports a parameter with the secured attribute.
  Ensure that the secondary Controller is assigned a Role that can read
  the secured parameter. The Role is not added to the
  Device.LocalAgent.ControllerTrust.SecuredRoles parameter.

=== Test Procedure <sec:test-procedure-115>

+ The secondary Controller sends a Get message to the EUT for the
  secured parameter from test setup.
+ Allow the EUT to send a GetResp.
+ Send a Set message to the EUT with the following structure:

  ```
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
+ The secondary Controller sends a Get message to the EUT for the
  secured parameter from test setup.
+ Allow the EUT to send a GetResp.

=== Test Metrics <sec:test-metrics-122>

+ The EUT sends a GetResp that contains an empty string in place of a
  value for the secured parameter when the Controller’s Role is not in
  the SecuredRoles list.
+ The EUT sends a GetResp that contains the value for the secured
  parameter when the Controller’s Role is in the SecuredRoles list.

= 3 USP Record Test Cases <sec:usp-record-test-cases>

== 3.1 Bad request outside a session context <sec:bad-request-outside-a-session-context>

=== Purpose <sec:purpose-123>

The purpose of this test is to ensure the EUT correctly responds to a
bad request outside a session context.

=== Functionality Tags <sec:functionality-tags-23>

Mandatory

=== Test Setup <sec:test-setup-124>

+ Ensure the EUT is configured to not use a session context.
+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-116>

+ Send a malformed USP Record to the EUT.

=== Test Metrics <sec:test-metrics-123>

+ The EUT either ignores the malformed record or sends a USP Record
  Error.

== 3.2 Agent Verifies Non\-Payload Field Integrity <sec:agent-verifies-non-payload-field-integrity>

=== Purpose <sec:purpose-124>

The purpose of this test is to ensure the EUT verifies the integrity of
the non\-payload fields in a USP record.

=== Functionality Tags <sec:functionality-tags-24>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-125>

+ Ensure the relevant equipment are configured to NOT provide integrity
  protection at the MTP layer.
+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.

=== Test Procedure <sec:test-procedure-117>

+ Send a Get message to the EUT with a `payload_security` of PLAINTEXT.

=== Test Metrics <sec:test-metrics-124>

+ After the EUT receives the USP record, it exhibits the expected 'bad
  request' behavior for the applicable MTP.

== 3.3 Agent rejects invalid signature starting a session context <sec:agent-rejects-invalid-signature-starting-a-session-context>

=== Purpose <sec:purpose-125>

The purpose of this test is to ensure the EUT handles an attempt to
start a session context with an invalid `mac_signature`.

=== Functionality Tags <sec:functionality-tags-25>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-126>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.

=== Test Procedure <sec:test-procedure-118>

+ Send a TLS 'client hello' to the EUT to begin a session context as
  described in
  '#link("https://usp.technology/specification/e2e-message-exchange/")[End
  to End Message Exchange]' in TR\-369 with an invalid `mac_signature`.

=== Test Metrics <sec:test-metrics-125>

+ After the EUT receives the USP record, it exhibits the expected 'bad
  request' behavior for the applicable MTP.

== 3.4 Using TLS for USP Record Integrity <sec:using-tls-for-usp-record-integrity>

=== Purpose <sec:purpose-126>

The purpose of this test is to ensure the EUT uses TLS to validate the
integrity of USP records when the `payload_security` is TLS and the TLS
handshake has completed.

=== Functionality Tags <sec:functionality-tags-26>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-127>

+ Ensure the EUT and controller are configured to secure the USP record
  payload with TLS.

=== Test Procedure <sec:test-procedure-119>

+ Start a E2E session with the EUT using TLS to secure the payload.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-126>

+ In the GetResponse sent by the EUT, the `mac_signature` in the USP
  Record secures the non\-payload fields via the MAC mechanism.
+ The `mac_signature` in the USP record sent by the EUT validates the
  integrity of the non\-payload fields.

== 3.5 Failure to Establish TLS <sec:failure-to-establish-tls>

=== Purpose <sec:purpose-127>

The purpose of this test is to ensure the EUT behaves correctly when the
TLS session used to encapsulate the payload cannot be established.

=== Functionality Tags <sec:functionality-tags-27>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-128>

+ Configure the controller to use TLS12 as a `payload_security`.
+ Ensure `PeriodicNotifInterval` is '60', and the controller used for
  testing is subscribed to Periodic Event Notification.

=== Test Procedure <sec:test-procedure-120>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET
  }
  body {
      request {
          get {
              param_paths: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
          }
      }
  }
  ```
+ Attempt to establish a new secure session with the EUT using TLS
  payload encapsulation.
+ Configure the controller to send TLS alerts during the TLS handshake
  process.
+ Wait for the EUT to attempt to start a session with the controller.
+ Allow the controller to send a TLS alert to the EUT and for the
  session to terminate.
+ Configure the controller to not send a TLS alert.
+ Wait for the EUT to retry establishing a E2E session.

=== Test Metrics <sec:test-metrics-127>

+ After sending the client certificate to the EUT, the EUT sends a TLS
  alert, terminating the session.
+ After step 5, the EUT waits before retrying the session in accordance
  with the 'SessionRetry' parameters found in step 1.

== 3.6 Agent does not accept TLS renegotiation for E2E message exchange <sec:agent-does-not-accept-tls-renegotiation-for-e2e-message-exchange>

=== Purpose <sec:purpose-128>

The purpose of this test is to ensure the EUT does not accept TLS
renegotiation. frames during a E2E message exchange.

=== Functionality Tags <sec:functionality-tags-28>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-129>

+ Ensure both the EUT and the controller are configured to use TLS
  payload security.

=== Test Procedure <sec:test-procedure-121>

+ Establish a E2E session with the EUT.
+ Send a request to renegotiate TLS in place of the payload.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse from the EUT.

=== Test Metrics <sec:test-metrics-128>

+ Between sending the TLS renegotiation request and receiving the
  GetResponse, the EUT either sends no records, or sends a TLS alert of
  type `no_renegotiation(100)`.

== 3.7 Use of X.509 Certificates <sec:use-of-x.509-certificates>

=== Purpose <sec:purpose-129>

The purpose of this test is to ensure the EUT correctly uses X.509
certificates to authenticate other endpoints, and in turn provides a
X.509 certificate for the purpose of authentication.

=== Functionality Tags <sec:functionality-tags-29>

'Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)'

=== Test Setup <sec:test-setup-130>

+ Ensure the EUT and controller are configured to use TLS payload
  security.

=== Test Procedure <sec:test-procedure-122>

+ Configure the controller to provide a X.509 certificate with a
  `subjectAltName` that does not match the controller’s USP endpoint ID.
+ Attempt to start a session with the EUT and send a Get message with
  the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-129>

+ During the TLS handshake the EUT provides a X.509 certificate with a
  `subjectAltName` that matches the endpoint ID of the EUT.
+ During the TLS handshake the EUT requests a X.509 certificate from the
  controller.
+ The EUT rejects the controller’s certificate.

== 3.8 Establishing a Session Context <sec:establishing-a-session-context>

=== Purpose <sec:purpose-130>

The purpose of this test is to ensure the EUT can use a session context
to exchange USP messages.

=== Functionality Tag <sec:functionality-tag-101>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-131>

+ Ensure the EUT and controller have the necessary information to
  establish a connection and exchange USP messages.
+ Ensure at the start of the test there is no existing session context
  between the EUT and controller.

=== Test Procedure <sec:test-procedure-123>

+ Start a session context with the EUT and send a Get message with the
  following structure:

  ```
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

=== Test Metrics <sec:test-metrics-130>

+ After step 1, the EUT responds with a USP record containing a session
  context, a `sequence_number` of 1 and a `session_id` that matched the
  session identifier sent to the EUT.

== 3.9 Receipt of a Record out of a Session Context <sec:receipt-of-a-record-out-of-a-session-context>

=== Purpose <sec:purpose-131>

The purpose of this test is to ensure the EUT correctly handles the
receiving of a USP record outside of a session context.

=== Functionality Tags <sec:functionality-tags-30>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-132>

+ Ensure the EUT and controller have the necessary information to
  establish a session and exchange USP messages.

=== Test Procedure <sec:test-procedure-124>

+ Start a session with the EUT using a session context.
+ Send a Get message to the EUT for `Device.DeviceInfo.` using a USP
  Record with the following structure:

  ```
  Record {
        session_context {
          session_id: <new_session_id>
          sequence_id:  1
          expected_id:  1
          payload {
              #  ...
            }
          }
        }
  ```

=== Test Metrics <sec:test-metrics-131>

+ The EUT sends the GetResponse in a USP Record using the new
  `session_id` and a `sequence_id` of 1.

== 3.10 Session Context Expiration <sec:session-context-expiration>

=== Purpose <sec:purpose-132>

The purpose of this test is to ensure the EUT correctly adheres to the
`SessionExpiration` parameter.

=== Functionality Tags <sec:functionality-tags-31>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-133>

+ Ensure the EUT and controller have the necessary information required
  to start a session and exchange USP records.
+ Ensure the controller is subscribed to Periodic! event.

=== Test Procedure <sec:test-procedure-125>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                      param_settings {
                              param: 'SessionExpiration'
                              value: '60'
                          }
                  }
              update_objs {
                      obj_path: 'Device.LocalAgent.Controller.<controller instance>.'
                      param_settings {
                              param: 'PeriodicNotifInterval'
                              value: '10'
                          }
                  }
          }
      }
  }
  ```
+ Wait for 3 Notify messages from the EUT containing a Periodic! event.
+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                      param_settings: {
                              param: 'SessionExpiration'
                              value: '5'
                          }
                  }
              update_objs {
                      obj_path: 'Device.LocalAgent.Controller.<controller instance>.'
                      param_settings {
                              param: 'PeriodicNotifInterval'
                              value: '10'
                          }
                  }
          }
      }
  }
  ```
+ Wait for 3 Notify messages from the EUT containing a Periodic! event.

=== Test Metrics <sec:test-metrics-132>

+ All three Notify messages received in step 2 use the same session
  context.
+ None of the three Notify messages received in step 4 shared the same
  session context.

== 3.11 Use of Sequence ID and Expected ID <sec:use-of-sequence-id-and-expected-id>

=== Purpose <sec:purpose-133>

The purpose of this test is to ensure the EUT correctly uses the
`sequence_id` and `expected_id` attributes found in a session context.

=== Functionality Tags <sec:functionality-tags-32>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-134>

+ Ensure the EUT and controller have the necessary information to start
  a session and exchange USP messages.
+ Ensure the controller is not subscribed to any events on the EUT.

=== Test Procedure <sec:test-procedure-126>

+ Start a new session by sending a Get message to the EUT with
  `sequence_id` and `expected_id` set to 1 for
  'Device.DeviceInfo.ModelNumber'.
+ Send a Get message to the EUT with the `sequence_id` and `expected_id`
  set to 4 for 'Device.DeviceInfo.SoftwareVersion'.
+ Send a Get message to the EUT with the `sequence_id` and `expected_id`
  set to 2 for 'Device.DeviceInfo.HardwareVersion'.
+ Send a Get message to the EUT with the `sequence_id` and `expected_id`
  set to 3 for 'Device.DeviceInfo.HardwareVersion'.

=== Test Metrics <sec:test-metrics-133>

+ After step 1, the EUT returns a GetResponse with a `sequence_id` of 1
  containing the parameter 'Device.DeviceInfo.ModelNumber'.
+ The EUT buffers the Get message sent in step 2 and does not
  immediately respond.
+ After step 3, The EUT sends a GetResponse with a `sequence_id` of 2
  containing the parameter 'Device.DeviceInfo.HardwareVersion'.
+ After step 4, the EUT sends a GetResponse with a `sequence_id` of 3
  containing the parameter 'Device.DeviceInfo.HardwareVersion'. The EUT
  then sends a GetResponse for the buffered Get message from step 2 with
  a `sequence_id` of 4 containing the parameter
  'Device.DeviceInfo.SoftwareVersion'.

== 3.12 Preservation of USP Records <sec:preservation-of-usp-records>

The purpose of this test is to ensure the EUT preserves a sent record in
the event the receiving endpoint requests a retransmission.

=== Functionality Tags <sec:functionality-tags-33>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-135>

+ Ensure the EUT and controller have the necessary information to start
  a session an exchange USP messages.

=== Test Procedures <sec:test-procedures>

+ Start a new session.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait 60 seconds.
+ Send a USP record to the EUT with a `retransmit_id` set to the
  `expected_id` value in the record sent in step 1.

=== Test Metrics <sec:test-metrics-134>

+ The EUT sends the same GetResponse twice, once after step 2 and once
  after step 4.

== 3.13 Agent Rejects Records with Different Payload Security than the Established Context <sec:agent-rejects-records-with-different-payload-security-than-the-established-context>

=== Purpose <sec:purpose-134>

The purpose of this test is to ensure the EUT does not accept USP
Records that have a different `payload_security` value than the that of
the established session context.

=== Functionality Tags <sec:functionality-tags-34>

Conditional Mandatory (supports Secure Message Exchange using TLS for
USP Record Integrity)

=== Test Setup <sec:test-setup-136>

+ Ensure the EUT and controller have the necessary information to start
  a session and exchange USP messages.
+ Ensure the EUT and controller have the necessary information to secure
  the USP record payload using TLS.

=== Test Procedure <sec:test-procedure-127>

+ Starts a session with the EUT using `payload_security` TLS12.
+ After the session is established, send the following Get message for
  any valid parameter using `payload_security` PLAINTEXT and a plaintext
  payload.

=== Test Metrics <sec:test-metrics-135>

+ The EUT does not send a GetResponse.
+ The EUT starts a new session after step 2.

== 3.14 Use of retransmit\_id <sec:use-of-retransmit_id>

=== Purpose <sec:purpose-135>

The purpose of this test is to ensure the EUT correctly uses the
`retransmit_id` value in a USP record and adheres to the related
parameters in the data model.

=== Functionality Tags <sec:functionality-tags-35>

Conditionality Mandatory (supports session context)

=== Test Setup <sec:test-setup-137>

+ Ensure the EUT and controller have the necessary information to start
  a session and exchange USP messages.

=== Test Procedure <sec:test-procedure-128>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.LocalAgent.Controller.<controller instance>.E2ESession.'
                      param_settings {
                              param: 'MaxRetransmitTries'
                              value: '2'
                          }
                  }
          }
      }
  }
  ```
+ Wait for a SetResponse
+ Send a USP record with a `retransmit_id` set to the value of the
  `sequence_id` found in the SetResponse in step 2.
+ Repeat steps 2 and 3 twice more.

=== Test Metrics <sec:test-metrics-136>

+ The first three SetResponse messages are sent in the same session
  context.
+ On the third retransmit request, the EUT doesn’t send a SetResponse
  and instead starts a new session with the controller.

== 3.15 Handling Duplicate Records <sec:handling-duplicate-records>

=== Purpose <sec:purpose-136>

The purpose of this test is to ensure the EUT can correctly handle
receiving duplicate records.

=== Functionality Tags <sec:functionality-tags-36>

Conditional Mandatory (supports USP session context)

=== Test Setup <sec:test-setup-138>

+ Ensure the EUT and controller have the necessary information to start
  session and exchange USP messages.

=== Test Procedure <sec:test-procedure-129>

+ Start a session with the EUT.
+ Send a Get message to the EUT requesting a parameter that is known to
  exist.
+ Retransmit the same USP record sent in step 2 to the EUT, using the
  same non\-payload USP record field values.
+ Repeat step 3 twice more.

=== Test Metrics <sec:test-metrics-137>

+ The EUT send only one GetResponse.

= 4 General MTP Test Cases <sec:general-mtp-test-cases>

== 4.1 Use of X.509 certificates at the MTP layer <sec:use-of-x.509-certificates-at-the-mtp-layer>

=== Purpose <sec:purpose-137>

The purpose of this test is to ensure the EUT can use X.509 certificates
to secure communication at the MTP layer.

=== Functionality Tags <sec:functionality-tags-37>

Mandatory

=== Test Setup <sec:test-setup-139>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the use of MTP layer encryption is enabled on the EUT.

=== Test Procedure <sec:test-procedure-130>

+ Send a GetSupportedProtocol message to the EUT with the following
  structure:
```
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

=== Test Metrics <sec:test-metrics-138>

+ The EUT processes the certificate and establishes a secure TLS
  connection at the MTP layer.

= 5 CoAP Test Cases (DEPRECATED) <sec:coap-test-cases-deprecated>

== 5.1 Mapping a USP Record to a CoAP message (DEPRECATED) <sec:mapping-a-usp-record-to-a-coap-message-deprecated>

=== Purpose <sec:purpose-138>

The purpose of this test is to ensure the EUT can properly use CoAP to
transport USP Records.

=== Functionality Tags <sec:functionality-tags-38>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-140>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-131>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse

=== Test Metrics <sec:test-metrics-139>

+ The GetResponse is encapsulated in a CoAP message.
+ The CoAP message used transport the GetResponse uses
  'application\/octet\-stream' for `Content-Format`.

== 5.2 USP Records that exceed CoAP message size (DEPRECATED) <sec:usp-records-that-exceed-coap-message-size-deprecated>

=== Purpose <sec:purpose-139>

The purpose of this test is to ensure the EUT properly segments large
USP records and transports them using block encapsulation.

=== Functionality Tags <sec:functionality-tags-39>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-141>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-132>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET
  }
  body {
      request {
          get {
              param_paths: 'Device.'
          }
      }
  }
  ```
+ Wait for a GetResponse

=== Test Metrics <sec:test-metrics-140>

+ The EUT sends the GetResponse message using multiple block
  encapsulated CoAP messages.

== 5.3 Successful CoAP exchange (DEPRECATED) <sec:successful-coap-exchange-deprecated>

=== Purpose <sec:purpose-140>

The purpose of this test is to ensure the EUT correctly sends a 2.04
Changed response to CoAP messages.

=== Functionality Tags <sec:functionality-tags-40>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-142>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-133>

+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-141>

+ After the transmission of the Get message the EUT sends a 2.04 Changed
  message.

== 5.4 Failed CoAP exchange \- timeout (DEPRECATED) <sec:failed-coap-exchange---timeout-deprecated>

=== Purpose <sec:purpose-141>

The purpose of this test is to ensure the EUT behaves correctly when a
timeout occurs at the MTP layer when using CoAP.

=== Functionality Tags <sec:functionality-tags-41>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-143>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-134>

+ Configure the to not send 2.04 Changed responses to CoAP messages
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse message from the EUT.
+ Prevent the Controller from sending a 2.04 Changed CoAP response.
+ Wait for EUT to retry sending the GetResponse.
+ Allow the Controller to send a 2.04 Changed CoAP response.

=== Test Metrics <sec:test-metrics-142>

+ The EUT attempts to retransmit the GetResponse message after not
  receiving a 2.04 Changed from the Controller.

== 5.5 Failed CoAP Exchange \- Invalid Method (DEPRECATED) <sec:failed-coap-exchange---invalid-method-deprecated>

=== Purpose <sec:purpose-142>

The purpose of this test is to ensure the EUT correctly responds when it
receives a CoAP message with an invalid method.

=== Functionality Tags <sec:functionality-tags-42>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-144>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.
+ The EUT the Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-135>

+ Send a USP record to the EUT using a CoAP message with method code
  `0x06`.
+ Wait up to 60 seconds for the EUT to send a CoAP response.

=== Test Metrics <sec:test-metrics-143>

+ The EUT sends a reply to the CoAP message with an invalid method code.
+ The EUT CoAP response uses code `4.05` to indicate an invalid CoAP
  method.

== 5.6 Failed CoAP Exchange \- Invalid Content\-Format (DEPRECATED) <sec:failed-coap-exchange---invalid-content-format-deprecated>

=== Purpose <sec:purpose-143>

The purpose of this test is to ensure the EUT properly responds to CoAP
messages that feature invalid Content\-Format options.

=== Functionality Tags <sec:functionality-tags-43>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-145>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-136>

+ Send a USP record to the EUT using a CoAP message with Content\-Format
  option `0x113a`.
+ Wait up to 60 second for the EUT to respond.

=== Test Metrics <sec:test-metrics-144>

+ The EUT sends a reply to the CoAP message with an invalid
  Content\-Format.
+ The EUT CoAP response uses code `4.15` to indicate an invalid
  Content\-Format.

== 5.7 Failed CoAP Exchange \- Invalid USP Record (DEPRECATED) <sec:failed-coap-exchange---invalid-usp-record-deprecated>

=== Purpose <sec:purpose-144>

The purpose of this is to ensure the EUT properly responds to a CoAP
message containing a malformed USP record.

=== Functionality Tags <sec:functionality-tags-44>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-146>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.
+ The EUT and Controller are configured to communicate over CoAP.

=== Test Procedure <sec:test-procedure-137>

+ Send a malformed USP record to the EUT in a CoAP message.
+ Wait up to 60 seconds for the EUT to send a CoAP reply.

=== Test Metrics <sec:test-metrics-145>

+ The EUT sends a reply to the CoAP message with the malformed USP
  record.
+ The EUT CoAP response uses code `4.00` to indicate the USP record is
  invalid or not understandable.

== 5.8 Use of DTLS (DEPRECATED) <sec:use-of-dtls-deprecated>

=== Purpose <sec:purpose-145>

The purpose of this test is to ensure the EUT can establish secure
communication with another CoAP endpoint at the CoAP layer.

=== Functionality Tags <sec:functionality-tags-45>

Conditional Mandatory (supports the CoAP MTP)

=== Test Setup <sec:test-setup-147>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.
+ The EUT and Controller are configured to communicate over CoAP using
  DTLS.
+ The EUT and Controller have the necessary information about one
  another to establish an encrypted channel of communication.

=== Test Procedure <sec:test-procedure-138>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse.

=== Test Metrics <sec:test-metrics-146>

+ The Controller is able to establish a DTLS session with the EUT.
+ The EUT established a DTLS session and sends a GetResponse.

= 6 STOMP Test Cases <sec:stomp-test-cases>

== 6.1 Support of Required Profiles <sec:support-of-required-profiles>

=== Purpose <sec:purpose-146>

The purpose of this test is to ensure the EUT supports the required
STOMP profiles.

=== Functionality Tags <sec:functionality-tags-46>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-148>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.

=== Test Procedure <sec:test-procedure-139>

+ Send a GetSupportedDM message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET_SUPPORTED_DM
  }
  body {
      request {
          get_supported_dm {
              obj_paths: 'Device.STOMP.'
              obj_paths: 'Device.LocalAgent.'
              return_params: true
              first_level_only: false
          }
      }
  }
  ```
+ Wait for the GetSupportedDMResponse.

=== Test Metrics <sec:test-metrics-147>

+ The EUT sends a GetSupportedDMResponse.
+ The GetSupportedDMResponse from the EUT contains the following
  parameters: \*
  Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Reference \*
  Device.LocalAgent.Controller.{i}.MTP.{i}.STOMP.Destination \*
  Device.STOMP.ConnectionNumberOfEntries \*
  Device.STOMP.Connection.{i}.Alias \*
  Device.STOMP.Connection.{i}.Enable \*
  Device.STOMP.Connection.{i}.Status \* Device.STOMP.Connection.{i}.Host
  \* Device.STOMP.Connection.{i}.Port \*
  Device.STOMP.Connection.{i}.VirtualHost \*
  Device.STOMP.Connection.{i}.ServerRetryInitialInterval \*
  Device.STOMP.Connection.{i}.ServerRetryIntervalMultiplier \*
  Device.STOMP.Connection.{i}.ServerRetryMaxInterval

== 6.2 STOMP session establishment <sec:stomp-session-establishment>

=== Purpose <sec:purpose-147>

The purpose of this test is to ensure the EUT can properly start a STOMP
session.

=== Functionality Tags <sec:functionality-tags-47>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-149>

+ Ensure that the EUT is configured to use a STOMP server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-140>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the STOMP server and subscribe to a
  destination.

=== Test Metrics <sec:test-metrics-148>

+ The EUT sends a STOMP frame to the STOMP server to initiate the STOMP
  session.

== 6.3 STOMP Connection Retry <sec:stomp-connection-retry>

=== Purpose <sec:purpose-148>

The purpose of this test is to ensure the EUT properly enters a retry
state when it fails to connect to the STOMP server.

=== Functionality Tags <sec:functionality-tags-48>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-150>

+ Ensure that the EUT is configured to use a STOMP server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-141>

+ Send a Get message to the EUT with the following structure

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET
  }
  body {
      request {
          get {
              param_paths: 'Device.STOMP.Connection.'
          }
      }
  }
  ```
+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Disable the STOMP server.
+ Allow the EUT to attempt to start a STOMP session with the STOMP
  server.
+ Reenable the STOMP server after the EUT fails to connect to the STOMP
  server twice.

=== Test Metrics <sec:test-metrics-149>

+ The EUT retries connecting to the STOMP server within the
  `ServerRetryInitialInterval` of the connection instance.
+ The EUT retries a second time in accordance with
  `ServerRetryInitialInterval` and `ServerRetryIntervalMultiplier`.

== 6.4 Successful USP message over STOMP with required headers <sec:successful-usp-message-over-stomp-with-required-headers>

=== Purpose <sec:purpose-149>

The purpose of this test is to ensure the EUT can communicate over STOMP
using the correct headers.

=== Functionality Tags <sec:functionality-tags-49>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-151>

+ Ensure that the EUT is configured to use a STOMP server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-142>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Allow the EUT to send a GetResponse.

=== Test Metrics <sec:test-metrics-150>

+ In the STOMP frame transporting the GetResponse the `content-length`
  header is present and contains the length of the included body of the
  message.
+ In the STOMP frame transporting the GetResponse the `content-type`
  header is present and contains `application/vnd.bbf.usp.msg`.
+ In the STOMP frame transporting the GetResponse the `reply-to-dest`
  header is present and contains the STOMP destination of the EUT.

== 6.5 STOMP destination \- provided in subscribe\-dest <sec:stomp-destination---provided-in-subscribe-dest>

=== Purpose <sec:purpose-150>

The purpose of this test is to ensure the EUT correct subscribe to a
destination found in the `subscribe-dest` header in a CONNECTED frame.

=== Functionality Tags <sec:functionality-tags-50>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-152>

+ Ensure the EUT is configured to use a STOMP server that is part of the
  test environment.

=== Test Procedure <sec:test-procedure-143>

+ Configure the STOMP server to send an unused destination via the
  `subscribe-dest` header in the CONNECTED frames.
+ Reboot the EUT.
+ Allow the EUT to reconnect to the STOMP server.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Allow the EUT to respond to the Get message.

=== Test Metrics <sec:test-metrics-151>

+ The EUT subscribes to the destination configured in step 1.
+ The STOMP frame containing the GetResponse has a `reply-to-dest`
  header which matches the destination configured in step 1.

== 6.6 STOMP destination \- configured in USP data model <sec:stomp-destination---configured-in-usp-data-model>

=== Purpose <sec:purpose-151>

The purpose of this test is to ensure the EUT can use the
`Device.LocalAgent.MTP.{i}.STOMP.Destination` parameter to select a
STOMP destination.

=== Functionality Tags <sec:functionality-tags-51>

Conditional Mandatory (supports the STOMP MTP)

=== Test Steps <sec:test-steps-7>

+ Ensure the EUT is configured to use a STOMP server that is part of the
  test environment.

=== Test Procedure <sec:test-procedure-144>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                  obj_path: 'Device.LocalAgent.MTP.<active MTP instance>.STOMP.'
                  param_settings {
                          param: 'Destination'
                          value: '<new unused destination>'
                      }
              }
          }
      }
  }
  ```
+ Reboot the EUT.
+ Wait for the EUT to reconnect to the STOMP server.
+ Allow the STOMP server to send a CONNECTED frame that does NOT include
  the subscribe\-dest field.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse from the EUT.

=== Test Metrics <sec:test-metrics-152>

+ The EUT subscribes to the destination configured in step 1.
+ The STOMP frame containing the GetResponse has a `reply-to-dest`
  header which contains the STOMP destination configured in step 1.

== 6.7 STOMP Destination \- terminates unconfigured session <sec:stomp-destination---terminates-unconfigured-session>

=== Purpose <sec:purpose-152>

The purpose of this test is to ensure the EUT terminates a STOMP session
when no destination id configured.

=== Functionality Tags <sec:functionality-tags-52>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-153>

+ The EUT is configured to use a STOMP server which exists in the test
  environment.
+ Configure the STOMP server to not provide a `subscribe-dest` header in
  the CONNECTED frame.

=== Test Procedure <sec:test-procedure-145>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.LocalAgent.MTP.<active MTP instance>.STOMP.'
                      param_settings {
                              param: 'Destination'
                              value: ''
                          }
                  }
          }
      }
  }
  ```
+ Reboot the EUT.
+ Wait for the EUT to attempt to reconnect to the STOMP server.

=== Test Metrics <sec:test-metrics-153>

+ The EUT terminates the STOMP session after the STOMP server sends a
  CONNECTION to the EUT.

== 6.8 Use of STOMP heartbeat mechanism <sec:use-of-stomp-heartbeat-mechanism>

=== Purpose <sec:purpose-153>

The purpose of this test is to ensure the EUT can correctly implements
the STOMP heartbeat mechanism and the relevant parameters in the data
model.

=== Functionality Tags <sec:functionality-tags-53>

Conditional Mandatory (supports STOMPHeartbeat:1 profile)

=== Test Setup <sec:test-setup-154>

+ The EUT is configured to use a STOMP server which exists in the test
  environment.
+ Ensure the STOMP server supports heartbeats.

=== Test Procedure <sec:test-procedure-146>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.STOMP.Connection.<STOMP server in use>.'
                      param_settings {
                              param: 'EnableHeartbeats'
                              value: 'true'
                          }
                      param_settings {
                              param: 'IncomingHeartbeat'
                              value: '10000'
                          }
                      param_settings {
                              param: 'OutgoingHeartbeat'
                              value: '15000'
                          }
                  }
          }
      }
  }
  ```
+ Reboot the EUT.
+ Wait for the EUT to reconnect to the STOMP server.
+ Wait for 60 seconds

=== Test Metrics <sec:test-metrics-154>

+ In the STOMP frame sent to the STOMP server during step 2, the
  `heart-beat` header sent by the EUT contains '15000, 10000'.
+ After the EUT is connected to the STOMP server, the EUT sends
  heartbeat messages every 15 seconds.

== 6.9 Error Handling \- Unprocessed Record <sec:error-handling---unprocessed-record>

=== Purpose <sec:purpose-154>

The purpose of this test is to ensure the EUT will correctly send an
ERROR STOMP frame when a malformed USP record is received.

=== Functionality Tags <sec:functionality-tags-54>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-155>

+ Ensure the EUT is configured to use a STOMP server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-147>

+ Send a malformed USP record to the EUT.
+ Wait 60 seconds for the EUT to send a response.

=== Test Metrics <sec:test-metrics-155>

+ The EUT either ignores the malformed record or sends a USP Record
  Error.

== 6.10 Agent’s STOMP destination is changed <sec:agents-stomp-destination-is-changed>

=== Purpose <sec:purpose-155>

The purpose of this test is to ensure that when the EUT destination is
altered it properly unsubscribes and subscribes to the new destination.

=== Functionality Tags <sec:functionality-tags-55>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-156>

+ Ensure the EUT is configured to use a STOMP server that exists in the
  test environment.
+ Ensure the STOMP server is configured to not provide a destination via
  the `subscribe-dest` header.

=== Test Procedure <sec:test-procedure-148>

+ Send a Set message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: SET
  }
  body {
      request {
          set {
              update_objs {
                      obj_path: 'Device.LocalAgent.MTP.<active MTP instance>.STOMP.'
                      param_settings {
                              param: 'Destination'
                              value: '<new destination>'
                          }
                  }
          }
      }
  }
  ```

=== Test Metrics <sec:test-metrics-156>

+ After the STOMP destination was changed the EUT sent an UNSUBSCRIBE
  message message to the STOMP server.
+ After the EUT sent an UNSUBSCRIBE to the STOMP server it sent a
  SUBSCRIBE message with the new destination to the STOMP server.

== 6.11 STOMP \- Use of TLS <sec:stomp---use-of-tls>

=== Purpose <sec:purpose-156>

The purpose of this test is to ensure the EUT can establish secure STOMP
communication via TLS.

=== Functionality Tags <sec:functionality-tags-56>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-157>

+ Ensure the EUT is configured to the use a STOMP server that exists in
  the test environment.
+ Ensure the EUT and STOMP server are configured with the appropriate
  certificates to communicate over TLS.

=== Test Procedure <sec:test-procedure-149>

+ Reboot the EUT
+ Wait for the EUT to reconnect to the STOMP server
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse

=== Test Metrics <sec:test-metrics-157>

+ All communication between the EUT and STOMP server after step 1 are
  encrypted using TLS

== 6.12 STOMP \- Use of Connect Record <sec:stomp---use-of-connect-record>

=== Purpose <sec:purpose-157>

The purpose of this test is to ensure the EUT correctly sends a Connect
record after it has established a communications channel to the
controller.

=== Functionality Tags <sec:functionality-tags-57>

Conditional Mandatory (supports the STOMP MTP)

=== Test Setup <sec:test-setup-158>

+ Ensure the EUT is configured to use a STOMP server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-150>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the STOMP server.

=== Test Metrics <sec:test-metrics-158>

+ After reconnecting to the STOMP server the EUT transmits a
  STOMPConnectRecord to the test controller within 30 seconds.
+ The version in the received STOMPConnectRecord matches the expected
  version.
+ The subscribed\_destination string in the received STOMPConnectRecord
  matches the destination the EUT is subscribed to.

= 7 WebSocket Test Cases <sec:websocket-test-cases>

== 7.1 Session Establishment <sec:session-establishment>

=== Purpose <sec:purpose-158>

The purpose of this test is to ensure the EUT can establish a session
using WebSocket as the MTP.

=== Functionality Tags <sec:functionality-tags-58>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-159>

+ Ensure the EUT is configured to use WebSocket and to communicate to
  the controller that exists in the test environment.

=== Test Procedure <sec:test-procedure-151>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the controller.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse from the EUT

=== Test Metrics <sec:test-metrics-159>

+ The EUT is able to establish a WebSocket connection to the controller
+ The EUT sends a GetResponse to the Get message sent in step 3

== 7.2 Use of only one session <sec:use-of-only-one-session>

=== Purpose <sec:purpose-159>

The purpose of this test is to ensure the EUT maintains only one
WebSocket connection to a controller at a time.

=== Functionality Tags <sec:functionality-tags-59>

Conditional Mandatory (supports the WebSocket MTP with requirement
R\-WS.6)

=== Test Setup <sec:test-setup-160>

+ Ensure the EUT is configured to use WebSocket and to communicate to
  the controller that exists in the test environment.

=== Test Procedure <sec:test-procedure-152>

+ Send a Get message to the EUT using the following structure:

  ```
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
+ Attempt to open a second WebSocket connection to the EUT.
+ Send the Get message outlined in step 1 over the new connection.

=== Test Metrics <sec:test-metrics-160>

+ Either the first WebSocket connection closes when the second is
  opened, or the second connection is rejected.

== 7.3 Agent session acceptance from Controller <sec:agent-session-acceptance-from-controller>

=== Purpose <sec:purpose-160>

This test has been DEPRECATED as of version 1.0.1 of this test plan.

=== Functionality Tags <sec:functionality-tags-60>

N\/A

=== Test Setup <sec:test-setup-161>

N\/A

=== Test Procedure <sec:test-procedure-153>

N\/A

=== Test Metrics <sec:test-metrics-161>

N\/A

== 7.4 Closing a WebSocket Connection <sec:closing-a-websocket-connection>

=== Purpose <sec:purpose-161>

The purpose of this test is to ensure the EUT correctly implements the
procedure to close a WebSocket connection.

=== Functionality Tags <sec:functionality-tags-61>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-162>

+ Ensure the EUT is configured to use WebSocket.
+ Ensure there is an active WebSocket connection between the EUT and the
  controller that was initiated by the EUT.

=== Test Procedure <sec:test-procedure-154>

+ Send a `Close` WebSocket control frame to the EUT.
+ Wait for the EUT to close the underlying TCP session.

=== Test Metrics <sec:test-metrics-162>

+ The EUT sends a WebSocket Close frame.

== 7.5 Rejection of Session Establishment \- DEPRECATED <sec:rejection-of-session-establishment---deprecated>

=== Deprecation Notice <sec:deprecation-notice>

This test was deprecated in TP\-469 Issue 1 Amendment 3 due to the
deprecation of R\-WS.10a in TR\-369 Issue 1 Amendment 3.

=== Purpose <sec:purpose-162>

The purpose of this test is to ensure the EUT will correctly reject
WebSocket sessions.

=== Functionality Tags <sec:functionality-tags-62>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-163>

+ Ensure the EUT is configured to use WebSocket.
+ Configure the controller to reject WebSocket connections from the EUT.

=== Test Procedure <sec:test-procedure-155>

+ Configure the controller to not include the `Sec-WebSocket-Protocol`
  when opening new WebSocket connections.
+ Reboot the EUT
+ Attempt to start a WebSocket connection to the EUT.

=== Test Metrics <sec:test-metrics-163>

+ The EUT rejects the WebSocket connection with the missing
  `Sec-WebSocket-Protocol` header.

== 7.6 Error Handling \- Unprocessed Records <sec:error-handling---unprocessed-records>

=== Purpose <sec:purpose-163>

The purpose of this test is to ensure the EUT correctly closes the
WebSocket connection when a malformed USP Record is received.

=== Functionality Tags <sec:functionality-tags-63>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-164>

+ Ensure the EUT is configured to use WebSocket
+ Ensure there is an active WebSocket connection between the EUT and
  controller.

=== Test Procedure <sec:test-procedure-156>

+ Send a malformed USP record to the EUT.

=== Test Metrics <sec:test-metrics-164>

+ After step 1 the EUT closes the WebSocket connection with a WebSocket
  `Close` control frame containing status code 1003.

== 7.7 Use of Ping and Pong frames <sec:use-of-ping-and-pong-frames>

=== Purpose <sec:purpose-164>

The purpose of this test is to ensure the EUT correctly uses `Ping` and
`Pong` control frames to keep the WebSocket session alive.

=== Functionality Tags <sec:functionality-tags-64>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-165>

+ Ensure the EUT is configured to use WebSocket
+ Ensure there is an active WebSocket session between the EUT and the
  Controller.

=== Test Procedure <sec:test-procedure-157>

+ Send a `Ping` control frame to the EUT.
+ Wait up to 60 seconds for a `Pong` control frame from the EUT.
+ Send a `Pong` control frame to the EUT.

=== Test Metrics <sec:test-metrics-165>

+ The EUT sends a `Pong` control frame in response to the `Ping` control
  frame.
+ The EUT doesn’t terminate the WebSocket connection after receiving an
  unsolicited `Pong` control frame.

== 7.8 WebSocket Session Retry <sec:websocket-session-retry>

=== Purpose <sec:purpose-165>

The purpose of this test is to ensure the EUT will correctly attempt to
reestablish a WebSocket session if a session is unexpectedly closed.

=== Functionality Tags <sec:functionality-tags-65>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-166>

+ Ensure the EUT is configured to use WebSocket.
+ Ensure there is an active WebSocket connection between the EUT and
  controller.

=== Test Procedure <sec:test-procedure-158>

+ Send a Get message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET
  }
  body {
      request {
          get {
              param_paths: 'Device.LocalAgent.Controller.<test controller instance>.MTP.<active MTP instance>.'
          }
      }
  }
  ```
+ Configure the controller to reject new WebSocket connections.
+ Terminate the underlying TCP connection on the existing WebSocket
  connection.
+ Wait for the EUT to attempt to establish a WebSocket connection.
+ Configure the controller to accept new WebSocket connections.
+ Wait for the EUT to attempt to establish a WebSocket connection.

=== Test Metrics <sec:test-metrics-166>

+ The EUT attempts to start a new WebSocket connection in conformance
  with the `SessionRetryMinimumWaitInterval` parameter.
+ The EUT makes a second attempt to start a new WebSocket connection in
  conformance with the `SessionRetryMinimumWaitInterval` and
  `SessionRetryIntervalMultiplier` parameters.

== 7.9 Use of TLS <sec:use-of-tls>

=== Purpose <sec:purpose-166>

The purpose of this test is to ensure the EUT can establish and use a
secure WebSocket connection.

=== Functionality Tags <sec:functionality-tags-66>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-167>

+ Ensure the EUT is configured to use WebSocket.
+ Ensure the EUT and controller both have the required certificates to
  secure a websocket connection.

=== Test Procedure <sec:test-procedure-159>

+ Reboot the EUT.
+ Wait for the EUT to connect to the controller.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for GetResponse from the EUT.

=== Test Metrics <sec:test-metrics-167>

+ The EUT starts a WebSocket connection with the controller using TLS.
+ The EUT sends a GetResponse in step 4.

== 7.10 WebSocket \- Use of Connect Record <sec:websocket---use-of-connect-record>

=== Purpose <sec:purpose-167>

The purpose of this test is to ensure the EUT correctly sends a Connect
Record after it has established a WebSocket connection to the
Controller.

=== Functionality Tags <sec:functionality-tags-67>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-168>

+ Ensure the EUT is configured to connect to the test controller using
  WebSocket.

=== Test Procedure <sec:test-procedure-160>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the test controller.

=== Test Metrics <sec:test-metrics-168>

+ After reconnecting to the test controller the EUT transmits a
  WebSocketConnectRecord to the test controller within 30 seconds.

== 7.11 Websocket response does not include bbf\-usp\-protocol <sec:websocket-response-does-not-include-bbf-usp-protocol>

=== Purpose <sec:purpose-168>

The purpose of this test is to ensure the EUT properly processes a
Websocket response that does not contain the bbf\-usp\-protocol
Websocket Extension.

=== Functionality Tag <sec:functionality-tag-102>

Conditional Mandatory (supports the WebSocket MTP)

=== Test Setup <sec:test-setup-169>

+ Ensure the EUT is configured to connect to the test controller using
  WebSocket.

=== Test Procedure <sec:test-procedure-161>

+ Configure the controller to not include 'bbf\-usp\-protocol' in its
  Sec\-WebSocket\-Extensions header when opening new WebSocket
  connections.
+ Reboot the EUT.
+ Attempt to start a WebSocket connection to the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for a GetResponse from the EUT

=== Test Metrics <sec:test-metrics-169>

+ The EUT is able to establish a WebSocket connection to the controller.
+ The EUT sends a GetResponse to the Get message sent in step 4.

= 8 Discovery Test Cases <sec:discovery-test-cases>

== 8.1 DHCP Discovery \- Agent Request Requirements <sec:dhcp-discovery---agent-request-requirements>

=== Purpose <sec:purpose-169>

The purpose of this test is to ensure the EUT correctly requests
controller information via DHCP. #emph[Note: this test can be run over
DHCPv4 or DHCPv6, depending on the deployment model of the EUT.];

=== Functionality Tags <sec:functionality-tags-68>

Conditional Mandatory (supports discovery via DHCP Options)

=== Test Setup <sec:test-setup-170>

+ Ensure the EUT is configured to request controller DHCP information.
+ Ensure the EUT is configured to acquire an address via DHCP.

=== Test Procedure <sec:test-procedure-162>

+ Reboot the EUT.
+ Wait for the EUT to request an address via DHCP.

=== Test Metrics <sec:test-metrics-170>

+ The EUT includes a Vendor Class option with Enterprise Number 3561 and
  vendor\-class\-data "usp" in the DHCP request.

== 8.2 DHCP Discovery \- Agent handling of received options <sec:dhcp-discovery---agent-handling-of-received-options>

=== Purpose <sec:purpose-170>

The purpose of this test is to ensure the EUT can properly handle the
USP options provided by a DHCP server.

=== Functionality Tags <sec:functionality-tags-69>

Conditional Mandatory (supports discovery via DHCP Options)

=== Test Setup <sec:test-setup-171>

+ Ensure the EUT is configured to request controller DHCP information
+ Ensure the EUT is configured to acquire an address via DHCP.
+ Ensure the EUT ProvisioningCode parameter is set to a value other than
  that which will be set during the test procedure.

=== Test Procedure <sec:test-procedure-163>

+ Configure the DHCP server to provide a null terminated provisioning
  code.
+ Reboot the EUT.
+ Wait for the EUT to request an address via DHCP.
+ Send a Get message to the EUT with the following structure:

  ```
  header {
      msg_id: '<msg_id>'
      msg_type: GET
  }
  body {
      request {
          get {
              param_paths: 'Device.LocalAgent.Controller.<test controller instance>.'
          }
      }
  }
  ```
+ Wait for the GetResponse from the EUT.

=== Test Metrics <sec:test-metrics-171>

+ The ProvisioningCode parameter found in the GetResponse matches the
  provisioning code configured on the DHCP server.

== 8.3 DHCP Discovery \- FQDN Leads to DNS Query <sec:dhcp-discovery---fqdn-leads-to-dns-query>

=== Purpose <sec:purpose-171>

The purpose of this test is to ensure the EUT correctly uses DNS to
retrieve additional controller information upon receiving a FQDN of a
controller.

=== Functionality Tags <sec:functionality-tags-70>

Conditional Mandatory (supports discovery via DHCP Options)

=== Test Setup <sec:test-setup-172>

+ Ensure the EUT is configured to request controller information via
  DHCP.
+ Ensure the EUT is configured to acquire an address via DHCP.

=== Test Procedure <sec:test-procedure-164>

+ Configure the DHCP server to provide a controller URL with a FQDN.
+ Reboot the EUT.
+ Wait for the EUT to request an address.
+ Wait for the EUT to query the DNS with the FQDN.
+ Wait for the EUT to connect to the controller.

=== Test Metrics <sec:test-metrics-172>

+ After the EUT receives a FQDN in the DHCP Offer, the EUT uses DNS to
  retrieve additional information about the controller.

== 8.4 mDNS <sec:mdns>

=== Purpose <sec:purpose-172>

The purpose of this test is to ensure the EUT correctly implements mDNS.

=== Functionality Tags <sec:functionality-tags-71>

Conditional Mandatory (supports discovery via mDNS, supports the
Reboot:1 profile)

=== Test Setup <sec:test-setup-173>

+ Ensure the EUT has mDNS enabled.
+ Ensure the controller exists on the same network as the EUT.
+ Ensure that the EUT has the Controller’s URL, which contains ".local."
  is preconfigured on the EUT.
+ Ensure that a Subscription exists for the Boot! event on the EUT with
  the test Controller as the Recipient.

=== Test Procedure <sec:test-procedure-165>

+ Reboot the EUT.
+ Wait for the EUT to send a mDNS request for the FQDN.
+ Allow the controller to respond to the mDNS request.

=== Test Metrics <sec:test-metrics-173>

+ After the EUT receives a FQDN via DHCP containing ".local." the EUT
  uses mDNS to resolve it.

== 8.5 mDNS and Message Transfer Protocols <sec:mdns-and-message-transfer-protocols>

=== Purpose <sec:purpose-173>

The purpose of this test is to ensure the EUT correctly advertises the
MTP it supports.

=== Functionality Tags <sec:functionality-tags-72>

Conditional Mandatory (supports discovery via mDNS)

=== Test Setup <sec:test-setup-174>

+ Ensure the EUT has mDNS enabled.
+ Ensure the Controller exists on the same network as the EUT.

=== Test Procedure <sec:test-procedure-166>

+ Reboot the EUT.
+ Wait for the EUT to acquire an address.
+ Wait for the EUT to send an unsolicited mDNS response.

=== Test Metrics <sec:test-metrics-174>

+ The EUT sends an unsolicited multicast DNS response containing correct
  SRV and TXT records that convey the DNS\-SD Service Instance Name for
  each supported MTP.

== 8.6 DNS \- DNS Record Requirements <sec:dns---dns-record-requirements>

=== Purpose <sec:purpose-174>

The purpose of this test is to ensure the EUT provides valid DNS\-SD
records.

=== Functionality Tags <sec:functionality-tags-73>

Conditional Mandatory (supports discovery via mDNS)

=== Test Setup <sec:test-setup-175>

+ Ensure mDNS is enabled on the EUT.

=== Test Procedure <sec:test-procedure-167>

+ Reboot the EUT.
+ Wait for the EUT to acquire a new address.
+ Wait for to the EUT to send a multicast mDNS advertisement.

=== Test Metrics <sec:test-metrics-175>

+ The EUT sends a multicast mDNS advertisement containing a TXT record
  for every supported MTP.
+ Every TXT record in the mDNS advertisement has a "path" and "name"
  attribute.

== 8.7 mDNS request response <sec:mdns-request-response>

=== Purpose <sec:purpose-175>

The purpose of this test is to ensure the EUT will respond to mDNS
requests.

=== Functionality Tags <sec:functionality-tags-74>

Conditional Mandatory (supports discovery via mDNS)

=== Test Setup <sec:test-setup-176>

+ Ensure that the EUT is configured to listen for mDNS requests.

=== Test Procedure <sec:test-procedure-168>

+ Reboot the EUT.
+ Send an mDNS query to the multicast domain that includes the EUT.
+ Wait for an mDNS response from the EUT.

=== Test Metrics <sec:test-metrics-176>

+ The EUT responds to the mDNS query with the proper information.

= 9 Functionality Test Cases <sec:functionality-test-cases>

== 9.1 Use of the Timer! Event (DEPRECATED by 9.11) <sec:use-of-the-timer-event-deprecated-by-9.11>

=== Purpose <sec:purpose-176>

The purpose of this test is to ensure the Timer! event can be
configured, and the EUT correctly triggers the event.

=== Functionality Tags <sec:functionality-tags-75>

Conditional Mandatory (supports
Device.LocalAgent.Controller.{i}.ScheduleTimer() command)

=== Test Setup <sec:test-setup-177>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-169>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a Notification.

=== Test Metrics <sec:test-metrics-177>

+ The EUT sends an OperateResponse with 'ScheduleTimer()' in the
  `executed_command` element.
+ The EUT sends a Notify message with an `event` element containing
  Timer!

== 9.2 Use of Device.LocalAgent.AddCertificate() <sec:use-of-device.localagent.addcertificate>

=== Purpose <sec:purpose-177>

The purpose of this test is to ensure the AddCertificate() operation on
the EUT functions correctly.

=== Functionality Tags <sec:functionality-tags-76>

Conditional Mandatory (supports Device.LocalAgent.AddCertificate()
command)

=== Test Setups <sec:test-setups>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Have an alternate certificate that the EUT hasn’t seen.

=== Test Procedure <sec:test-procedure-170>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Reconfigure the Controller to use the new certificate.
+ Reestablish a connection to the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-178>

+ The EUT sends an OperateResponse after step 1.
+ The EUT accepts the connection after the Controller has been
  reconfigured to use the new certificate.
+ The EUT returns a GetResponse after step 4 which contains an instance
  with an Alias which matches the certificate added in step 1.
+ The EUT sends an OperateResponse after step 5.

== 9.3 Upgraded the Agent’s Firmware \- Autoactivate enabled <sec:upgraded-the-agents-firmware---autoactivate-enabled>

=== Purpose <sec:purpose-178>

The purpose of this test is to ensure the EUT can download firmware and
automatically activate it using the AutoActivate parameter.

=== Functionality Tags <sec:functionality-tags-77>

Conditional Mandatory (supports Firmware:1 profile)

=== Test Setup <sec:test-setup-178>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has a Subscription to the TransferComplete! and
  Boot! events with the Recipient being the Controller instance used for
  testing.
+ Ensure that the EUT has a Subscription instance for the
  OperationComplete notification with a NotifType equal to
  'OperationComplete' and a ReferenceList that matches the path of the
  'Download()' command with the Controller used for testing set as the
  Recipient.

=== Test Procedure <sec:test-procedure-171>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a Notification
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-179>

+ The EUT sends a Notify message after step 1 containing a
  `oper_complete` element with a `command_name` of 'Download()'
+ The EUT sends a Notify message with a TransferComplete! event.
+ The EUT sends a Notify message with a Boot! event, with the
  'FirmwareUpdated' argument set to true.
+ The EUT sends a GetResponse message after step 3 which shows that
  Device.DeviceInfo.ActiveFirmwareImage matches the FirmwareImage
  instance on which the Download() operation was called; also that
  Device.DeviceInfo.SoftwareVersion matches the expected version.

== 9.4 Upgrading the Agent’s Firmware \- Using TimeWindow, Immediate <sec:upgrading-the-agents-firmware---using-timewindow-immediate>

=== Purpose <sec:purpose-179>

The purpose of this test is to ensure the EUT can activate a firmware
image when a TimeWindow object is used with Immediately mode.

=== Functionality Tags <sec:functionality-tags-78>

Conditional Mandatory (supports Firmware:1 profile with Activate()
operation)

=== Test Setup <sec:test-setup-179>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the EUT has a FirmwareImage instance containing inactive
  firmware.
+ Ensure the EUT has a Subscription instance for Boot! with the
  Controller used for testing set as the Recipient.
+ Ensure that the EUT has a Subscription instance for the
  OperationComplete notification with a NotifType equal to
  'OperationComplete' and a ReferenceList that matches the path of the
  'Activate()' command with the Controller used for testing set as the
  Recipient.

=== Test Procedure <sec:test-procedure-172>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for Notify message from the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-180>

+ The EUT sends a Notify message within 5 seconds with an
  OperationComplete element with a `command_name` of 'Activate()'.
+ The EUT sends a Notify message with a Boot! event and a
  FirmwareUpdated argument set to true.
+ The EUT responds to the Get message with a GetResponse containing a
  SoftwareVersion element with the expected software version.

== 9.5 Upgrading the Agent’s Firmware \- Using TimeWindow, AnyTime <sec:upgrading-the-agents-firmware---using-timewindow-anytime>

=== Purpose <sec:purpose-180>

The purpose of this test is to ensure the EUT can activate a firmware
image when a TimeWindow instance used with the AnyTime mode.

=== Functionality Tags <sec:functionality-tags-79>

Conditionally Mandatory (implements Firmware:1 and Activate() operation)

=== Test Setup <sec:test-setup-180>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the EUT has a FirmwareImage instance containing inactive
  firmware.
+ Ensure the EUT has a Subscription to the Boot! event with the
  Controller used for testing set as the Recipient.
+ Ensure that the EUT has a Subscription instance for the
  OperationComplete notification with a NotifType equal to
  'OperationComplete' and a ReferenceList that matches the path of the
  'Activate()' command with the Controller used for testing set as the
  Recipient.

=== Test Procedure <sec:test-procedure-173>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for a Notify message from the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-181>

+ The EUT sends a Notify message within 2 minutes after step 1.
+ The Notify message has a OperationComplete element.
+ The EUT sends a Notify message with a Boot! event and a
  FirmwareUpdated argument set to true.
+ The EUT sends a GetResponse after step 3 with a SoftwareVersion
  parameter that matches the expected version.

== 9.6 Upgrading the Agent’s Firmware \- Validated Firmware <sec:upgrading-the-agents-firmware---validated-firmware>

=== Purpose <sec:purpose-181>

The purpose of this test is to ensure the EUT can validate the integrity
of downloaded firmware.

=== Functionality Tags <sec:functionality-tags-80>

Conditional Mandatory (supports Firmware:1 profile)

=== Test Setup <sec:test-setup-181>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has Subscriptions to the TransferComplete! event
  notification with the Controller used for testing set as the
  Recipient.

=== Test Procedure <sec:test-procedure-174>

+ Send an Operate message to the EUT with the following structure using
  an invalid checksum:

  ```
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
+ Wait for a Notify message from the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-182>

+ The EUT sends a Notify message with a TransferComplete! event.
+ The EUT sends a Get response with a Status parameter of
  ValidationFailed.

== 9.7 Upgrading the Agent’s Firmware \- Download to Active Bank <sec:upgrading-the-agents-firmware---download-to-active-bank>

=== Purpose <sec:purpose-182>

The purpose of this test is to ensure the EUT is capable downloading and
installing new firmware for EUTs that may support only the active
firmware bank.

=== Functionality Tags <sec:functionality-tags-81>

Conditional Mandatory (supports Firmware:1 profile)

=== Test Setup <sec:test-setup-182>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that the EUT has a Subscription to the TransferComplete! event
  with the recipient being the instance used for testing.
+ Ensure the EUT has a Subscription to the Boot! event and the
  Controller used for testing is set as the Recipient.
+ Record the number of firmware banks the EUT supports.

=== Test Procedure <sec:test-procedure-175>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for a Notify message from the EUT.

=== Test Metrics <sec:test-metrics-183>

If the EUT supports only one firmware bank: 1. The EUT sends a Notify
message with a TransferComplete! event. 2. the EUT sends a Notify
message with a Boot! event and a FirmwareUpdated argument set to true.

If the EUT supports multiple firmware banks: 3. The EUT may send an
error indicating that downloading to an active firmware slot is not
allowed. 4. If the EUT did not send an error message in Test Metric 3,
the EUT sends a Notify message with a TransferComplete! event. 5. If the
EUT did not send an error message in Test Metric 3, the EUT sends a
Notify message with a Boot! event and a FirmwareUpdated argument set to
true.

== 9.8 Upgrading the Agent’s Firmware \- Cancelling a request using the Cancel() command <sec:upgrading-the-agents-firmware---cancelling-a-request-using-the-cancel-command>

=== Purpose <sec:purpose-183>

The purpose of this test is to ensure the EUT can correctly cancel a
Download() operation.

=== Functionality Tags <sec:functionality-tags-82>

Conditional Mandatory (supports Firmware:1 profile and
Device.LocalAgent.Request.{i}.Cancel() operation)

=== Test Setup <sec:test-setup-183>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure the EUT has inactive firmware in one of FirmwareImage slots.
+ Ensure the EUT has a subscription to the Boot! event with the
  Controller used for testing set as the Recipient.

=== Test Procedure <sec:test-procedure-176>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Send an message to the EUT with the following structure:

  ```
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
+ Wait up to 500 seconds for a Boot! event from the EUT.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-184>

+ The EUT sends a OperationResponse after step 1 with a
  `executed_command` element of 'Activate()' and a `req_obj_path`
  referencing an entry in the Device.LocalAgent.Request table.
+ The EUT never sends a Boot! event.
+ In the GetResponse from the EUT after step 4, the Request instance is
  either non\-existent or the Status parameter of the relevant request
  is either Cancelled or Cancelling.

== 9.9 Adding a New Controller \- OnBoardRequest <sec:adding-a-new-controller---onboardrequest>

=== Purpose <sec:purpose-184>

The purpose of this test is to ensure the EUT can handle the manual
adding of a new Controller.

=== Functionality Tags <sec:functionality-tags-83>

Conditional Mandatory (supports Controller:1 profile with the ability to
create instances of the Device.LocalAgent.Controller. object, supports
SendOnBoardRequest())

=== Test Setup <sec:test-setup-184>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ A valid role instance is configured on the EUT for use with the new
  certificate.
+ A valid certificate instance is configured on the EUT
+ A secondary Controller is configured and ready to communicate with
  another endpoint.

=== Test Procedure <sec:test-procedure-177>

+ Send an Add message to the EUT with the following structure.

  ```
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
+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Allow the secondary Controller to receive the OnBoardRequest() and
  send a NotifyResponse.

=== Test Metrics <sec:test-metrics-185>

+ The EUT is able to start a session with the secondary Controller.
+ The EUT sends a Notify message to the secondary Controller containing
  an OnBoardRequest element.

== 9.10 Use of the Boot! event and BootParameters <sec:use-of-the-boot-event-and-bootparameters>

=== Purpose <sec:purpose-185>

The purpose of this test is to ensure the EUT correctly triggers the
Boot! event and correctly includes the configured BootParameters.

=== Functionality Tags <sec:functionality-tags-84>

Conditional Mandatory (supports Reboot:1 profile, supports
Device.DeviceInfo.BootFirmwareImage)

=== Test Setup <sec:test-setup-185>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-178>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for a Notify message from the EUT.

=== Test Metrics <sec:test-metrics-186>

+ After step 2 the EUT sends a Notify message with an event element
  containing a ParameterMap argument with
  'Device.DeviceInfo.BootFirmwareImage'

== 9.11 Use of the Timer! Event <sec:use-of-the-timer-event>

=== Purpose <sec:purpose-186>

The purpose of this test is to ensure the Timer! event can be
configured, and the EUT correctly triggers the event.

=== Functionality Tags <sec:functionality-tags-85>

Conditional Mandatory (supports Device.ScheduleTimer() command)

=== Test Setup <sec:test-setup-186>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that a Subscription object exists on the EUT with NotifType
  OperationComplete on Device.ScheduleTimer().

=== Test Procedure <sec:test-procedure-179>

+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a Notification.

=== Test Metrics <sec:test-metrics-187>

+ The EUT sends an OperateResponse with ScheduleTimer() in the
  executed\_command element.
+ The EUT sends an OperationComplete Notify message with an event
  element containing ScheduleTimer().

= 10 Bulk Data Collection Test Cases <sec:bulk-data-collection-test-cases>

== 10.1 Use BulkData collection using HTTP and JSON <sec:use-bulkdata-collection-using-http-and-json>

=== Purpose <sec:purpose-187>

The purpose of this test is to verify that EUT supports JSON BulkData
collection over HTTP.

=== Functionality Tags <sec:functionality-tags-86>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols, "JSON" ∈ Device.BulkData.EncodingTypes)

=== Test Setup <sec:test-setup-187>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured to
  support receiving JSON BulkData transfers.

=== Test Procedure <sec:test-procedure-180>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: 'JSON'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-188>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The encoding of the BulkData transfer is JSON and is well formed
  (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are encoded as URI parameters in the request.

== 10.2 Use BulkData collection using HTTPS and JSON <sec:use-bulkdata-collection-using-https-and-json>

=== Purpose <sec:purpose-188>

The purpose of this test is to verify that EUT supports JSON BulkData
collection over HTTPS.

=== Functionality Tags <sec:functionality-tags-87>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols, "JSON" ∈ Device.BulkData.EncodingTypes)

=== Test Setup <sec:test-setup-188>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTPS endpoint that is accessible by the EUT is configured to
  support receiving JSON BulkData transfers.

=== Test Procedure <sec:test-procedure-181>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: 'JSON'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-189>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The encoding of the BulkData transfer is JSON and is well formed
  (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are encoded as URI parameters in the request.

== 10.3 Use BulkData collection using HTTP and CSV <sec:use-bulkdata-collection-using-http-and-csv>

=== Purpose <sec:purpose-189>

The purpose of this test is to verify that EUT supports CSV BulkData
collection over HTTP.

=== Functionality Tags <sec:functionality-tags-88>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols, "CSV" ∈ Device.BulkData.EncodingTypes)

=== Test Setup <sec:test-setup-189>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured to
  support receiving CSV BulkData transfers.

=== Test Procedure <sec:test-procedure-182>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: 'CSV'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-190>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The encoding of the BulkData transfer is CSV and is well formed
  (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are encoded as URI parameters in the request.

== 10.4 Use BulkData collection using HTTPS and CSV <sec:use-bulkdata-collection-using-https-and-csv>

=== Purpose <sec:purpose-190>

The purpose of this test is to verify that EUT supports CSV BulkData
collection over HTTPS.

=== Functionality Tags <sec:functionality-tags-89>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols, "CSV" ∈ Device.BulkData.EncodingTypes)

=== Test Setup <sec:test-setup-190>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTPS endpoint that is accessible by the EUT is configured to
  support receiving CSV BulkData transfers.

=== Test Procedure <sec:test-procedure-183>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: 'CSV'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-191>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The encoding of the BulkData transfer is CSV and is well formed
  (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are encoded as URI parameters in the request.

== 10.5 Use BulkData collection using HTTP with URI Parameters <sec:use-bulkdata-collection-using-http-with-uri-parameters>

=== Purpose <sec:purpose-191>

The purpose of this test is to verify that EUT supports BulkData
collection over HTTP with extra URI parameters

=== Functionality Tags <sec:functionality-tags-90>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-191>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured.

=== Test Procedure <sec:test-procedure-184>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<Supported Encoding type>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.HTTP.RequestURIParameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-192>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The EUT includes the EUT UpTime encoded into the URI using the name
  'UpTime'
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are also encoded as URI parameters in the request.

== 10.6 Use BulkData collection using HTTPS with URI Parameters <sec:use-bulkdata-collection-using-https-with-uri-parameters>

=== Purpose <sec:purpose-192>

The purpose of this test is to verify that EUT supports BulkData
collection over HTTPS with extra URI parameters

=== Functionality Tags <sec:functionality-tags-91>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-192>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTPS endpoint that is accessible by the EUT is configured.

=== Test Procedure <sec:test-procedure-185>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<Supported Encoding type>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of https endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.HTTP.RequestURIParameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-193>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The EUT includes the EUT UpTime encoded into the URI using the name
  'UpTime'
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are also encoded as URI parameters in the request.

== 10.7 BulkData collection retry mechanism over HTTP <sec:bulkdata-collection-retry-mechanism-over-http>

=== Purpose <sec:purpose-193>

The purpose of this test is to verify that EUT supports BulkData
collection retry mechanism.

=== Functionality Tags <sec:functionality-tags-92>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-193>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured.

=== Test Procedure <sec:test-procedure-186>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<Supported Encoding type>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
            param_settings {
                 param: 'HTTP.RetryEnable'
                 value: 'true'
             }
            param_settings {
                 param: 'HTTP.RetryMinimumWaitInterval'
                 value: '5'
             }
            param_settings {
                 param: 'HTTP.RetryIntervalMultiplier'
                 value: '2000'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Disable the HTTP BulkData collection endpoint.
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Allow the EUT to attempt to send a BulkData transfer.
+ Wait for 13 seconds for the EUT to retry the BulkData transfer.
+ Wait for 23 seconds for the EUT to retry the BulkData transfer.
+ Enable the HTTP BulkData collection endpoint
+ Wait for 43 seconds for the EUT to retry the BulkData transfer.
+ Wait for the EUT to send a BulkData transfer

=== Test Metrics <sec:test-metrics-194>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ The EUT retries sending the BulkData transfer 3 times with each time
  occurring within the expected retry interval.
+ The EUT does not attempt to retry the BulkData transfer after
  receiving a positive response in step 9.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are encoded as URI parameters in each request.

== 10.8 Use BulkData collection using HTTP with wildcard parameter <sec:use-bulkdata-collection-using-http-with-wildcard-parameter>

=== Purpose <sec:purpose-194>

The purpose of this test is to verify that EUT supports BulkData
collection over HTTP with a wildcarded parameter

=== Functionality Tags <sec:functionality-tags-93>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-194>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured.
+ Ensure there are at least 2 BootParameters configured for the test
  controller.

=== Test Procedure <sec:test-procedure-187>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<Supported Encoding type>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'Enabled'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.Controller.*.BootParameter.*.Enable'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-195>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTP endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ Ensure at least two "Enable" are in the BulkData transfer with the
  parameter names matching the following expression:
  `Enabled\.[1-9][0-9]*\.[1-9][0-9]*`
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are also encoded as URI parameters in the request.

== 10.9 Use BulkData collection using HTTP with Object Path <sec:use-bulkdata-collection-using-http-with-object-path>

=== Purpose <sec:purpose-195>

The purpose of this test is to verify that EUT supports BulkData
collection over HTTP with an Object Path

=== Functionality Tags <sec:functionality-tags-94>

Conditional Mandatory (supports BulkDataColl:1, "HTTP" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-195>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a HTTP endpoint that is accessible by the EUT is configured.

=== Test Procedure <sec:test-procedure-188>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'HTTP'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<Supported Encoding type>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'HTTP.URL'
                 value: '<URL of http endpoint>'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'TestController'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.Controller.<controller instance>.'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-196>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfers
  to the HTTPS endpoint within 130 (`(ReportingInterval * 2) + 10`)
  seconds.
+ Ensure that all the parameters included in the BulkData transfer match
  `TestController.<parameter>` and that all expected parameters are
  present.
+ Ensure the Manufacturer OUI, Product Class and Serial Number or the
  USP Endpoint ID are also encoded as URI parameters in the request.

== 10.10 Use BulkData collection Push event <sec:use-bulkdata-collection-push-event>

=== Purpose <sec:purpose-196>

The purpose of this test is to verify that EUT supports BulkData
collection via the Push event.

=== Functionality Tags <sec:functionality-tags-95>

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-196>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-189>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'USPEventNotif'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<JSON or CSV>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Add message to the EUT with the following structure:

  ```
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
                 param: 'NotifType'
                 value: 'Event'
             }
            param_settings {
                 param: 'ReferenceList'
                 value: 'Device.BulkData.Profile.<instance identifier>.Push!'
             }
            param_settings {
                 param: 'Enable'
                 value: 'true'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-197>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfer
  Push! events to the controller within 130
  (`(ReportingInterval * 2) + 10`) seconds.
+ The encoding of the Data parameter in the Push! notification is well
  formed (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.

== 10.11 Use BulkData collection Push event with Wildcard path <sec:use-bulkdata-collection-push-event-with-wildcard-path>

=== Purpose <sec:purpose-197>

The purpose of this test is to verify that EUT supports BulkData
collection via the Push event using a wildcard path.

=== Functionality Tags <sec:functionality-tags-96>

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-197>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure that there are at least 2 BootParameters configured for the
  test Controller.

=== Test Procedure <sec:test-procedure-190>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'USPEventNotif'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<JSON or CSV>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'Enabled'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.Controller.*.BootParameter.*.Enable'
             }
          }
      }
    }
  }
  ```
+ Send a Add message to the EUT with the following structure:

  ```
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
                 param: 'NotifType'
                 value: 'Event'
             }
            param_settings {
                 param: 'ReferenceList'
                 value: 'Device.BulkData.Profile.<instance identifier>.Push!'
             }
            param_settings {
                 param: 'Enable'
                 value: 'true'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-198>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfer
  Push! events to the controller within 130
  (`(ReportingInterval * 2) + 10`) seconds.
+ The encoding of the Data parameter in the Push! notification is well
  formed (parsable).
+ The BulkData transfer contains at least 2 parameters, one for each of
  the configured BootParameters and the name of the parameters match the
  expected name `Enabled\.[1-9][0-9]*\.[1-9][0-9]*`.

== 10.12 Use BulkData collection Push event with Object path <sec:use-bulkdata-collection-push-event-with-object-path>

=== Purpose <sec:purpose-198>

The purpose of this test is to verify that EUT supports BulkData
collection via the Push event using an object path.

=== Functionality Tags <sec:functionality-tags-97>

Conditional Mandatory (supports BulkDataColl:1, "USPEventNotif" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-198>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.

=== Test Procedure <sec:test-procedure-191>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'USPEventNotif'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<JSON or CSV>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'Controller'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.LocalAgent.Controller.'
             }
          }
      }
    }
  }
  ```
+ Send a Add message to the EUT with the following structure:

  ```
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
                 param: 'NotifType'
                 value: 'Event'
             }
            param_settings {
                 param: 'ReferenceList'
                 value: 'Device.BulkData.Profile.<instance identifier>.Push!'
             }
            param_settings {
                 param: 'Enable'
                 value: 'true'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-199>

+ After enabling the BulkData profile the EUT sent 2 BulkData transfer
  Push! events to the controller within 130
  (`(ReportingInterval * 2) + 10`) seconds.
+ The encoding of the Data parameter in the Push! notification is well
  formed (parsable).
+ The BulkData transfer contains at parameters with names using the
  prefix "Controller".

== 10.13 Use BulkData collection over MQTT <sec:use-bulkdata-collection-over-mqtt>

=== Purpose <sec:purpose-199>

The purpose of this test is to verify that EUT supports BulkData
collection via MQTT.

=== Functionality Tags <sec:functionality-tags-98>

Conditional Mandatory (supports BulkDataColl:1, "MQTT" ∈
Device.BulkData.Protocols)

=== Test Setup <sec:test-setup-199>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP Records to each other.
+ Ensure a MQTT endpoint that is accessible by the EUT is enabled in the
  test environment.
+ Ensure there is a Device.MQTT.Client. entry in the EUT’s data model
  for the MQTT endpoint mentioned in step 2 of the test setup.

=== Test Procedure <sec:test-procedure-192>

+ Send an Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.'
            param_settings {
                 param: 'Protocol'
                 value: 'MQTT'
             }
            param_settings {
                 param: 'EncodingType'
                 value: '<JSON or CSV>'
             }
            param_settings {
                 param: 'ReportingInterval'
                 value: 'max(60, Device.BulkData.MinReportingInterval)'
             }
            param_settings {
                 param: 'MQTT.Reference'
                 value: '<MQTT.Client instance from step 3 of test setup>'
             }
            param_settings {
                 param: 'MQTT.PublishTopic'
                 value: 'mqtt-bulkdata'
             }
          }
      }
    }
  }
  ```
+ Allow the EUT to send an AddResponse
+ Record the instance identifiers of the created objects as reported by
  the EUT.
+ Send a Add message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: ADD
  }
  body {
    request {
      add {
        allow_partial: false
        create_objs {
            obj_path: 'Device.BulkData.Profile.<instance identifier>.Parameter.'
            param_settings {
                 param: 'Name'
                 value: 'UpTime'
             }
            param_settings {
                 param: 'Reference'
                 value: 'Device.DeviceInfo.UpTime'
             }
          }
      }
    }
  }
  ```
+ Send a Set message to the EUT with the following structure:

  ```
  header {
    msg_id: '<msg_id>'
    msg_type: SET
  }
  body {
    request {
      set {
          allow_partial: false
          update_objs {
              obj_path: 'Device.BulkData.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
          update_objs {
              obj_path: 'Device.BulkData.Profile.<instance identifier>.'
              param_settings {
                param: 'Enable'
                value: 'true'
              }
            }
      }
    }
  }
  ```
+ Wait up to 130 (`(ReportingInterval * 2) + 10`) seconds

=== Test Metrics <sec:test-metrics-200>

+ After enabling the BulkData profile the EUT published 2 BulkData
  transfers to the MQTT server using using the configured topic within
  130 (`(ReportingInterval * 2) + 10`) seconds.
+ The encoding of the Data parameter in the MQTT frame notification is
  well formed (parsable).
+ The BulkData transfer contains the one parameter configured in step 4
  and the name of the parameter matches the expected name 'UpTime'.

= 11 MQTT Test Cases <sec:mqtt-test-cases>

== 11.1 Support of Required MQTT Profiles <sec:support-of-required-mqtt-profiles>

=== Purpose <sec:purpose-200>

The purpose of this test is to ensure the EUT supports the required MQTT
profiles.

=== Functionality Tags <sec:functionality-tags-99>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-200>

+ Ensure that the EUT and test equipment have the necessary information
  to send and receive USP records to each other.

=== Test Procedure <sec:test-procedure-193>

+ Send a GetSupportedDM message to the EUT with the following structure:

  ```
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
+ Wait for the GetSupportedDMResponse.

=== Test Metrics <sec:test-metrics-201>

+ The EUT sends a GetSupportedDMResponse.
+ The GetSupportedDMResponse from the EUT contains all required
  parameters in the MQTTClientCon:1, MQTTClientSubscribe:1, MQTTAgent:1,
  and MQTTController:1 data model profiles. The parameter
  `Device.MQTT.Client.{i}.MessageRetryTime` is not required to be
  supported for EUTs that only implement MQTT version 5.0.

== 11.2 MQTT session establishment using a CONNECT packet <sec:mqtt-session-establishment-using-a-connect-packet>

=== Purpose <sec:purpose-201>

The purpose of this test is to ensure the EUT can properly start an MQTT
session using an MQTT CONNECT packet.

=== Functionality Tags <sec:functionality-tags-100>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-201>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.
+ Ensure that the EUT data model is configured with
  `.MQTT.Client.{i}.Username`, `.MQTT.Client.{i}.Password` values.

=== Test Procedure <sec:test-procedure-194>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.

=== Test Metrics <sec:test-metrics-202>

+ The EUT sends an MQTT CONNECT packet to the MQTT server. \
+ The MQTT CONNECT packet Version is either 5.0 or 3.1.1.
+ If the EUT uses MQTT 5.0, the MQTT CONNECT packet contains a User
  Property name\-value pair with name of "usp\-endpoint\-id" and value
  of the EUT USP Endpoint ID.
+ The EUT includes User Name and Password fields in the MQTT CONNECT
  packet.

== 11.3 MQTT Use of TLS <sec:mqtt-use-of-tls>

=== Purpose <sec:purpose-202>

The purpose of this test is to ensure the EUT can establish secure MQTT
communication via TLS.

=== Functionality Tags <sec:functionality-tags-101>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-202>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.
+ Ensure the EUT and MQTT server are configured with the appropriate
  certificates to communicate over TLS.

=== Test Procedure <sec:test-procedure-195>

+ Reboot the EUT
+ Wait for the EUT to reconnect to the MQTT server
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse

=== Test Metrics <sec:test-metrics-203>

+ All communication between the EUT and MQTT server after step 1 are
  encrypted using TLS 1.2 or later.

== 11.4 MQTT 5.0 ClientID <sec:mqtt-5.0-clientid>

=== Purpose <sec:purpose-203>

The purpose of this test is to ensure the EUT properly sets the ClientID
field in MQTT packets.

=== Functionality Tags <sec:functionality-tags-102>

Conditional Mandatory (supports the MQTT MTP, version 5.0)

=== Test Setup <sec:test-setup-203>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-196>

+ Send a Set message to the EUT with the following structure:

  ```
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
+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.
+ The MQTT server sends an MQTT CONNACK packet with an Assigned Client
  Identifier.
+ Send a Get message to the EUT with the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-204>

+ The EUT MQTT CONNECT packet must include a ClientID set to an empty
  string.
+ The retrieved value of ClientID matches the Assigned Client Identifier
  from step 4.

== 11.5 MQTT ClientID Persistence <sec:mqtt-clientid-persistence>

=== Purpose <sec:purpose-204>

The purpose of this test is to ensure the MQTT ClientID field persists
after successful connection with an MQTT server.

=== Functionality Tags <sec:functionality-tags-103>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-204>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-197>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.

=== Test Metrics <sec:test-metrics-205>

+ The EUT uses the same ClientID in the subsequent MQTT CONNECT packet.

== 11.6 MQTT Message Retry <sec:mqtt-message-retry>

=== Purpose <sec:purpose-205>

The purpose of this test is to ensure the EUT properly enters a retry
state when it fails to connect to the MQTT server.

=== Functionality Tags <sec:functionality-tags-104>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-205>

+ Ensure the EUT is configured to use an MQTT server that is part of the
  test environment.

=== Test Procedure <sec:test-procedure-198>

+ Send a Get message to the EUT with the following structure

  ```
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
+ Send an Operate message to the EUT with the following structure:

  ```
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
+ Disable the MQTT server.
+ Allow the EUT to attempt to start an MQTT session with the MQTT
  server.
+ Reenable the MQTT server after the EUT fails to connect to the MQTT
  server twice.

=== Test Metrics <sec:test-metrics-206>

+ The EUT retries connecting to the MQTT server within the
  `ConnectRetryTime` of the connection instance.
+ The EUT retries a second time in accordance with `ConnectRetryTime`
  and `ConnectRetryIntervalMultiplier`.

== 11.7 MQTT Keep Alive <sec:mqtt-keep-alive>

=== Purpose <sec:purpose-206>

The purpose of this test is to ensure the EUT can correctly implement
the MQTT keep alive mechanism and the relevant parameters in the data
model.

=== Functionality Tags <sec:functionality-tags-105>

Conditional Mandatory (supports the MQTT MTP, version 5.0)

=== Test Setup <sec:test-setup-206>

+ The EUT is configured to use an MQTT server which exists in the test
  environment.

=== Test Procedure <sec:test-procedure-199>

+ Send a Set message to the EUT with the following structure:

  ```
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
+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.
+ The MQTT server sends an MQTT CONNACK packet with a Keep Alive value
  of 30 seconds.
+ Wait 45 seconds.

=== Test Metrics <sec:test-metrics-207>

+ The EUT sends an MQTT CONNECT packet on boot with the Keep Alive
  property set to 60 seconds.
+ The EUT sends an MQTT PINGREQ packet within 45 seconds of the last
  MQTT message. This represents 1.5 times the Keep Alive value.

== 11.8 MQTT SUBSCRIBE Packet <sec:mqtt-subscribe-packet>

=== Purpose <sec:purpose-207>

The purpose of this test is to ensure the EUT includes the correct
fields in an MQTT SUBSCRIBE packet.

=== Functionality Tags <sec:functionality-tags-106>

Conditional Mandatory (supports the MQTT MTP, version 5.0)

=== Test Setup <sec:test-setup-207>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.

=== Test Procedure <sec:test-procedure-200>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.
+ The MQTT server sends an MQTT CONNACK packet containing a User
  Property of subscribe\-topic.
+ For an EUT using MQTT 5.0, the MQTT CONNACK packet contains a Response
  Information property.
+ Wait for the EUT to send an MQTT SUBSCRIBE packet.

=== Test Metrics <sec:test-metrics-208>

+ The EUT sends an MQTT CONNECT packet to the MQTT server. If the EUT
  uses MQTT 5.0, the Request Response Information property must be set
  to 1.
+ The EUT sends an MQTT SUBSCRIBE packet to the MQTT server. The MQTT
  SUBSCRIBE packet includes the subscribe\-topic sent in step 3.
+ If the EUT uses MQTT 5.0, the MQTT SUBSCRIBE packet includes the
  Response Information property sent in step 4.

== 11.9 MQTT New Subscription <sec:mqtt-new-subscription>

=== Purpose <sec:purpose-208>

The purpose of this test is to ensure the EUT sends an MQTT SUBSCRIBE
packet when a new `Device.MQTT.Client.{i}.Subscription.{i}.` object is
added.

=== Functionality Tags <sec:functionality-tags-107>

Conditional Mandatory (supports MQTT MTP)

=== Test Setup <sec:test-setup-208>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.

=== Test Metrics <sec:test-metrics-209>

+ Send an Add message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send an MQTT SUBSCRIBE packet.
+ The MQTT server sends an MQTT SUBACK packet indicating the QoS level
  that was granted for the subscription.
+ Send a Get message with topic `newTopic-11-9` with the following
  structure:

  ```
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
+ Send a Set message to the EUT with the following structure:

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
+ The MQTT Server sends an MQTT UNSUBACK packet indicating success.

=== Test Metrics <sec:test-metrics-210>

+ The EUT sends an MQTT SUBSCRIBE packet that includes the new Topic
  from step 1.
+ The EUT sends a GetResp for the Subscription.
+ The EUT sends an MQTT UNSUBSCRIBE packet for the configured Topic
  after Enable is set to false.

== 11.10 MQTT No Topic in CONNACK <sec:mqtt-no-topic-in-connack>

=== Purpose <sec:purpose-209>

The purpose of this test is to ensure the EUT will disconnect from the
MQTT server if it receives no subscribe\-topic.

=== Functionality Tags <sec:functionality-tags-108>

Conditional Mandatory (supports the MQTT MTP, version 5.0)

=== Test Setup <sec:test-setup-209>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.
+ Ensure that all instances of
  `Device.MQTT.Client.<active MQTT client instance>.Subscription.` are
  removed from the EUT.

=== Test Procedure <sec:test-procedure-201>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.
+ The MQTT server sends an MQTT CONNACK packet that does not include a
  subscribe\-topic User Property.

=== Test Metrics <sec:test-metrics-211>

+ The EUT sends an MQTT DISCONNECT packet to the MQTT server.

== 11.11 MQTT Failure to Subscribe <sec:mqtt-failure-to-subscribe>

=== Purpose <sec:purpose-210>

The purpose of this test is to ensure the EUT will disconnect from the
MQTT server if it is unable to subscribe to a Topic.

=== Functionality Tags <sec:functionality-tags-109>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-210>

+ Ensure that the EUT is configured to use an MQTT server that exists in
  the test environment.
+ Ensure that the EUT is configured to send a
  Device.LocalAgent.Periodic! event to the Controller every 60 seconds
  through the Device. LocalAgent.Controller.\<i>.PeriodicNotifInterval
  parameter.

=== Test Procedure <sec:test-procedure-202>

+ Reboot the EUT.
+ Wait for the EUT to send an MQTT SUBSCRIBE packet.
+ The MQTT server sends an MQTT SUBACK packet that includes an error for
  each Topic in the SUBSCRIBE packet.
+ Wait 120 seconds.

=== Test Metrics <sec:test-metrics-212>

+ The EUT sends an MQTT DISCONNECT packet to the MQTT server.
+ The EUT does not publish a USP record to the MQTT server for any Topic
  in the MQTT SUBSCRIBE packet.

== 11.12 MQTT PUBLISH Packet <sec:mqtt-publish-packet>

=== Purpose <sec:purpose-211>

The purpose of this test is to ensure the EUT can send a properly
formatted an MQTT PUBLISH packet.

=== Functionality Tags <sec:functionality-tags-110>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-211>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-203>

+ Reboot the EUT.
+ Wait for the EUT to reconnect to the MQTT server.
+ The MQTT server sends a CONNACK packet.
+ For an EUT using MQTT 5.0, the CONNACK packet contains a Response
  Information property.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse

=== Test Metrics <sec:test-metrics-213>

+ The EUT sends an MQTT PUBLISH packet containing a GetResponse.
+ If the EUT uses MQTT 5.0, the Response Topic is set to the Response
  Information property from step 4.
+ If the EUT uses MQTT 3.1.1, the "reply to" is included after
  `/reply-to=` at the end of the PUBLISH Topic Name, with any `/`
  character in the Topic replaced by `%2F`.
+ If the EUT uses MQTT 5.0, the Content Type property is set to
  `usp.msg`

== 11.13 MQTT QoS <sec:mqtt-qos>

=== Purpose <sec:purpose-212>

The purpose of this test is to ensure the EUT supports at least MQTT QoS
levels 0 and 1.

=== Functionality Tags <sec:functionality-tags-111>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-212>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-204>

+ Send an Add message to the EUT with the following structure:

  ```
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
                }
          }
      }
  }
  ```
+ Wait for the EUT to send an MQTT SUBSCRIBE packet.
+ The MQTT server sends an MQTT SUBACK packet indicating a QoS level of
  0 for the subscription.
+ Send an Add message to the EUT with the following structure:

  ```
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
+ The MQTT server sends an MQTT SUBACK packet indicating a QoS level of
  1 for the subscription.
+ Send a Get message with topic 'newTopic\-11\-13\-QoS0' to the EUT with
  the following structure:

  ```
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
+ Send a Get message with topic 'newTopic\-11\-13\-QoS1' to the EUT with
  the following structure:

  ```
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

=== Test Metrics <sec:test-metrics-214>

+ The EUT sends a GetResp for the Get message sent to topic
  'newTopic\-11\-13\-QoS0'.
+ The EUT sends a GetResp for the Get message sent to topic
  'newTopic\-11\-13\-QoS1'.

== 11.14 MQTT Reply to Topic <sec:mqtt-reply-to-topic>

=== Purpose <sec:purpose-213>

The purpose of this test is to ensure the EUT can process and set the
"reply to" Topic in MQTT PUBLISH packets.

=== Functionality Tags <sec:functionality-tags-112>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-213>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-205>

+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse.

=== Test Metrics <sec:test-metrics-215>

+ If the EUT uses MQTT 5.0, the EUT must send an MQTT PUBLISH packet
  that includes a GetResponse. The Topic Name must be set to the "reply
  to" Topic from the controller’s MQTT PUBLISH packet Response Topic
  property. The EUT must include a Response Topic property that has a
  "reply to" Topic set.
+ If the EUT uses MQTT 3.1.1, the EUT must send an MQTT PUBLISH packet
  that includes a GetResponse. The Topic must be set to the reply to
  topic at the end of the Topic Name in the Controller’s MQTT PUBLISH
  packet. All instances of `%2F` must be replaced by `/` in the Topic
  Name. The EUT must set a reply to topic by including it at the end of
  the Topic Name after `/reply-to=` and replacing all instances of `/`
  with `%2F`.

== 11.15 MQTT 5.0 Content Type <sec:mqtt-5.0-content-type>

=== Purpose <sec:purpose-214>

The purpose of this test is to ensure the EUT can accept valid values of
the MQTT Content Type property.

=== Functionality Tags <sec:functionality-tags-113>

Conditional Mandatory (supports the MQTT MTP, version 5.0)

=== Test Setup <sec:test-setup-214>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-206>

+ Configure the Controller to include an MQTT Content Type property of
  `usp.msg` in its MQTT packets.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse.
+ Configure the Controller to include an MQTT Content Type property of
  `application/vnd.bbf.usp.msg` in its MQTT packets.
+ Send a Get message to the EUT with the following structure:

  ```
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
+ Wait for the EUT to send a GetResponse.

=== Test Metrics <sec:test-metrics-216>

+ The EUT must send a GetResponse for both Get messages, indicating that
  it processed the Controller’s MQTT PUBLISH packets.

== 11.16 MQTT Connection Retry <sec:mqtt-connection-retry>

=== Purpose <sec:purpose-215>

The purpose of this test is to ensure the EUT retries its connection
with the MQTT server after the server terminates the connection.

=== Functionality Tags <sec:functionality-tags-114>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-215>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-207>

+ Send an MQTT DISCONNECT packet to the EUT.
+ Allow the EUT to start a new MQTT session with the MQTT server.

=== Test Metrics <sec:test-metrics-217>

+ The EUT retries connecting to the MQTT server between ConnectRetryTime
  of the connection instance and
  ConnectRetryTime\*(ConnectRetryIntervalMultiplier\/1000).

== 11.17 MQTT \- Use of Connect Record <sec:mqtt---use-of-connect-record>

=== Purpose <sec:purpose-216>

The purpose of this test is to ensure the EUT correctly sends a Connect
record after it has established a communications channel to the
controller.

=== Functionality Tags <sec:functionality-tags-115>

Conditional Mandatory (supports the MQTT MTP)

=== Test Setup <sec:test-setup-216>

+ Ensure the EUT is configured to use an MQTT server that exists in the
  test environment.

=== Test Procedure <sec:test-procedure-208>

+ Reboot the EUT.
+ Wait for the EUT to establish an MQTT session with the MQTT server.

=== Test Metrics <sec:test-metrics-218>

+ After reconnecting to the MQTT server, the EUT transmits an
  MQTTConnectRecord within 30 seconds. The EUT includes the MQTTVersion
  field set to the correct MQTT version and the subscribed\_topic field
  set to a Topic that the EUT is subscribed to.

