import 'package:malik_blockchain/block-chain.dart';
import 'package:malik_blockchain/block.dart';

main(List<String> args) {
  BlockChain malikCoin = BlockChain();
  malikCoin.addBlock(
    Block(
      timestamp: DateTime.now(),
      index: 1,
      data: {"amount": 1284},
    ),
  );
  malikCoin.addBlock(
    Block(
      timestamp: DateTime.now(),
      index: 2,
      data: {"amount": 1879},
    ),
  );

  print("is Chain Valid ${malikCoin.isChainValid}");

  malikCoin.chain[1].data = {"amount": 99121};

  print("is Chain Valid ${malikCoin.isChainValid}");
}
