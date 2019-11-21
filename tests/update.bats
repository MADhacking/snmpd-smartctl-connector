#!/usr/bin/env bats

# Load bats modules
load '/usr/lib/bats-support/load.bash'
load '/usr/lib/bats-assert/load.bash'

@test "version" {
    SMARTCTL="tests/mock/smartctl" CONFIG="tests/sup/update-smartctl-cache.cfg" run usr/sbin/update-smartctl-cache --version
    assert_success
}

@test "help" {
    SMARTCTL="tests/mock/smartctl" CONFIG="tests/sup/update-smartctl-cache.cfg" run usr/sbin/update-smartctl-cache --help
    assert_success
}

@test "update" {
    rm -rf /tmp/tests
    
    SMARTCTL="tests/mock/smartctl" CONFIG="tests/sup/update-smartctl-cache.cfg" run usr/sbin/update-smartctl-cache

    assert_success
    
    fs="sda_state sdb_state sda_info sdb_info sda_attr sdb_attr"
    for f in ${fs}; do
        run diff -u "/tmp/tests/snmpd-smartctl-connector/dev_${f}" "tests/sup/dev_${f}"
        assert_success
    done
    
    SMARTCTL="tests/mock/smartctl" CONFIG="tests/sup/update-smartctl-cache.cfg" run usr/sbin/update-smartctl-cache

    assert_success
    
    fs="sda_state sdb_state sda_info sdb_info sda_attr sdb_attr"
    for f in ${fs}; do
        run diff -u "/tmp/tests/snmpd-smartctl-connector/dev_${f}" "tests/sup/dev_${f}"
        assert_success
    done

    rm -rf /tmp/tests
}
   