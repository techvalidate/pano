module Mocks
  class Seive
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    validates :start_on, :finish_on, presence: true

    attr_accessor :start_on, :finish_on

    def initialize
      self.start_on = 3.days.ago
      self.finish_on = 27.days.from_now
    end

    def persisted?
      false
    end
  end
end