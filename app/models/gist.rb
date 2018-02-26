class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def gist_hash
    self.gist_url.split('/')[-1]
  end

end
