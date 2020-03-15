import "package:crypto/crypto.dart";
import "dart:convert";

class Block {
  int index;
  DateTime timestamp;
  Map<String, dynamic> data;
  String previousHash;
  String hash;
  Block({this.index, this.timestamp, this.data, this.previousHash = ""}) {
    this.hash = this.getHash;
  }

  String get getHash {
    List<int> data = utf8.encode(
      this.index.toString() +
          this.timestamp.toIso8601String() +
          this.previousHash +
          json.encode(this.data),
    );
    return sha256.convert(data).toString();
  }

  Map get toJson {
    return {
      "index": this.index,
      "timestamp": this.timestamp.toIso8601String(),
      "previousHash": this.previousHash,
      "hash": this.hash,
      "data": this.data
    };
  }
}
