require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'バリデーションテスト' do
    let(:applicant) { build(:applicant) }
    subject { test_applicant.valid? }
    context 'last_name' do
      let(:test_applicant) { applicant }
      it '空欄でないこと' do
        test_applicant.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_name' do
      let(:test_applicant) { applicant }
      it '空欄でないこと' do
        test_applicant.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'last_furigana' do
      let(:test_applicant) { applicant }
      it '空欄でないこと' do
        test_applicant.last_furigana = ''
        is_expected.to eq false;
      end
    end
    context 'first_furigana' do
      let(:test_applicant) { applicant }
      it '空欄でないこと' do
        test_applicant.first_furigana = ''
        is_expected.to eq false;
      end
    end

    context 'emailカラム' do
      let(:test_applicant) { applicant }
      it '空欄でないこと' do
        test_applicant.email = ''
        is_expected.to eq false;
      end
      it '重複しないこと' do
        applicant1 = FactoryBot.create(:test_applicant)
        applicant2 = FactoryBot.build(:test_applicant)
        applicant2.valid?
        # expect(applicant.errors[:email]).to include("has already been taken")
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'postモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'qualificationモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:qualifications).macro).to eq :has_many
      end
    end
    context 'portfolioモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:portfolios).macro).to eq :has_many
      end
    end
    context 'offerモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:offers).macro).to eq :has_many
      end
    end
    context 'applyモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:applies).macro).to eq :has_many
      end
    end
    context 'roomモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end
    context 'roomモデルとの関係' do
      it '1:nとなっている' do
        expect(Applicant.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end
  end

end
