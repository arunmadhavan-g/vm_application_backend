class Alumni < ApplicationRecord
  validates_presence_of :relationship, :year_of_passing
  has_one :application

  def as_json(options = {})
    attrs = [:id, :relationship, :year_of_passing, :reg_no]
    super options.merge(only: attrs, methods: [])
  end
end
