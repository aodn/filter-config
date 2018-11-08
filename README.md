# AODN Portal filter configuration

PROOF OF CONCEPT only.   Not in use

This repository contains layer filter configuration for https://portal-rc.aodn.org.au (test branch) and
https://portal.aodn.org.au (prod branch).

To test filter configuration in portal-rc, select the test branch (the default) and add a filter configuration
file in the appropriate directory for your server (as advised by AODN staff).

Filter configuration for GeoServer layers are organised by workspace so, for example, the filter configuration
 for imos:argo_profile_map served by the IMOS WMS server can be found in
 imos-geoserver/imos/argo_profile_map.xml

Note that display in portal-rc requires a valid metadata record referencing this layer to
 be configured in https://catalogue-rc.aodn.org.au and for the referenced services to be available.

Once changes have been tested in portal-rc, they can be made available for the production portal by
copying the filter configuration to the same location in the prod branch.

Example configuration file:

```
<?xml version="1.0"?>
<filters>
    <filter>
        <name>data_centre_name</name>
        <type>string</type>
        <label>Data centre name</label>
        <visualised>true</visualised>
        <excludedFromDownload>false</excludedFromDownload>
    </filter>
    <filter>
        <name>platform_number</name>
        <type>string</type>
        <label>Platform Number</label>
        <visualised>true</visualised>
        <excludedFromDownload>false</excludedFromDownload>
    </filter>
    <filter>
        <name>juld</name>
        <type>datetime</type>
        <label>Time</label>
        <visualised>true</visualised>
        <excludedFromDownload>false</excludedFromDownload>
    </filter>
    <filter>
        <name>position</name>
        <type>geometrypropertytype</type>
        <label>Bounding Box</label>
        <visualised>true</visualised>
        <excludedFromDownload>false</excludedFromDownload>
    </filter>
    <filter>
        <name>profile_processing_type</name>
        <type>string</type>
        <label>Realtime/Delayed</label>
        <visualised>true</visualised>
        <excludedFromDownload>false</excludedFromDownload>
    </filter>
</filters>
```

This configuration file configures the portal to display filters for data_centre_name, platform_number,
juld and profile_processing_type in the portal (a spatial filter is always displayed, so the position
config entry has no effect here at the moment).

Available configuration elements are as follows:

Element | Description
--- | ---
name | wms property name for which to display a filter
type | type of filter (string, datetime, geometrypropertytype, ...
label | label to be displayed for filter
visualised | whether filter applies to the map layer (true - the default) or a linked download layer only (false)
excludeFromDownload | not yet implemented

