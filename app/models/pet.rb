# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer
end
