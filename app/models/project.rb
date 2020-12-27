class Project < ApplicationRecord
  has_and_belongs_to_many :technologies

  def as_json(options = {})
    result = super
    result.merge(technologies: technologies)
  end
end
