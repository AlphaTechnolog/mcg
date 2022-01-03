#!/bin/bash
error() {
  >&2 echo $@
  exit 1
}

check_uid() {
  if test "$EUID" -ne 0; then
    error "Before execute this script, check if you have the root permissions"
  fi
}

check_uid

if test -f /usr/bin/mcg; then
  echo "=> Already exists an installation of mcg, removing..."
  rm /usr/bin/mcg
fi

echo "Copying script..."
cp -r ./mcg /usr/bin/mcg
chmod +x /usr/bin/mcg
echo "Done!"
