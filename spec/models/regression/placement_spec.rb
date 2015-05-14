require 'rails_helper'

RSpec.describe Placement, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :order}
	it { is_expected.to belong_to :product}
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
	it { is_expected.to have_db_column :order_id }
	it { is_expected.to have_db_column :product_id }
	it { is_expected.to have_db_column :created_at }
	it { is_expected.to have_db_column :updated_at }
	it { is_expected.to have_db_column :quantity }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["product_id"]}
	it { is_expected.to have_db_index ["order_id"]}

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end