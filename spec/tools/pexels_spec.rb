require 'rails_helper'
require 'pexels'

RSpec.describe Pexels do
  describe "The get_photos method" do
    it "returns a truthy response" do
      result = Pexels.get_photos(1)
      puts result
      expect(result).to be_truthy
    end
  end
end
