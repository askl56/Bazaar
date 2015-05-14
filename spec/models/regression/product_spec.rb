require 'rails_helper'

RSpec.describe Product, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user}
  
  it { is_expected.to have_many :placements}
	it { is_expected.to have_many :orders}

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :title }
	it { is_expected.to have_db_column :price }
	it { is_expected.to have_db_column :published }
	it { is_expected.to have_db_column :user_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }
	it { is_expected.to have_db_column :quantity }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"]}

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :title }
	it { is_expected.to validate_presence_of :user_id }
	it { is_expected.to validate_presence_of :price }

  # === Validations (Numericality) ===
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
	it { is_expected.not_to validate_numericality_of(:price).is_greater_than_or_equal_to(-1) }

  
  # === Enums ===
  
  
end