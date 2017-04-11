class Post < ActiveRecord::Base
	belongs_to :category
	has_many :coments, dependent: :destroy

	include PgSearch
	pg_search_scope :search_everywhere, against: [:title, :body]
end
