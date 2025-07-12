#!/bin/bash
for i in {1..5}; do
  echo "$i"
  touch "{$i}.txt"
done
