#!/bin/sh
count=1
while [ $count -lt 100 ];do
# while true;do
    k=$( cat /proc/sys/kernel/random/uuid)
    v=$( date "+%Y_%m_%d-%H:%M:%S"  )
    echo $count:$k=$v
    echo $count:$k=$v >> a.txt
    peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycc --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"Args":["put","'$k'", "'$v'"]}'
    # peer chaincode query -C mychannel -n mycc -c '{"Args":["get","'$k'"]}'
    count=$((count+1))
    sleep 1
done