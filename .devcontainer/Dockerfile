FROM ghcr.io/cirruslabs/flutter:3.24.3

ENV FLUTTER_HOME /home/flutter
ENV PATH "$FLUTTER_HOME/bin:$PATH"

RUN flutter precache --android --web

RUN flutter config --enable-web

RUN yes | flutter doctor --android-licenses

RUN flutter doctor