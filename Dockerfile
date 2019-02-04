FROM ubuntu:18.04

LABEL maintainer="ojordann"

# Variables
ENV ANDROID_HOME="/usr/lib/Android/sdk"
ENV PATH="${ANDROID_HOME}/tools/bin:/usr/lib/flutter/bin:${PATH}"
ARG BRANCH

# Install Utilities
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apt-utils curl unzip xz-utils lib32stdc++6 git

# Get Java 8
RUN apt-get install -y openjdk-8-jdk

# Get Android SDK Tools
RUN curl -O https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && mkdir -p "${ANDROID_HOME}" \
    && unzip sdk-tools-linux-4333796.zip -d "${ANDROID_HOME}" \
    && rm sdk-tools-linux-4333796.zip

# Get Android Build Dependencies
RUN yes | sdkmanager --licenses \
    && sdkmanager "build-tools;28.0.3" "platform-tools" "platforms;android-28"

# Get Flutter
RUN git clone -b ${BRANCH} https://github.com/flutter/flutter.git /usr/lib/flutter

# Configure Flutter
RUN flutter config --no-analytics \
    && flutter doctor

WORKDIR /home