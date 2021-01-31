require 'rails_helper'
require 'seed_technologies'

RSpec.describe SeedTechnologies do
  describe "The seed_technologies rake task" do
    it "creates new technologies" do
      SeedTechnologies.seed
      expect(Technology.all.length).to be > 0
    end

    it "sets the hierarchy number for all technologies" do
      SeedTechnologies.seed
      Technology.all.each do |t|
        expect(t.hierarchy).to be_truthy
      end
    end

    it "updates a technology if a technology already exists with the same name" do
      technology = create(:technology, name: 'TypeScript')
      SeedTechnologies.seed

      technology = Technology.find(technology.id)
      expect(technology.icon).to eq('fas fa-code')
    end
  end
end
