package com.danyelssoft.app_icon_switcher;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** AppIconSwitcherPlugin */
public class AppIconSwitcherPlugin implements FlutterPlugin, MethodCallHandler {
  final static private String PLUGIN_TAG = "AppIconSwitcherPlugin";
  Context context;
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "app_icon_switcher");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("updateIcon")) {
      try {
        String data = call.argument("name");
        updateIcon(data);
        result.success(true);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else if(call.method.equals("resetIcon")) {
      try {
        resetIcon();
        result.success(true);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  public void updateIcon(@NonNull String name) {
    String packageName = context.getPackageName();
    String className = String.format("%s.%s", packageName, name);
    ActivityInfo[] oldName = getActivities();
    PackageManager pm = context.getPackageManager();

    pm.setComponentEnabledSetting(
            new ComponentName(packageName, className),
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
            PackageManager.DONT_KILL_APP
    );

    for(ActivityInfo activity: oldName) {
      if(!activity.name.equals(className)) {
        pm.setComponentEnabledSetting(
                new ComponentName(packageName, activity.name),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP
        );
      }
    }
  }

  public void resetIcon() {
    String packageName = context.getPackageName();
    String defaultClassName = String.format("%s.%s", packageName, "MainActivity");
    PackageManager pm = context.getPackageManager();
    String oldClassName = String.format("%s.%s", packageName, "ALT");

    pm.setComponentEnabledSetting(
            new ComponentName(packageName, defaultClassName),
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
            PackageManager.DONT_KILL_APP
    );

    pm.setComponentEnabledSetting(
            new ComponentName(packageName, oldClassName),
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
            PackageManager.DONT_KILL_APP
    );
  }

  public ActivityInfo[] getActivities() {
    ActivityInfo[] activityInfo;
    PackageManager pm = context.getPackageManager();
    String packageName = context.getPackageName();
    try {
      PackageInfo info = pm.getPackageInfo(packageName, PackageManager.GET_ACTIVITIES | PackageManager.GET_DISABLED_COMPONENTS);
      activityInfo = info.activities;
      return activityInfo;
    } catch (PackageManager.NameNotFoundException e) {
      Log.e(PLUGIN_TAG, e.toString());
    }
    return null;
  }
}
