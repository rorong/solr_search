class Post < ApplicationRecord
  # solr
  searchable do
    text :body
    time :created_at
  end
end
