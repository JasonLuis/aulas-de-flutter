enum ChatMessageType {sent, received}

class ChatMessage {
  final int id;
  final String name;
  final String text;
  final ChatMessageType type;


  ChatMessage({
    this.id,
    this.name,
    this.text,
    this.type = ChatMessageType.sent,
  });
    
  @override
  String toString() {
    // [_$CatToString] is generated at `cat.g.dart`,
    // and it returns likes "Cat{color: white, weight: 1.2}"
    return this.id.toString()+ "\n"+
    this.name+"\n"+
    this.text+"\n";
  }
}

