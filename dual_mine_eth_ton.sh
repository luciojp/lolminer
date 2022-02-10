#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

ETHPOOL=eth-br.flexpool.io:4444
ETHWALLET=0x43e89831fe2b964e9c18e43668d55bfcda532aea
ETHWORKER=lolMinerWorker

TONPOOL=https://server1.whalestonpool.com
TONWALLET=EQAwWxR2bt8H_f-0xvvXIZR8bbw1QbhLOgv4ICmeYi-GIBGf

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
done
    
    
