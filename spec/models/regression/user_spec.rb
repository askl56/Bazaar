require 'rails_helper'

RSpec.describe User, regressor: true do
  # === Relations ===

  it { is_expected.to have_many :products }
  it { is_expected.to have_many :orders }

  # === Nested Attributes ===

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :reset_password_token }
  it { is_expected.to have_db_column :reset_password_sent_at }
  it { is_expected.to have_db_column :remember_created_at }
  it { is_expected.to have_db_column :sign_in_count }
  it { is_expected.to have_db_column :current_sign_in_at }
  it { is_expected.to have_db_column :last_sign_in_at }
  it { is_expected.to have_db_column :current_sign_in_ip }
  it { is_expected.to have_db_column :last_sign_in_ip }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :auth_token }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ['auth_token'] }
  it { is_expected.to have_db_index ['reset_password_token'] }
  it { is_expected.to have_db_index ['email'] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(FFaker::Lorem.characters(8)).for :password }
  it { is_expected.not_to allow_value(FFaker::Lorem.characters(7)).for :password }
  it { is_expected.to allow_value(FFaker::Lorem.characters(128)).for :password }
  it { is_expected.not_to allow_value(FFaker::Lorem.characters(129)).for :password }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  # === Validations (Numericality) ===

  # === Enums ===
end
