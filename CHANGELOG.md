# syscheck Changelog

## 0.0.13 (Dec  3 2014)

 * Fix indentation

## 0.0.12 (Dec  3 2014)

 * Use new shpec v0.1.0 syntax

## 0.0.10 (Apr  2 2013)

 * Wind back count and timeout in still_alive assertion (and put in a retry loop)

## 0.0.9 (Mar 14 2013)

 * Increase the count and timeout in still_alive assertion

## 0.0.8 (Mar  8 2013)

 * Use shpec v0.0.9 (SHPEC_ROOT without using find)

## 0.0.7 (Mar  6 2013)

 * Bugfix for /usr/bin/env not accepting env variables

## 0.0.6 (Mar  6 2013)

 * Add centos friendly still_alive_ping command

## 0.0.5 (Mar  5 2013)

 * Add support for SYSTEM_CHECKS env variable

## 0.0.4 (Mar  5 2013)

 * Add network check using still_alive custom matcher
 * Use `bc_expr` custom matcher
 * Check shpec version when installing

## 0.0.3 (Feb 27 2013)

 * Bugfix for disk check on centos

## 0.0.2 (Feb 27 2013)

 * Need to explicitly call generic system checks
 * Add `its_process_count`
 * Remove sudo from install

## 0.0.1 (Feb 20, 2013)

 * Initial release
