FROM killuavx/hubot-base
MAINTAINER Ranger.Huang <killua.vx@gmail.com>
ENV REFRESH_AT 2016-09-01

RUN git clone git@github.com:KasperDeng/Hubot-WeChat.git && \
       cd Hubot-WeChat && npm install && cd .. && rm -rf Hubot-WeChat
# RUN npm install hubot-weixin

#https://github.com/KasperDeng/Hubot-WeChat
#https://www.npmjs.com/package/hubot-weixin
ENV EXTERNAL_SCRIPTS=hubot-diagnostics,hubot-help,hubot-google-images,hubot-google-translate,hubot-pugme,hubot-maps,hubot-rules,hubot-shipit

# Define environment variables.
ENV HUBOT_LOG_LEVEL debug

# Define default command.
CMD npm config set registry https://registry.npm.taobao.org && \
        node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
        npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
        bin/hubot -n $BOT_NAME -a weixin
