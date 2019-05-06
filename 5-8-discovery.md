## 5.8 Discovery Test Cases

### 5.8.1 DHCP Discovery - Agent Request Requirements

#### Purpose

The purpose of this test is to ensure the EUT correctly requests
controller information via DHCP. *Note: this test can be run over DHCPv4 or
DHCPv6, depending on the deployment model of the EUT.*

#### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

#### Test Setup

1. Ensure the EUT is configured to request controller DHCP information.
2. Ensure the EUT is configured to acquire an address via DHCP.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to requets an address via DHCP.

#### Test Metrics

1. The EUT includes a Vendor Class option with Enterprise Number 3561
   and vendor-class-data "usp" in the DHCP request.

### 5.8.2 DHCP Discovery - Agent handling of recieved options

#### Purpose

The purpose of this test is to ensure the EUT can properly handle
the USP options provided by a DHCP server.

#### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

#### Test Setup

1. Ensure the EUT is configured to request controller DHCP information
2. Ensure the EUT is configured to acquire an address via DHCP.
3. Ensure the EUT's `ProvisioningCode` parameter is set to a value other than
that which will be set during the test procedure.

#### Test Procedure

1. Configure the DHCP server to provide a null terminated provisioning code.
2. Reboot the EUT.
3. Wait for the EUT to request an address via DHCP.
4. Send a Get message to the EUT with the following structure:

```
header {
    msg_id: "<msg_id>"
    msg_type: GET
}
body {
    request {
        get {
            param_paths: Device.LocalAgent.Controller.<test controller instance>.
        }
    }
}
```

5. Wait for the GetResponse from the EUT.

#### Test Metrics

1. The `ProvisioningCode` parameter found in the GetReponse matches the provisioning
   code configured on the DHCP server.

### 5.8.3 DHCP Discovery - FQDN Leads to DNS Query

#### Purpose

The purpose of this test is to ensure the EUT correctly uses DNS to retrieve additonal
controller information upon receiving a FQDN of a controller.

#### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

#### Test Setup

1. Ensure the EUT is configured to request controller information via DHCP.
2. Ensure the EUT is configured to acquire an address via DHCP.

#### Test Procedure

1. Configure the DHCP server to provide a controller URL with a FQDN.
2. Reboot the EUT.
3. Wait for the EUT to request an address.
4. Wait for the EUT to query the DNS with the FQDN.
5. Wait for the EUT to connect to the controller.

#### Test Metrics

1. After the EUT receives a FQDN in the DHCP Offer, the EUT uses
   DNS to retrive additional information about the controller.

### 5.8.4 mDNS

#### Purpose

The purpose of this test is to ensure the EUT correctly implements
mDNS.

#### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

#### Test Setup

1. Ensure the EUT has mDNS enabled.
2. Ensure the controller exists on the same network as the EUT.

#### Test Procedure

1. Configure the DHCP server to provide a controller URL with a FQDN
   containing ".local.".
2. Wait for the EUT to send a mDNS request for the FQDN.
3. Allow the controller to respond to the mDNS request.

#### Test Metrics

1. After the EUT receieves a FQDN via DHCP containing ".local."
   the EUT uses mDNS to resolve it.

### 5.8.5 mDNS and Message Transfer Protocols

#### Purpose

The purpose of this test is to ensure the EUT correctly advertises
the MTPs it supports.

#### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

#### Test Setup

1. Ensure the EUT has mDNS enabled.
2. Ensure the controller exists on the same network as the EUT.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to acquire an address.
3. Wait for the EUT to send an unsolicited mDNS response.

#### Test Metrics

1. The EUT sends an unsolicated multicast DNS response containing
   in the anwser section a record for each supported MTP.

### 5.8.6 DNS - Resolving non-local endpoints

#### Purpose

The purpose of this test is to ensure the EUT uses DNS to resolve
FQDN when the domain is not applicable for resolution via mDNS.

#### Functionality Tags

Mandatory

#### Test Setup

1. Ensure the DHCP server providing an address to the EUT is configured to
   provide a FQDN for a controller that does not contain ".local.".
2. Ensure the EUT is configured to discover controllers via DHCP.
3. Ensure the DHCP server is configured to provide a DNS server.

#### Test Procedure

1. Reboot the EUT.
2. Allow the EUT to acquire an address.
3. Wait for the EUT to send a DNS query for the FQDN acquired during DHCP controller
   discovery.

#### Test Metrics

1. After the EUT receives a FQDN via DHCP controller discovery, it uses DNS to
   resolve the FQDN.


### 5.8.7 DNS - Unknown Resource Path

#### Purpose

The purpose of this test is to ensure the EUT used DNS-SD information about a
controller when the resource path is not known.

#### Functionallity Tags

Mandatory

#### Test Setup

1. Configure the DHCP server to provide a FQDN that the EUT has never seen before.
2. Ensure the EUT is configured to discover controllers via DHCP.

#### Test Procedure

1. Reboot the EUT.
2. Allow the EUT to acquire an address via DHCP.
3. Wait for the EUT to use DNS to resolve the FQDN.
4. Wait for the EUT to request DNS-SD information.

#### Test Metrics

1. The EUT requests uses a DNS service discovery mechanism to
   request additional information about the controller.

### 5.8.8 DNS - DNS Record Requirements

#### Purpose

The purpose of this test is to ensure the EUT provides valid DNS-SD records.

#### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

#### Test Setup

1. Ensure mDNS is enabled on the EUT.

#### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to acquire a new address.
3. Wait for to the EUT to send a multicast mDNS advertisement.

#### Test Metrics

1. The EUT sends a multicast mDNS advertisement containing a TXT record
   for every supported MTP.
2. Every TXT record in the mDNS advertisement has a "path" and "name" attribute.
