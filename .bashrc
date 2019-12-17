#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH=~/bin:./bin:$PATH
export PATH=~/.rbenv/bin:$PATH

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm use v10.5.0


. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# export ANDROID_HOME=/opt/android-sdk
export ANDROID_HOME=/home/greg/Android/Sdk
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# export PATH=$JAVA_HOME/bin:$PATH

# export JAVA_HOME=/opt/android-studio/jre
# export PATH=$ANDROID_HOME/bin:$JAVA_HOME/bin:$PATH
# export GRADLE_HOME=/opt/android-studio/gradle/gradle-4.1
# export PATH=$GRADLE_HOME/bin:$PATH

complete -C /usr/bin/vault vault

# eval $(minishift oc-env)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/greg/SOFTS/google-cloud-sdk/path.bash.inc' ]; then source '/home/greg/SOFTS/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/greg/SOFTS/google-cloud-sdk/completion.bash.inc' ]; then source '/home/greg/SOFTS/google-cloud-sdk/completion.bash.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS=/home/greg/.config/gcloud/terraform.json
# export GOOGLE_PROJECT=$(gcloud config get-value project)

export VAULT_ADDR=http://127.0.0.1:8200

complete -C /usr/bin/nomad nomad

. ~/.bitbucket_ssh_key

# export SECRET_KEY_BASE='82e2de84d0e859ef9a19ce55c8b639738767b8f47819b40c970b0b1ab62099d8e8e05f82bb5d13233944a58c589fbdfada726d350011543c8398494572f5a0da'

export NOMAD_ADDR=http://localhost:4646

. "/home/greg/.acme.sh/acme.sh.env"

export STAGING_CREDS=/home/greg/devops/infra-staging/10-build-image/key_staging.json
# ## staging
# cloud_pid=$(ps aux | grep  cloud | grep [s]taging)
# if [ "x$cloud_pid" = "x" ]
# then
#     STAGING_CREDS=/home/greg/devops/infra-staging/10-build-image/key_staging.json

# fi

# ## prod
# cloud_pid=$(ps aux | grep  cloud | grep [p]rod)
# if [ "x$cloud_pid" = "x" ]
# then
#     PROD_CREDS=/home/greg/devops/infra-prod/courseur-prod.json
#     ~/bin/cloud_sql_proxy -credential_file=$PROD_CREDS -dir=/cloudsql-prod -instances=courseur-prod:europe-west2:prod-mysql &
# fi

## Anaconda
# source /opt/anaconda/bin/activate root
# source /opt/anaconda/bin/deactivate root


export GITLAB_TOKEN=""
. ~/.aliases

unset RBENV_VERSION
