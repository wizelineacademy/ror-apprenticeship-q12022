# frozen_string_literal: true

require 'active_support/concern'

module FindByCapitalCase
  extend ActiveSupport::Concern

  included do
    scope :find_by_cc, -> (attribute, value) { where("lower(#{attribute}) = ?", value.downcase).first }
  end
end
