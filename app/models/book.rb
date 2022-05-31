# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string
#  description :string
#  name        :string
#  pages       :integer
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
end
