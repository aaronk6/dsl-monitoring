# Collection of DSL Monitoring Scripts

This is a collection of monitoring scripts for DSL monitoring.

* `smart4-vdsl` (tested with Speedport Smart 4 in **modem mode** and firmware versions 010139.1.0.007.0 and 010139.3.4.001.0, uses **JSON endpoint**)
* `vigor-vdsl` (tested with DrayTek Vigor165, uses **telnet**)
* `zyxel-vdsl` (tested with “Digitalisierungsbox BASIC” which is actually a Zyxel VMG8825-D70B, uses **HTML scraping**)

**Please note:** I currently only run a Speedport Smart 4. The scripts for the other routers may be outdated and I won’t be able to fix them. Feel free to contribute fixes if you own such a device.

In addition to that, there are two more scripts specifically for Deutsche Telekom:

* `telekom-datenvolumen`: Retrieves the remaining mobile data allowance from http://pass.telekom.de/.
* `telekom-verfuegbarkeit`: Checks the maximum available DSL bandwidth for a given address in Germany.

## Prerequisites

To use the scripts, make sure to install the dependencies listed in `requirements.txt`.

```
pip install -r requirements.txt
```

## Speedport Smart 4

The script was only tested with modem mode.

```
$ ./smart4-vdsl --hostname 169.254.2.1
```

Example output:

```
{"dsl_link_status": "online", "dsl_downstream": 292030, "dsl_upstream": 46720, "firmware_version": "010139.1.0.007.0"}
```

Or, if you want to feed the data into an InfluxDB:

```
$ ./smart4-vdsl --hostname 169.254.2.1 --format influxdb
```

Example output:

```
smart4_vdsl_status dsl_downstream=292030i,dsl_link_status="online",dsl_upstream=46720i,firmware_version="010139.1.0.007.0" 1681309484000000000
```
