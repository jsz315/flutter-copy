package com.example.demo7


import android.content.ClipboardManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.annotation.NonNull;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        FlutterEvents.start(this);
    }
}

//    final ClipboardManager clipboardManager = (ClipboardManager)this.getSystemService(Context.CLIPBOARD_SERVICE);
//    onPrimaryClipChangedListener = new ClipboardManager.OnPrimaryClipChangedListener() {
//      @Override
//      public void onPrimaryClipChanged() {
//        if(clipboardManager.hasPrimaryClip() && clipboardManager.getPrimaryClip().getItemCount() > 0){
//          Toast.makeText(getApplicationContext(), clipboardManager.getPrimaryClip().getItemAt(0).getText(),Toast.LENGTH_LONG).show();
//        }
//      }
//    };
//    clipboardManager.addPrimaryClipChangedListener(onPrimaryClipChangedListener);