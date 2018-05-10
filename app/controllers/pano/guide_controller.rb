module Pano
  class GuideController < ApplicationController
    def index
      # Home
    end

    def css
      # CSS
    end

    def js
      # Javascript
    end

    def helpers
      # Rails Helpers
    end

    def datepicker
      @test_filter = Mocks::Seive.new
    end
  end
end
