######################## working
# Use the latest Cirrus CI Flutter image from GitHub Container Registry
FROM ghcr.io/cirruslabs/flutter:stable
# FROM ghcr.io/cirruslabs/flutter:3.24.3

# Set environment variables
ENV FLUTTER_HOME /home/flutter
ENV PATH "$FLUTTER_HOME/bin:$PATH"

# Pre-cache Flutter dependencies, including Android-specific ones
RUN flutter precache --android --web

# Enable Flutter Web support
RUN flutter config --enable-web

# Accept Android licenses automatically
RUN yes | flutter doctor --android-licenses

# Run Flutter doctor to check the environment (optional, but useful for debugging)
RUN flutter doctor