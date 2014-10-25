# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ilnur@5.9.110.148}
role :web, %w{ilnur@5.9.110.148}
role :db,  %w{ilnur@5.9.110.148}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'ilnur@5.9.110.148', user: 'ilnur', roles: %w{web app}, my_property: :my_value

set :rails_env, 'production'
set :deploy_via, :remote_cache
set :use_sudo, false
set :deploy_to, "/home/ilnur/alonsi"
set :scm, :git
set :repository, "git@github.com:thander/alonsi.git"
set :branch, "master"
set :domain, "ilnur@5.9.110.148"
# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
