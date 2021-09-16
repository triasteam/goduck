#!/bin/sh

methodName=$1 # Please note: methodName must be consistent with pier.toml
appchainName=$2
appchainType=$3 # Please note: appchainType must be consistent with pier.toml
appchainDesc=$4
appchainVersion=$5
appchainValidators=$6
appchainConsensus=$7
pierVersion=$8

if [ "${pierVersion}" = "v1.6.1" ] || [ "${pierVersion}" = "v1.6.2" ] || [ "${pierVersion}" = "v1.7.0" ]; then
  pier --repo /root/.pier appchain register \
    --name $appchainName \
    --type $appchainType \
    --desc $appchainDesc \
    --version $appchainVersion \
    --validators $appchainValidators \
    --consensusType $appchainConsensus
else
  pier --repo /root/.pier appchain method register \
    --admin-key /root/.pier/key.json \
    --method $methodName \
    --doc-addr /ipfs/QmQVxzUqN2Yv2UHUQXYwH8dSNkM8ReJ9qPqwJsf8zzoNUi \
    --doc-hash QmQVxzUqN2Yv2UHUQXYwH8dSNkM8ReJ9qPqwJsf8zzoNUi \
    --name $appchainName \
    --type $appchainType \
    --desc $appchainDesc \
    --version $appchainVersion \
    --validators $appchainValidators \
    --consensus $appchainConsensus
fi