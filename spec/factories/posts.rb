FactoryBot.define do
  factory :post do 
    date { Date.today }
    rationale {"First rationale"}
  end

  factory :second_post, class: "Post" do |p|
    date { Date.yesterday }
    rationale { "Second rationale" }
  end
end
