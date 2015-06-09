#!/bin/bash
pacman -Sqg base base-devel | sort -u > /tmp/essentials
pacman -Qqe > /tmp/explicit
diff -u /tmp/essentials /tmp/explicit | grep "^+" > /tmp/unknown
more /tmp/unknown
