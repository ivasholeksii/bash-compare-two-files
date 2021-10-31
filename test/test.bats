setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

teardown() {
    : # rm -rf /tmp/
}

@test "Should not run without files arguments" {
    run compare-files.sh
    [ "$status" -eq 99 ]
}
