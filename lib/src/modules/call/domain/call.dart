class Call {
  String callerId;
  String callerName;
  String callerPic;
  String receiverPic;
  String receiverId;
  String receiverName;
  String channelId;
  bool hasDialled;
  String isCall;

  Call({
    this.callerId,
    this.callerName,
    this.callerPic,
    this.channelId,
    this.hasDialled,
    this.isCall,
    this.receiverId,
    this.receiverName,
    this.receiverPic,
  });

  Map<String, dynamic> toMap(Call call) {
    var callMap = <String, dynamic>{};
    callMap["caller_id"] = call.callerId;
    callMap["caller_name"] = call.callerName;
    callMap["caller_pic"] = call.callerPic;
    callMap["receiver_id"] = call.receiverId;
    callMap["receiver_name"] = call.receiverName;
    callMap["receiver_pic"] = call.receiverPic;
    callMap["channel_id"] = call.channelId;
    callMap["has_dialled"] = call.hasDialled;
    callMap["is_Call"] = call.isCall;
    return callMap;
  }

  Call.fromMap(Map<String, dynamic> callMap) {
    callerId = callMap["caller_id"];
    callerName = callMap["caller_name"];
    callerPic = callMap["caller_pic"];
    receiverId = callMap["receiver_id"];
    receiverName = callMap["receiver_name"];
    receiverPic = callMap["receiver_pic"];
    channelId = callMap["channel_id"];
    hasDialled = callMap["has_dialled"];
    isCall = callMap["is_Call"];
  }
}
