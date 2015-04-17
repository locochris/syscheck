syscheck [![Build Status](https://travis-ci.org/locochris/syscheck.png)](https://travis-ci.org/locochris/syscheck)
----
Check your system status (built on top of [shpec](http://github.com/shpec/shpec))


## Installation
```bash
sudo sh -c "`curl --silent --location https://raw.githubusercontent.com/locochris/syscheck/master/install.sh`"
```


## Usage
Run default syschecks

```bash
MIN_MEMORY_FREE=5 MIN_DISK_FREE=5 syscheck
```

Or, place in a wrapper script (eg. `our-syscheck`) like so:

```bash
#!/usr/bin/env syscheck

# Then run our own system specific checks
describe 'unicorn'
  its_process_count 'unicorn_rails master' ${UNICORN_MASTER_PROCESS_COUNT:-2}
  its_process_count 'unicorn_rails worker' ${UNICORN_WORKER_PROCESS_COUNT:-8}
end
```

Which can then be run with:

`UNICORN_MASTER_PROCESS_COUNT=1 UNICORN_WORKER_PROCESS_COUNT=4 our-syscheck`

To produce output like:

![](https://github.com/locochris/syscheck/wiki/our-syscheck-screenshot.png)

Note the layers of information, nice clear green/red test results showing an overview, but intermingled with the actual raw command output used to make those assertions.

eg.
 - [x] *20% memory free* - but how much was it anyway, and have we used any swap?
 - [ ] *50% disk free* - _fail_; but we've still got a bit to go.
 - [x] *low load* - but OMG we never thought to write a test to check our uptime - why hasn't this server been rebooted to apply security patches to the kernel in the last 2 years?
 - [x] *4 unicorn workers* - but why is the start time on them so recent, has something restarted them that we don't know about?  They should have been up for a week now - that looks wierd.

The philosophy here is automate and test as much as we can, with an easy to read overview, but don't throw away lots of valuable information from these commands in favour of a simple green dot that could be hiding some potential problem.  And best of all when we run the same tests against multiple servers and multiple environments we can pick up on small differences between them.

Perhaps you might be trying to bring a Disaster Recovery box online and you want two machines to be identical, if you run a custom syscheck on both of them you might notice one server is running unicorns as the `"rails"` user and another as `"root"` or perhaps, even without you understanding what it means, you might notice one server (that you thought was configured to be a production server) differs from another production server because one passes a `"-E uat"` flag to the unicorn worker while the other passes `"-E production"` and decide its worth investigating further.  ie. you notice some subtle little difference you would never have thought of writing tests for, but are able to pick up an issue simply because you had that extra little bit of information in the test output.


## Alternatives
 * [serverspec](http://serverspec.org) was created a month after syscheck to fill the same hole.  It has *many* more assertions and active development, although is dependant on ruby and lacks the "extra information" in its output.  (I'm not aware of how it compares for speed, but I know syscheck is lightning fast and a joy to get instantaneous feedback from multiple servers all at once in sub-second speeds.)


## Contributing
Pull requests are always welcome.
