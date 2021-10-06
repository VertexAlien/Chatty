import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const sendCallNotifications = functions.firestore.document("calls/{userId}").onCreate(async(snapshot, context)=>{

const calls = snapshot.data();

if(!calls)
return;

const { caller_name, has_dialled } = calls;

console.log( has_dialled);
console.log(caller_name);
if(!has_dialled){
 const user = (await admin.firestore().doc("users/" + calls.receiver_id).get()).data();

 if(!user){
 return;
 }
 const { pushToken } = user;
 console.log(pushToken);
 const payload: admin.messaging.MessagingPayload = {
    data: {
        click_action: "FLUTTER_NOTIFICATION_CLICK",
        sound: "default",
        isCall: calls.is_Call,
    },
 };

 const options: admin.messaging.MessagingOptions = {
       priority: "high",
     };

  return admin.messaging().sendToDevice(pushToken, payload, options).catch((e) => {
  console.log("Error Send To Device", e);
  });
}



});