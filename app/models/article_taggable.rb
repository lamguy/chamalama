class ArticleTaggable < ActiveRecord::Base
  belongs_to :article
  belongs_to :tag
end
