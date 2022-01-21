# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  # include FindByCapitalCase
  # scope :find_by_cc, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  primary_abstract_class
end
