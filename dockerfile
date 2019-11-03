FROM ubuntu
RUN apt-get update 
RUN apt-get install -y git python-minimal build-essential curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt -y install yarn nodejs
RUN mkdir renovate && cd renovate && git clone https://github.com/elikkatzgit/renovate.git
RUN cd /renovate/renovate && yarn install && yarn build
RUN echo $' \n\
============= Welcome to WhiteSource Renovate =============== \n\
\n\
1. Get your GitHub token access (https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)\n\
2. export the token by: EXPORT RENOVATE_TOKEN={ACCES_TOKEN}\n\
3. run the renovate on your repository by: yarn start {repository/repository_name}\n\
example: yarn start elikkatzgit/dom4j\n\
\n\
Have fun and follow the instructions on the pull requests tab in GitHub :-) ' > /etc/motd
\n\
RUN echo "cat /etc/motd" >> ~/.bashrc

