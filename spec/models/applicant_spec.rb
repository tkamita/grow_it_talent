require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it 'is invalid without name and email' do
    applicant = Applicant.new(email: nil, last_name: nil, first_name: nil, last_furigana: nil, first_furigana: nil)
    expect(applicant.valid?).to eq(false)
  end
  it 'is invalid with a duplicate email address' do
    Applicant.create(
      last_name: "田中",
      first_name: "太郎",
      last_furigana: "タナカ",
      first_furigana: "タロウ",
      email: "test@example.com",
      password: "hogehoge"
    )
    applicant = Applicant.new(
      last_name: "田中",
      first_name: "太郎",
      last_furigana: "タナカ",
      first_furigana: "タロウ",
      email: "test@example.com",
      password: "hogehoge"
    )
    expect(applicant.valid?).to eq(false)
  end
end
