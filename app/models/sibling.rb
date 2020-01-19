class Sibling < ApplicationRecord
  validates_presence_of :relationship, :year_of_admission
  has_one :application

  def as_json(options = {})
    attrs = [:id, :relationship, :year_of_admission, :reg_no]
    super options.merge(only: attrs, methods: [])
  end
end
