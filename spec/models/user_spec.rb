require 'rails_helper'

RSpec.describe User do

  it 'permits valid email' do
    user = User.new email: 'user@example.com'
    expect(user).to be_valid
  end

  it 'prevents email with double periods' do
    user = User.new email: 'user@example..com'
    expect(user).not_to be_valid
  end

  it 'allows email with long TLDs' do
    user = User.new email: 'user@example.construction'
    expect(user).to be_valid
  end

end