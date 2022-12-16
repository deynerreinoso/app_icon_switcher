# app_icon_switcher

Application icon switcher, only works for android

## Getting Started

Developed by:
- deynerreinoso
- jhoanse7

1. Create images with "ic_launcher_3" Name inside: "android/app/src/main/res/mipmap-" folders,
remember create a file with the same name but each size.
2. Add this after Activity tag:

<activity-alias
    android:label="Blue"
    android:icon="@mipmap/ic_launcher_3"
    android:name=".ALT"
    android:enabled="false"
    android:targetActivity=".MainActivity">
    <meta-data
        android:name="io.flutter.embedding.android.NormalTheme"
        android:resource="@style/NormalTheme"
        />

    <meta-data
        android:name="io.flutter.embedding.android.SplashScreenDrawable"
        android:resource="@drawable/launch_background"
        />

    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity-alias>

3. Use AppIconSwitcher.updateIcon('ALT'); to change default Icon
4. "android:label" is the new Aplication Name
5. Use AppIconSwitcher.resetIcon(); to return default Icon