require 'securerandom'
class Url < ActiveRecord::Base
  validates :original, presence: true
  validates_format_of :original, :with => /\Ahttp|https:\/\//
end
