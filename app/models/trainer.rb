# frozen_string_literal: true

class Trainer < ApplicationRecord
  include FindByCapitalCase
  # scope :find_by_cc, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  has_many :pets, dependent: :nullify
  accepts_nested_attributes_for :pets
end
