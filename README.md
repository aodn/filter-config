# AODN Portal filter configuration

## Licensing
This project is licensed under the terms of the GNU GPLv3 license.

## Configuration
This repository contains layer filter configuration for WMS servers defined in the AODN portal (https://github.com/aodn/aodn-portal) as the type 'GeoserverFilterConfig'. The portal expects theses WMS servers to be a standard Geoserver, but will retrieve the filter information from this repo from the test branch e.g. `filter_config_url: https://raw.githubusercontent.com/aodn/filter-config/test`.
```

    [
        uri: 'http://example.wms.server/geoserver/wms',
        wmsVersion: '1.1.1',
        type: 'GeoserverFilterConfig',
        filtersDir: "example-geoserver", 
        wpsUrl: 'http://example.wms.server/geoserver/wps'
    ],
   ```

To test filter configuration, commit to the test branch (the default) and add a filter configuration
file in the appropriate directory for your server (as advised by AODN staff).

Filter configuration for GeoServer layers are organised by workspace so, for example, the filter configuration
 for imos:argo_profile_map served by the IMOS WMS server could be found in
 imos-geoserver/imos/argo_profile_map.xml

Once changes have been tested, they can be made available for the production portal by
creating a pull request into the prod branch. Updates/changes will be automatically published to the GitHub Pages static site from this branch.

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

