FROM openjdk:8
ARG FLUTTER_TAG
RUN echo $FLUTTER_TAG
RUN apt update
RUN apt install -y git curl unzip lib32stdc++6
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

#Installing Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv sdk/tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;30.0.2" "patcher;v4" "platform-tools" "platforms;android-30" "sources;android-30"
ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"

#Installing Flutter SDK
RUN git clone -b $flutter_tag https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"
RUN flutter --version

# Run basic check to download Dark SDK
RUN flutter doctor
