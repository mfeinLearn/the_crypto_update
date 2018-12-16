#An envirnment like file - a single file or anything that
#  I am loading can requrie and this file requires all of my other dependencies

require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "./the_crypto_update/version"
require_relative './the_crypto_update/cli'
require_relative './the_crypto_update/coin'
