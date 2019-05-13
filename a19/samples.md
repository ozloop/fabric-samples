

[文档](https://hyperledger-fabric.readthedocs.io)
[samples]()

1. long-term support version
2. raft ordering service
3. 服务型，可操作性
    动态设置log
    health
    metrics
4. 私有数据区


## fabric raft

1. 启动命令

         ./byfn.sh up -o etcdraft

2. 分析

COMPOSE_FILE_RAFT2=docker-compose-etcdraft2.yaml
添加该文件后，启动etcdraft

crypto-config没有改动

#额外启动orderer文件
function networkUp() {
  elif [ "${CONSENSUS_TYPE}" == "etcdraft" ]; then
    COMPOSE_FILES="${COMPOSE_FILES} -f ${COMPOSE_FILE_RAFT2}"

#生成区块文件的时候进行说明
function generateChannelArtifacts() {
    添加了如下内容
    elif [ "$CONSENSUS_TYPE" == "etcdraft" ]; then
        configtxgen -profile SampleMultiNodeEtcdRaft -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
 
#### configtx.yaml
添加了SampleMultiNodeEtcdRaft


## 3. 流程

### 配置生成三部曲

1. generateCerts
    cryptogen generate --config=./crypto-config.yaml
    将生成的文件放到目录crypto-config中，各类组织的证书细节
    该文件没有变动
2. replacePrivateKey
   生成docker-compose-e2e.yaml
   主要是ca的私钥
3. generateChannelArtifacts
    通过configtxgen生成网络相关的文件,
    放到channel-artifacts里面
        channel.tx
        genesis.block
        Org1MSPanhors.tx
        Org2MSPanhors.tx
    配置文件 configtx.yaml有变动。变动正式下面命令行中的profile参数
    注意：这里只使用了一个kafka

`
  if [ "$CONSENSUS_TYPE" == "solo" ]; then
    configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
  elif [ "$CONSENSUS_TYPE" == "kafka" ]; then
    configtxgen -profile SampleDevModeKafka -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
  elif [ "$CONSENSUS_TYPE" == "etcdraft" ]; then
    configtxgen -profile SampleMultiNodeEtcdRaft -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
  else
`
4. 


## fabric sdk go


## 区块链测试

在localtest下进行测试

### 1. 新连码

    CC_SRC_PATH="github.com/chaincode/chaincode_example02/go/"

    添加新方法

    put(k,v)
    get(k)

### 2. 脚本调用

1. docker-compose-cli.yaml cli添加映射
   
    - .:/test

2. 本目录编写脚本  a_more_tx.sh

3. 进入cli执行

    docker exec -it cli bash
    sh -x /test/a_more_tx.sh

### 2. 持久化数据



3. 启动etcdraft模式

4. shell脚本发起交易

