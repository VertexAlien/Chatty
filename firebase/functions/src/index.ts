import * as admin from "firebase-admin";

admin.initializeApp();

import { sendCallNotifications } from "./handle_call_notifications";
import { sendMsgNotifications } from "./handle_chat_message";
import { handleGroupMessage } from "./handle_group_message";
import { onProfileEdit } from "./handle_profile_edit";

exports.sendCallNotifications = sendCallNotifications;
exports.sendMsgNotifications = sendMsgNotifications;
exports.handleNewGroupMessage = handleGroupMessage;
exports.onProfileEdit = onProfileEdit;
