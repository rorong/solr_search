class Post < ApplicationRecord
  # solr
  searchable do
    text :name, :body
    time :created_at
  end
end
