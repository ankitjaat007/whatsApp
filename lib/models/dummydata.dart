import 'package:flutter/material.dart';
import 'package:whatsapp/service/app_icons&images.dart';

class Dummydata {
  List<Map<String, dynamic>> Allchat = [
    {
      "image": "assets/images/dp1.png",
      "title": "Aron",
      "subtitle": "Lorem ipsum dolor sit",
      "time": "5:45",
      "msg": "4"
    },
    {
      "image": "assets/images/dp2.png",
      "title": "Aron",
      "subtitle": "Lorem ipsum dolor sit",
      "time": "today",
      "msg": ""
    },
  ];
// =============================
// -----------
  List<Map<String, dynamic>> AllsettingData = [
    {
      "icons": AppIcons.key,
      "title": "Account",
      "subtile": "Privacy, security, change number",
      "id": "Account"
    },
    {
      "icons": AppIcons.chat,
      "title": "Chats",
      "subtile": "Theme, wallpapers, chat history",
      "id": "Chats"
    },
    {
      "icons": AppIcons.notifications,
      "title": "Notifications",
      "subtile": "Message, group & call tones",
      "id": "Notifications"
    },
    {
      "icons": AppIcons.storage,
      "title": "Storage and data",
      "subtile": "Network usage, auto-download",
      "id": "Storage"
    },
    {
      "icons": AppIcons.help2,
      "title": "Help",
      "subtile": "Help centre, contact us, privacy policy",
      "id": "Help"
    },
    {"icons": AppIcons.people2_2, "title": "Invite a friend", "id": "Invite"},
  ];
  // ==========================
  // -------
  List<Map<String, dynamic>> AllAccountData = [
    {"icons": Icons.lock, "title": "Privacy", "id": "Privacy"},
    {"icons": Icons.security, "title": "Security", "id": "Security"},
    {
      "icons": Icons.verified,
      "title": "Two-step verification",
      "id": "verification"
    },
    {
      "icons": Icons.logout_outlined,
      "title": "Change number",
      "id": "Change_number"
    },
    {
      "icons": Icons.insert_drive_file_rounded,
      "title": "Request account info",
      "id": "Request"
    },
    {"icons": Icons.delete, "title": "Delete my account", "id": "Delete"},
  ];
  // ==========================
  // -------
  List<String> DeletingPoint = [
    'Delete your account from WhatsApp',
    'Erase your message history',
    'Delete you from all of your WhatsApp groups',
    'Delete your payments history and cancel any pending payments'
  ];
  List<String> Choose_theme = ['System default', 'Light', 'Dark'];
  List<String> Font_size = ['Small', 'Medium', 'Large'];
  List<String> App_Language = [
    'Phone’s language (English)',
    'english',
    'hindi',
    'japanease',
    "french",
    "russian"
  ];
  List<Map<String, dynamic>> AllChat_history = [
    {
      "icons": Icons.file_upload_outlined,
      "title": "Export chat",
      "id": "Export_chat"
    },
    {
      "icons": Icons.archive,
      "title": "Archive all chats",
      "id": "Archive_all_chats"
    },
    {
      "icons": Icons.remove_circle_outline,
      "title": "Clear all chats",
      "id": "Clear_all_chats"
    },
    {
      "icons": Icons.delete,
      "title": "Delete all chats",
      "id": "Delete_all_chats"
    },
  ];
  List<String> Clear_chat = [
    'Delete media in chats',
    'Delete starred messages'
  ];
  List<String> Vibrate = ['off', 'Default', 'Short', 'Long'];
  List<String> Light = [
    'None',
    'White',
    'Red',
    'Yellow',
    'Green',
    'Cyan',
    'Blue',
    'Purple'
  ];
  List<String> Media_auto_download = ['Photos', 'Audio', 'Videos', 'Documents'];
  List<String> Uplode_quality = [
    'Auto (recommended)',
    'Best quality',
    'Data saver'
  ];
  List<Map<String, dynamic>> Manage_storage_chat = [
    {"dp": AppImages.profileDp1, 'name': '+91 9876543210', 'stroag': '658'},
    {"dp": AppImages.profileDp2, 'name': 'Abramo', 'stroag': '234'},
    {"dp": AppImages.profileDp3, 'name': 'Addyson', 'stroag': '45'},
    {"dp": AppImages.profileDp4, 'name': 'Alcandor', 'stroag': '45'},
  ];
  List<Map<String, dynamic>> Network_useage_detals = [
    {
      "icon": Icons.call,
      'title': 'chat',
      'send': '658 KB',
      'received': '658 MB',
      'fill_stroge': 0.1,
      "msg_1": "11 outgoing ",
      "msg_2": "8 incoming ",
    },
    {
      "icon": Icons.photo_library,
      'title': 'Media',
      'send': '744 KB',
      'received': '29.6 MB',
      'fill_stroge': 0.4,
      "msg_1": "",
      "msg_2": "",
    },
    {
      "icon": Icons.add_to_drive_sharp,
      'title': 'Google Drive',
      'send': '0 KB',
      'received': '0 KB',
      'fill_stroge': 0.0,
      "msg_1": "",
      "msg_2": "",
    },
    {
      "icon": Icons.message,
      'title': 'Messages',
      'send': '4.4 MB',
      'received': '7.9 MB',
      'fill_stroge': 0.1,
      "msg_1": "180 sent ",
      "msg_2": "399 recived",
    },
    {
      "icon": Icons.data_saver_off,
      'title': 'Status',
      'send': '0 KB',
      'received': '30.5 MB',
      'fill_stroge': 0.3,
      "msg_1": "0 sent ",
      "msg_2": "3,030 recived",
    },
    {
      "icon": Icons.language,
      'title': 'Roaming',
      'send': '0 KB',
      'received': '0 MB',
      'fill_stroge': 0.0,
      "msg_1": "",
      "msg_2": "",
    },
  ];
  List<Map<String, dynamic>> Help_data = [
    {
      'icon': Icons.help_outline_outlined,
      "title": 'Help Centre',
      'subtitle': ''
    },
    {
      'icon': Icons.person,
      "title": 'Contact us',
      'subtitle': 'Questions? Need help?'
    },
    {
      'icon': Icons.edit_document,
      'title': 'Terms and Privacy Policy',
      'subtitle': ''
    },
    {'icon': Icons.info_outline, "title": 'App info', 'subtitle': ''},
  ];
}
