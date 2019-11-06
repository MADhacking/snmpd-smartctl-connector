#!/usr/bin/env bats

# Load bats modules
load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

CONFIG="tests/sup/snmpd-smartctl-connector"

@test "basic_loop" {
    run usr/sbin/snmpd-smartctl-connector << 'END'
ping
quit
END

    assert_success
    assert_line --index 0 "PONG"
    assert_line --index 1 "Bye"
}
