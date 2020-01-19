class Control < ApplicationRecord

  def self.started?
    Control.find(1).started
  end

  def as_json(options = {})
    attrs = [:started, :updated_at]
    super options.merge(only: attrs, methods: [])
  end
end
