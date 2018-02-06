class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true

  def test_passage(test)
  	test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false	
  end

  private

  def digest(string)
  	Digest::SHA1.hexdigest(string)
  end
end
