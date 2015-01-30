class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates_presence_of :name
  before_save :capitalize_name

  private

    def capitalize_name
      self.name=(name().split().map() { |word| word.capitalize() }.join(" "))
    end
end
