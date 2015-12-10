class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum category: [:domestic_literature, :foreign_literature, :fiction, :romance,
                  :history, :poetry, :short_stories, :marketing, :financial_currency,
                  :low, :economic_investment, :famous, :computer_science,
                  :information_system, :software_technology, :computer_engineering,
                  :hacker, :natural_science, :social_sciences, :foreign_language,
                  :manga, :arts, :negative, :mystical_science_books, :family_cookbook,
                  :historical_geography, :agriculture_and_forestry, :sports_books,
                  :political_books_philosophy]
end
