# Custom docker image that will allow us to run angular5 projects in our ci environments
FROM node:9.5.0
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo apt-get install -qq -y curl wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN sudo apt-get update 
RUN sudo apt-get install -y google-chrome-stable
RUN npm -v
# Key part of the container to run the e2e in virtual frames
RUN sudo apt-get -y install xvfb dbus-x11
# See https://github.com/angular/angular-cli/issues/7389#issuecomment-356218698
RUN sudo npm install -g @angular/cli --unsafe
RUN ng -v
