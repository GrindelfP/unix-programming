#!/bin/bash

usr="grindelf"
memreport=$(vm_stat)
cpureport=$(top -l 1 -n 0)
drivereport=$(df -h)

generalreport="Resources report:
============================
||         MEMORY         ||
============================
$memreport

============================
||           CPU          ||
============================
$cpureport

============================
||          DRIVE         ||
============================
$drivereport
"

echo $generalreport | write $usr
