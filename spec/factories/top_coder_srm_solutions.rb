FactoryGirl.define do

  difficulties = %w(easy medium hard)

  factory :top_coder_srm_solution do
    user
    language
    sequence(:srm_number) { |n| n }
    sequence(:division_number) { |n| (n % 2) + 1 }
    sequence(:difficulty) { |idx| difficulties[idx % 3] }

  end

end
