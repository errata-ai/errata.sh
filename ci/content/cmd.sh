#!/bin/bash
set -e

# Section 1: Vale (https://github.com/errata-ai/vale)
#
# These tests relate to our actual written content. We use Vale to check our
# spelling and, optionally, our adherence to an external style guide
# (see the `.vale.ini` file for more details).

# Install Vale using the version defined in `errata.sh`:
va="https://github.com/errata-ai/vale/releases/download/"
vb="v${VALE}/vale_${VALE}_Linux_64-bit.tar.gz"
vc=$va$vb

errata_print 'Installing & running Vale ...'

wget -O vale.tgz $vc > /dev/null 2>&1 && tar -zxvf vale.tgz > /dev/null 2>&1
./vale --config='ci/content/.vale.ini' $1

# Section 2: blocktest (https://github.com/errata-ai/blocktest)
#
# These tests ensure that all of our code examples are up-to-date and
# functional.
ba="https://github.com/errata-ai/blocktest/releases/download/"
bb="v${BLOCKTEST}/trust-v${BLOCKTEST}-x86_64-unknown-linux-gnu.tar.gz"
bc=$ba$bb

errata_print 'Installing & running blocktest ...'

wget -O bt.tgz $bc > /dev/null 2>&1 && tar -zxvf bt.tgz > /dev/null 2>&1
./blocktest $1 .md $3