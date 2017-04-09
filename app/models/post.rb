class Post < ActiveRecord::Base
	belongs_to :category

	include PgSearch
	pg_search_scope :search_everywhere, against: [:title, :body]
end
