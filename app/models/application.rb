class Application < ApplicationRecord
  validates_presence_of :name, :sex, :name_father, :name_mother, :dob, :address, :email, :phone
  before_validation :check_and_create_associated_fields
  before_save :custom_validations
  has_one :alumni
  has_one :sibling
  attr_accessor :alumni_details, :sibling_details

  def custom_validations
    check_dob_eligibility
    check_has_alumni
    check_has_sibling
  end

  def check_and_create_associated_fields
    return self.errors.add(:base, "Application Closed, Contact the School") unless Control.started?
    create_associated_fields
  end
  def create_associated_fields
    create_alumni if self.alumni_details.present?
    create_sibling if self.sibling_details.present?
  end

  def create_sibling
    sib = Sibling.create(self.sibling_details)
    self.siblings_id = sib.id
  end

  def create_alumni
    al = Alumni.create(self.alumni_details)
    if al.errors.present?
      self.errors.add(:base, al.errors)
      return
    end
    self.alumni_id = al.id
  end

  def check_dob_eligibility
    p "age is:", age, self.dob
    self.errors.add(:base, "Date of birth range is invalid") if age > 4 || age < 3
  end

  def check_has_alumni
    self.errors.add(:base, "Alumni information is missing") if self.is_alumni && !self.alumni_id.present?
  end

  def check_has_sibling
    self.errors.add(:base, "Sibling information is missing") if self.has_siblings && !self.siblings_id.present?
  end

  def age
    ((Time.zone.now - self.dob.to_time) / 1.year.seconds).floor
  end

  def alumni_val
    Alumni.find_by({id: self.alumni_id})
  end

  def sibling_val
    Sibling.find_by({id: self.siblings_id})
  end

  def as_json(options = {})
    attrs = [:id, :name, :sex, :name_father, :name_mother, :dob, :address, :email, :phone, :alumni, :sibling, :is_alumni, :has_siblings, :created_at, :updated_at]
    methods = [:alumni_val, :sibling_val]
    super options.merge(only: attrs, methods: methods)
  end


end
