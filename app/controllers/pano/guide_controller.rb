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
      @test_filter = TestFilter.new
    end
  end
end
