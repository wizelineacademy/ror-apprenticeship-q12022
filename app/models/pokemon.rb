# frozen_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, :poke_id, presence: true
  validates :poke_id, uniqueness: true
end
