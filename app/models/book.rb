class Book < ActiveRecord::Base
  belongs_to :user

  #http://railscasts.com/episodes/240-search-sort-paginate-with-ajax?autoplay=true
  attr_accessible :title, :author, :isbn, :genre, :shelf, :summary, :user_id
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end


end
