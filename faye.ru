require 'faye'

faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)
run faye_server

# rackup faye.ru -s thin -E production