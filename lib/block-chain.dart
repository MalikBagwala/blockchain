import 'dart:convert';

import 'package:malik_blockchain/block.dart';

class BlockChain {
  List<Block> chain;
  BlockChain() {
    this.chain = [this.createGenesisBlock()];
  }

  Block createGenesisBlock() {
    return Block(
      index: 0,
      data: {"amount": 10},
      timestamp: DateTime.now(),
      previousHash: "first_block",
    );
  }

  Block get latestBlock {
    return this.chain.last;
  }

  List<Map> get toMap {
    return this.chain.map((block) {
      return block.toJson;
    }).toList();
  }

  String get toJson {
    return jsonEncode(this.chain);
  }

  void addBlock(Block block) {
    block.previousHash = this.latestBlock.hash;
    block.hash = block.getHash;
    this.chain.add(block);
  }

  bool get isChainValid {
    for (var i = 1; i < this.chain.length; i++) {
      Block currentBlock = this.chain[i];
      Block previousBlock = this.chain[i - 1];

      if (currentBlock.hash != currentBlock.getHash) {
        return false;
      }
      if (currentBlock.previousHash != previousBlock.hash) {
        return false;
      }
    }
    return true;
  }
}
