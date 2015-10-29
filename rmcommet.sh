#!/bin/bash

less vimrc_with_comment | perl -e 'while(<>){next if /^$/;print unless /^\s*"/}' >vimrc
less vimrc.bundles_with_comment | perl -e 'while(<>){next if /^$/;print unless /^\s*"/}' >vimrc.bundles
