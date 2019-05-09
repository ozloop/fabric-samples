

[文档](https://hyperledger-fabric.readthedocs.io)
[samples]()

1. long-term support version
2. raft ordering service
3. 服务型，可操作性
    动态设置log
    health
    metrics
4. 私有数据区



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
 
# configtx.yaml
添加了SampleMultiNodeEtcdRaft

