class TestFilter
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates :start_on, :finish_on, presence: true

  attr_accessor :start_on, :finish_on

  def initialize
    self.start_on = nil
    self.finish_on = nil
  end

  def persisted?
    false
  end
end