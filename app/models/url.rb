
class Url < ActiveRecord::Base
  validates :original, presence: true
  validates :shortened, uniqueness: true
  validates_format_of :original, :with => /\Ahttp|https:\/\//
end
