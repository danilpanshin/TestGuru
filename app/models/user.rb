require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true,
             uniqueness: true, 
             :format => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  def test_passage(test)
  	test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  

end
