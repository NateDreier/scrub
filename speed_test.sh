#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

#TODO: average totals.

echo "Script without concurrency results:"
for _ in range{1..5}; do
  ./enumerate.py test1/
  rm -rf SCRUBBED/
  rm scrubbed.tar.gz
done

echo "Multiprocessing results:"
for _ in range{1..5}; do
  ./enumerate_multi.py test1/
  rm -rf SCRUBBED/
  rm scrubbed.tar.gz
done
