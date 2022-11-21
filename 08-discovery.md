# 8 Discovery Test Cases

## 8.1 DHCP Discovery - Agent Request Requirements

### Purpose

The purpose of this test is to ensure the EUT correctly requests
controller information via DHCP. *Note: this test can be run over DHCPv4 or
DHCPv6, depending on the deployment model of the EUT.*

### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

### Test Setup

1. Ensure the EUT is configured to request controller DHCP information.
2. Ensure the EUT is configured to acquire an address via DHCP.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to request an address via DHCP.

### Test Metrics

1. The EUT includes a Vendor Class option with Enterprise Number 3561
   and vendor-class-data "usp" in the DHCP request.

## 8.2 DHCP Discovery - Agent handling of received options

### Purpose

The purpose of this test is to ensure the EUT can properly handle
the USP options provided by a DHCP server.

### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

### Test Setup

1. Ensure the EUT is configured to request controller DHCP information
2. Ensure the EUT is configured to acquire an address via DHCP.
3. Ensure the EUT ProvisioningCode parameter is set to a value other than
that which will be set during the test procedure.

### Test Procedure

1. Configure the DHCP server to provide a null terminated provisioning code.
2. Reboot the EUT.
3. Wait for the EUT to request an address via DHCP.
4. Send a Get message to the EUT with the following structure:

    ```{filter=pbv type=Msg}
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

5. Wait for the GetResponse from the EUT.

### Test Metrics

1. The ProvisioningCode parameter found in the GetResponse matches the provisioning
   code configured on the DHCP server.

## 8.3 DHCP Discovery - FQDN Leads to DNS Query

### Purpose

The purpose of this test is to ensure the EUT correctly uses DNS to retrieve additional
controller information upon receiving a FQDN of a controller.

### Functionality Tags

Conditional Mandatory (supports discovery via DHCP Options)

### Test Setup

1. Ensure the EUT is configured to request controller information via DHCP.
2. Ensure the EUT is configured to acquire an address via DHCP.

### Test Procedure

1. Configure the DHCP server to provide a controller URL with a FQDN.
2. Reboot the EUT.
3. Wait for the EUT to request an address.
4. Wait for the EUT to query the DNS with the FQDN.
5. Wait for the EUT to connect to the controller.

### Test Metrics

1. After the EUT receives a FQDN in the DHCP Offer, the EUT uses
   DNS to retrieve additional information about the controller.

## 8.4 mDNS

### Purpose

The purpose of this test is to ensure the EUT correctly implements
mDNS.

### Functionality Tags

Conditional Mandatory (supports discovery via mDNS, supports the Reboot:1 profile)

### Test Setup

1. Ensure the EUT has mDNS enabled.
2. Ensure the controller exists on the same network as the EUT.
3. Ensure that the EUT has the Controller's URL, which contains ".local." is
preconfigured on the EUT.
4. Ensure that a Subscription exists for the Boot! event on the EUT with the
test Controller as the Recipient.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to send a mDNS request for the FQDN.
3. Allow the controller to respond to the mDNS request.

### Test Metrics

1. After the EUT receives a FQDN via DHCP containing ".local."
   the EUT uses mDNS to resolve it.

## 8.5 mDNS and Message Transfer Protocols

### Purpose

The purpose of this test is to ensure the EUT correctly advertises
the MTP it supports.

### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

### Test Setup

1. Ensure the EUT has mDNS enabled.
2. Ensure the Controller exists on the same network as the EUT.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to acquire an address.
3. Wait for the EUT to send an unsolicited mDNS response.

### Test Metrics

1. The EUT sends an unsolicited multicast DNS response containing correct SRV and TXT records that convey the DNS-SD Service Instance Name for each supported MTP.

## 8.6 DNS - DNS Record Requirements

### Purpose

The purpose of this test is to ensure the EUT provides valid DNS-SD records.

### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

### Test Setup

1. Ensure mDNS is enabled on the EUT.

### Test Procedure

1. Reboot the EUT.
2. Wait for the EUT to acquire a new address.
3. Wait for to the EUT to send a multicast mDNS advertisement.

### Test Metrics

1. The EUT sends a multicast mDNS advertisement containing a TXT record
   for every supported MTP.
2. Every TXT record in the mDNS advertisement has a "path" and "name" attribute.

## 8.7 mDNS request response

### Purpose

The purpose of this test is to ensure the EUT will respond to mDNS requests.

### Functionality Tags

Conditional Mandatory (supports discovery via mDNS)

### Test Setup

1. Ensure that the EUT is configured to listen for mDNS requests.

### Test Procedure

1. Reboot the EUT.
2. Send an mDNS query to the multicast domain that includes the EUT.
3. Wait for an mDNS response from the EUT.

### Test Metrics

1. The EUT responds to the mDNS query with the proper information.
