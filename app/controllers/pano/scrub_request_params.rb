require 'action_dispatch'
require 'logger'

module Pano
  class ScrubRequestParams
    DEFAULT_CONTENT_TYPE = 'text/html'
    DEFAULT_CHARSET      = ActionDispatch::Response.default_charset

    attr_reader :logger
    def initialize(app, stdout = STDOUT)
      @app = app
      @logger = defined?(Rails.logger) ? Rails.logger : Logger.new(stdout)
    end

    def call(env)
      # calling env.dup here prevents bad things from happening
      request = ActionDispatch::Request.new env.dup
      # calling request.params is sufficient to trigger the error
      # see https://github.com/rack/rack/issues/673
      request.params
      @app.call(env)
    rescue ActionController::BadRequest => e
      raise e unless e.message =~ /invalid byte sequence in UTF-8/
      logger.info "BAD REQUEST: Returning 400 due to #{e.message} from request with env #{request.inspect}"
      content_type = request.formats.first || DEFAULT_CONTENT_TYPE
      status = 400
      body   = 'Bad Request'
      return [
        status,
        {
           'Content-Type' => "#{content_type}; charset=#{DEFAULT_CHARSET}",
           'Content-Length' => body.bytesize.to_s
        },
        [body]
      ]
    end

  end
end
