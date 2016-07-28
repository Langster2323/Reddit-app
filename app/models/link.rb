class Link < ApplicationRecord
  def self.top
    joins("join votes on votes.link_id = links.id")
    .group("links.id, links.name")
    .order("count(votes.id) desc")
  end

  has_many :urls
end
