FactoryGirl.define do
  factory :book do
    title {Faker::Name.title}
    publish_date {Faker::Date.backward(300)}
    author {Faker::Name.name}
    number_page {rand(100..500)}
    category {[:domestic_literature, :foreign_literature, :fiction, :romance,
      :history, :poetry, :short_stories, :marketing, :financial_currency,
      :low, :economic_investment, :famous, :computer_science,
      :information_system, :software_technology, :computer_engineering,
      :hacker, :natural_science, :social_sciences, :foreign_language,
      :manga, :arts, :negative, :mystical_science_books, :family_cookbook,
      :historical_geography, :agriculture_and_forestry, :sports_books,
      :political_books_philosophy].sample}
    sequence(:picture) {|n| "product_#{n}-142x211"}
  end
end
