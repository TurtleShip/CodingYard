require 'rails_helper'

RSpec.describe CodeforcesRoundSolution, type: :model do

  before(:each) do
    user = create(:user)
    cpp = create(:cpp)
    @solution = build(:codeforces_round_solution, user: user, language: cpp)
  end

  it 'has a valid factory' do
    expect(@solution).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:contest) }
  it { should belong_to(:language) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:contest_id) }
  it { should validate_presence_of(:language_id) }

  it { should validate_presence_of(:round_number) }
  it { should validate_numericality_of(:round_number).is_greater_than(0) }

  it { should validate_presence_of(:division_number) }
  it { should validate_inclusion_of(:division_number).in_range(1..2) }

  it { should validate_presence_of(:level) }
  it { should validate_inclusion_of(:level).in_array(%w(A B C D E)) }

  it { should_not validate_presence_of(:original_link) }
  it { should validate_length_of(:original_link).is_at_most(255) }

end
