#!/usr/bin/env bats

# setup() {
#}

#teardown() {
#}

@test "shows 'hello world'" {
  run ./bats_sample.sh
  [[ ${lines[0]} = "hello world" ]]
}
