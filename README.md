syscheck [![Build Status](https://travis-ci.org/locochris/syscheck.png)](https://travis-ci.org/locochris/syscheck)
----
Check your system status

## Installation
```bash
sh -c "`curl https://raw.github.com/locochris/syscheck/master/install.sh`"
```

## Usage
Place in a wrapper script like so:

```bash
#!/usr/bin/env syscheck
# Override eg. syscheck's default for MIN_MEMORY_FREE
MIN_MEMORY_FREE=${25:-$MIN_MEMORY_FREE}

# Only run eg. memory and load syschecks
check_system memory load

# Then run your own system specific checks
describe 'unicorn'
  its_process_count 'unicorn_rails master' ${UNICORN_MASTER_PROCESS_COUNT:=2}
  its_process_count 'unicorn_rails worker' ${UNICORN_WORKER_PROCESS_COUNT:=8}
end_describe
```

## Contributing
Pull requests are always welcome.
