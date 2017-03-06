module Pano
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
