require 'rails_helper'

RSpec.describe Order, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :placements }
  it { is_expected.to have_many :products }

  # === Nested Attributes ===


  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :total }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"] }

  # === Validations (Length) ===


  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :user_id }

end
