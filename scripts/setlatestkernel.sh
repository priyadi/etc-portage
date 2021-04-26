#!/bin/sh

eselect kernel list |tail -1 | awk '{print $1}' | sed 's/[^0-9]//g' |xargs -n1 eselect kernel set
