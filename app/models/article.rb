class Article < ApplicationRecord
    has_many :comments
    validates :title, presence: true,
                    length: { minimum: 5 }


#def self.search(search)
    #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    #articles.all(:conditions=> ['title LIKE ?', "%#{search}%"])
 #   id=Article.last!
#end

end


