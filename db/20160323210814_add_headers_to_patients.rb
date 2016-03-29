class AddHeadersToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :middle_initial, :string
    add_column :patients, :nickname, :string
    add_column :patients, :suffix, :string
    add_column :patients, :marrital_status, :string
    add_column :patients, :birthday, :string
    add_column :patients, :race, :string
    add_column :patients, :language, :string
    add_column :patients, :religion, :string
    add_column :patients, :social_security_number, :integer
    add_column :patients, :medicare, :string
    add_column :patients, :medicaid, :string
    add_column :patients, :apartment_number, :integer
    add_column :patients, :phone, :integer
    add_column :patients, :task_rating, :integer
    add_column :patients, :hospital_preference, :string
    add_column :patients, :funeral_home_preference, :string
    add_column :patients, :pharmacy_preference, :string
    add_column :patients, :pharmacy_phone, :integer
    add_column :patients, :rescucitate, :string
    add_column :patients, :HCPOA, :string
    add_column :patients, :HCPOA_active, :string
    add_column :patients, :living_will, :string
    add_column :patients, :advanced_directives, :string
    add_column :patients, :allergies, :string
    add_column :patients, :last_pneumonia_shot, :datetime
    add_column :patients, :last_flu_shot, :datetime
    add_column :patients, :last_tb_shot, :datetime
    add_column :patients, :insurance_label1, :string
    add_column :patients, :insurance_vall1, :string
    add_column :patients, :insurance_label2, :string
    add_column :patients, :insurance_vall2, :string
    add_column :patients, :insurance_label3, :string
    add_column :patients, :insurance_vall3, :string
  end
end
