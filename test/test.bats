setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

teardown() {
    : # rm -rf /tmp/
}

@test "Should find added items and removed item in list" {
    run compare-files.sh test/resources/list1.csv test/resources/list2.csv
    assert_output --partial 'New content count:        2'
    assert_output --partial 'Removed content count:        1'
}

@test "Should find added items comparing to empty list" {
    run compare-files.sh test/resources/emptyList.csv test/resources/list2.csv
    assert_output --partial 'New content count:        4'
    assert_output --partial 'Removed content count:        0'
}

@test "Should find removed items comparing to empty list" {
    run compare-files.sh test/resources/list1.csv test/resources/emptyList.csv
    assert_output --partial 'New content count:        0'
    assert_output --partial 'Removed content count:        3'
}

@test "Should not run without files arguments" {
    run compare-files.sh
    [ "$status" -eq 99 ]
}
