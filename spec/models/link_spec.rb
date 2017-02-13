require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "valid url" do
    it { should allow_value('http://foo.com').for(:url) }
    it { should_not allow_value('foo').for(:url) }
  end
end
