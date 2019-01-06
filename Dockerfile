FROM ubuntu:18.04

LABEL maintainer="ojordann"

# Install utilities
RUN apt-get update && apt-get upgrade
RUN apt-get install -y apt-utils curl unzip xz-utils lib32stdc++6 git

# Get Java 8
RUN apt-get install -y openjdk-8-jdk

# Get Android SDK Tools
RUN curl -O https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && mkdir -p /usr/lib/Android/sdk \
    && unzip sdk-tools-linux-4333796.zip -d /usr/lib/Android/sdk \
    && rm sdk-tools-linux-4333796.zip

ENV ANDROID_HOME="/usr/lib/Android/sdk"

# Get Flutter
RUN curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.0.0-stable.tar.xz \
    && tar xf flutter_linux_v1.0.0-stable.tar.xz --directory=/usr/lib \
    && rm flutter_linux_v1.0.0-stable.tar.xz

ENV PATH="${ANDROID_HOME}/tools/bin:/usr/lib/flutter/bin:${PATH}"

# Get Android Build Dependencies
RUN yes | sdkmanager --licenses \
    && sdkmanager "build-tools;28.0.3" "platform-tools" "platforms;android-28"

# Test if it all worked!
RUN flutter doctor

WORKDIR /home