# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  age                    :integer
#  location               :string
#  hobbies                :text
#  about_me               :text
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

#require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.encrypted_password {"1234567890"}
    f.sign_in_count {1}
    f.location "90004"
    f.name "Aditya"
    f.created_at {Faker::Date.forward(23)}
    f.updated_at {Faker::Date.forward(23)}
  end


end