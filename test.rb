#!/usr/bin/ruby
require 'digest/md5'

# "abcdefghijklnmopqrstuvwxyz"+"ABCDEFGHIJKLNMOPQRSTUVWXYZ"+"0123456789"+",.<>/?;:[]{}\|~!@#\$%^&*()-_+="

def check_password(digest, password)
  salt = digest.slice(0,8)
  hash = salt + Digest::MD5.hexdigest(salt + password)
  hash==digest
end

puts check_password('5~JtW3b%ddcc8284b927ddfeffa8464cff8ed416', 'visavis')
