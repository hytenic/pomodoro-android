#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#*****************************************************************************
#
#   Gradle start up script for UN*X
#
#*****************************************************************************

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done

APP_HOME=`dirname "$PRG"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
linux=false
case "`uname`" in
    CYGWIN*) cygwin=true ;;
    Darwin*) darwin=true ;;
    Linux) linux=true ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    [ -n "$GRADLE_HOME" ] && GRADLE_HOME=`cygpath --unix "$GRADLE_HOME"`
fi

# Attempt to find java
if [ -z "${JAVA_HOME}" ] ; then
    if ${darwin} ; then
        if [ -x '/usr/libexec/java_home' ] ; then
            JAVA_HOME=`/usr/libexec/java_home`
        elif [ -d "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home" ]; then
            JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
        fi
    else
        JAVA_PATH=`which java 2>/dev/null`
        if [ -n "$JAVA_PATH" ] ; then
            JAVA_PATH=`readlink -f "$JAVA_PATH" 2>/dev/null`
            if [ -n "$JAVA_PATH" ] ; then
                JAVA_HOME=`dirname "$JAVA_PATH" 2>/dev/null`
                JAVA_HOME=`dirname "$JAVA_HOME" 2>/dev/null`
            fi
        fi
    fi
fi
if [ -z "${JAVA_HOME}" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.\n\nPlease set the JAVA_HOME variable in your environment to match the\nlocation of your Java installation."
fi

# Set JAVA_EXE
JAVA_EXE="$JAVA_HOME/bin/java"

if [ ! -x "$JAVA_EXE" ] ; then
    die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME\n\nPlease set the JAVA_HOME variable in your environment to match the\nlocation of your Java installation."
fi

# Set APP_NAME
APP_NAME="gradlew"

# Set APP_BASE_NAME
APP_BASE_NAME=`basename "$0"`

# Set GRADLE_APP_NAME
GRADLE_APP_NAME="Gradle"

# Set GRADLE_WRAPPER_JAR
GRADLE_WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# For Cygwin, switch paths to Windows format before running java
if ${cygwin} ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    GRADLE_WRAPPER_JAR=`cygpath --path --windows "$GRADLE_WRAPPER_JAR"`
fi

# Split up the JVM_OPTS And GRADLE_OPTS values into an array, following the shell quoting and substitution rules
function splitJvmOpts() {
    JVM_OPTS=()
    for opt in $1; do
        JVM_OPTS+=("$opt")
    done
}

# Execute Gradle
exec "$JAVA_EXE" "${JVM_OPTS[@]}" -Dorg.gradle.appname="$APP_BASE_NAME" -classpath "$GRADLE_WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
