# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_many :pets, dependent: :nullify
end
