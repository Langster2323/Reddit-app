class Link < ApplicationRecord
  has_many :urls
  has_many :votes

  def converted_url
    "http://" + self.url
  end

  def vote_counter
    votes.count
  end
end
