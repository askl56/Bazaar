require 'rails_helper'

RSpec.describe Delayed::Backend::ActiveRecord::Job, regressor: true do

  # === Relations ===
  
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :priority }
  it { is_expected.to have_db_column :attempts }
  it { is_expected.to have_db_column :handler }
  it { is_expected.to have_db_column :last_error }
  it { is_expected.to have_db_column :run_at }
  it { is_expected.to have_db_column :locked_at }
  it { is_expected.to have_db_column :failed_at }
  it { is_expected.to have_db_column :locked_by }
  it { is_expected.to have_db_column :queue }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end