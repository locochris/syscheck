syscheck [![Build Status](https://travis-ci.org/locochris/syscheck.png)](https://travis-ci.org/locochris/syscheck)
----
Check your system status (built on top of [shpec](http://github.com/shpec/shpec))

## Installation
```bash
sudo sh -c "`curl https://raw.github.com/locochris/syscheck/master/install.sh`"
```

## Usage
Run default syschecks

```bash
MIN_MEMORY_FREE=5 MIN_DISK_FREE=5 syscheck
```

Or, place in a wrapper script like so:

```bash
#!/usr/bin/env syscheck
# Override eg. syscheck's default for MIN_MEMORY_FREE
MIN_MEMORY_FREE=${MIN_MEMORY_FREE:-25}

# Only run eg. memory and load syschecks
check_system memory load

# Then run your own system specific checks
describe 'unicorn'
  its_process_count 'unicorn_rails master' ${UNICORN_MASTER_PROCESS_COUNT:-2}
  its_process_count 'unicorn_rails worker' ${UNICORN_WORKER_PROCESS_COUNT:-8}
end_describe
```

## Contributing
Pull requests are always welcome.
