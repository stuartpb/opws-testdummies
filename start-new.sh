#! /usr/bin/env bash
set -eo pipefail

if [[ -z "$1" ]]; then
  echo "No domain specified" >2
  exit 1
fi

accountroot="accounts/$1"
mkdir -p "$accountroot"

fileprefix="$accountroot/$(date -I)"
extension=".md"
try=1
while [[ -f "$fileprefix$extension" ]]; do
  extension="_$((++try)).md"
done

cat << 'EOF' > "$fileprefix$extension"
---
email:
  unmasked:
  used:
# insert username etc. here
passwords: # in order of use
- a

specimens: # https://gist.github.com/
  emails:
    verification:
    password reset token:
  stubs:
    password reset request:
    password reset finish:
  forms:
    password reset change:
    password settings change:
  errors:
    nonexistent account reset request stub:
---

EOF
