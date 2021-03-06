class Gist < ApplicationRecord
	include PgSearch
	pg_search_scope :search_by_title, :against => :title
	acts_as_taggable_on :tags

	has_many :snippets, inverse_of: :gist, dependent: :destroy
	accepts_nested_attributes_for :snippets, allow_destroy: true, reject_if: :all_blank

	has_many :comments, dependent: :destroy
	has_many :notifications
	belongs_to :user

	validates :title, presence: { message: "الرجاء إضافة عنوان للجوهر" }
	validate do
    	check_snippets_number
  	end

	SNIPPETS_COUNT_MIN = 1

	private 
	def snippets_count_valid?
		snippets.reject(&:marked_for_destruction?).count >= SNIPPETS_COUNT_MIN
	end

	def check_snippets_number
		unless snippets_count_valid?
			errors.add(:base, :snippets_too_short, count: SNIPPETS_COUNT_MIN)
		end
	end
end
