#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/Users/user/Documents/GoSourceFolder/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GOPATH="/Users/user/Documents/GoSourceFolder"
export GOBIN="$GOPATH/bin"
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/sbin
alias postgres.server="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"
#env for Vos
# paypal
export PAYPAL_CLIENT_ID=AWElgT-Rx5PsGjmDORIeAKYsAR-svcvoCGsVMW_QsqmW7qIhe2Qq599yVKU9yQoHlQrX2REuOhQvrwY8
export PAYPAL_SECRET=EMm4_pX5Fc7JR0WVzYfVx5qClopdvV9aL0408_uwwWR0qGi2FmzjOJAy0cv-NNjc8Nx5a8qtpD2rKj7E
export PAYPAL_SANDBOX=true
export PAYPAL_ENDPOINTS=sandbox

# baokim
export BAOKIM_URL=http://kiemthu.baokim.vn/payment/order/version11
export BAOKIM_MERCHANT_ID=647
export BAOKIM_SECURE_PASS=ae543c080ad91c23
export BAOKIM_RECEIVER=dev.baokim@bk.vn

# 2checkout
export TWOCHECKOUT_SELLER_ID=901287570
export TWOCHECKOUT_PUBLISHABLE_KEY=BF753ECC-A660-498B-BA19-FB7D85C74465
export TWOCHECKOUT_PRIVATE_KEY=4B69AEF2-F8D4-491C-B96B-D4C1E1A9D6F1
export TWOCHECKOUT_SANDBOX=true

#nvm setup
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/user/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"

#env for posgresql
export DB_HOST=dockerhost
export DB_USERNAME=postgres
export DB_PASSWORD=qd3sk123
export DB_NAME=crush-on
#env for plivo
export PLIVO_AUTH_ID=MAOTQWOGEXNJBLMGRJNT
export PLIVO_AUTH_TOKEN=YjNhNDk1ZjI3YmFkYjZhYTI5ZmU5NTZmZjdlNGQ
export PLIVO_BASIC_AUTH=TUFPVFFXT0dFWE5KQkxNR1JKTlQ6WWpOaE5EazFaakkzWW1Ga1lqWmhZVEk1Wm1VNU5UWm1aamRsTkdRMQ===

#env for delivr.to
export POSTGRES_HOST=dockerhost
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=qd3sk123
export POSTGRES_DB=delivr

#google app engine
export PATH=/path/to/go_appengine:$PATH
#delivr.to
# other config
export DWARVESF_SLACK_TOKEN=xoxb-7578669431-EB7PIWNVu4JqgTAcAfsmI6vp
#xoxb-17381667076-yW2ELxY303uaWxWDTAyXdx4g
#xoxp-3396216565-3396949911-15368438741-ac8b861361
export DELIVRTO_EMAIL=annie@delivr.to
export MAILGUN_DOMAIN=sandbox0a7518ed68c0497fba94ab0ca4cfa0b9.mailgun.org
export MAILGUN_PRIVATE=key-2d1d17633f3609680745186752fae727
export MANDRILL_KEY=L4YLbhyMhKzrOw5TKQHT1w
export MANDRILL_USER=hi@dwarvesf.com
export GCM_API_KEY=AIzaSyDo9QkeMBjtkschfTOFLlgvPoJi05R5wNM
export DOMAIN=http://localhost:8080
export FACEBOOK_APP_ID=889728751063209
export FACEBOOK_PAGE_ID=147981768893725
export GOOGLE_SERVER_API_KEY=AIzaSyDo9QkeMBjtkschfTOFLlgvPoJi05R5wNM
export EXCHANGE_RATES_APP_ID=f70072fca4174332b96eae6eda035f38
export STRIPE_PRIVATE_KEY=sk_test_8r1hqkGxh1EwsTvsdj7pIPpr
export STRIPE_PUBLISH_KEY=pk_test_i9dEkqjHRAaYAUBilRuHWbg0
export WAIT_DAYS=1
export CRAWL_TIME=11:13
## for admin
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=123

