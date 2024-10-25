import 'package:flutter/material.dart';
import 'package:whatsapp/models/all_models.dart';

class AllController extends ChangeNotifier {
  // =====================================================================
  // =====================================================================
  // =====================================================================
  // chat
  List<ChatData_model> _allchat = [];
  List<ChatData_model> get getallchat => _allchat;

  setallchat(List<ChatData_model> chat) {
    _allchat = chat;
    notifyListeners();
  }

// =========================================================================
// =========================================================================
// =========================================================================
// wallpaper







  List<Wallpaper_model> _allWallpaper = [];
  List<Wallpaper_model> get getallWallpaper => _allWallpaper;

  setallWallpaper(List<Wallpaper_model> wallpaper) {
    _allWallpaper = wallpaper;
    notifyListeners();


   


  
  

  
  }

}
