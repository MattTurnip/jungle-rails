 class Admin::AuthController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_NAME"], password: ENV["BASIC_AUTH_PW"]

 end