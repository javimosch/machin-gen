#!/bin/sh
machin encode gen.src > gen.mfl
machin build gen.mfl -o gen
echo "built gen ($(ls -lh $dir | awk '{print $5}'))"
