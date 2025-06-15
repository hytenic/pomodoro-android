# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/parkseongho/Library/Android/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.kts.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If you use reflection to access classes in shrinking code...
#-keep class com.example.myClass
#-keepclassmembers class com.example.myClass {
#   <fields>;
#   <methods>;
#}

# If you use Gson...
#-keep class com.google.gson.stream.** { *; }

# If you use Glide...
#-keep public class * implements com.bumptech.glide.module.GlideModule
#-keep public class * extends com.bumptech.glide.module.AppGlideModule
#-keep public enum com.bumptech.glide.load.ImageHeaderParser$ImageType

# If you use Dagger...
#-dontwarn dagger.internal.codegen.**
#-keep class dagger.internal.codegen.** { *; }
#-keep class javax.inject.** { *; }
#-keep class **$$ModuleAdapter { *; }
#-keep class **$$InjectAdapter { *; }
#-keep class **$$StaticInjection { *; }

# If you use ButterKnife...
#-keep class butterknife.** { *; }
#-dontwarn butterknife.internal.**
#-keep class **$$ViewBinder { *; }

#-keepclasseswithmembernames class * {
#    @butterknife.* <fields>;
#}

#-keepclasseswithmembernames class * {
#    @butterknife.* <methods>;
#}
