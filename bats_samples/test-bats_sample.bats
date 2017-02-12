#!/usr/bin/env bats

setup() {
  rm -rf /tmp/tmp.*/
}

#teardown() {
#}

@test "shows 'hello world'" {
  run ./bats_sample.sh
  [[ ${lines[0]} = "hello world" ]]
}

@test "deleted tempolary directory at the end of process" {
  run ./bats_sample.sh
  run ls /tmp/tmp.*
  [ "$status" -ne 2 ]
  # [ "$output" = "ls: cannot access '/tmp/tmp.*': No such file or directory" ]
}

@test "shows illigal option error" {
  run ./bats_sample.sh -z
  [[ ${lines[0]} = "./bats_sample.sh: illegal option -- z" ]]
  [[ ${lines[1]} = "Usage: ./bats_sample.sh [-a] [-d dir] item ..." ]]
}

