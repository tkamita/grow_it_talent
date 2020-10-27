require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_applicant_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'applicant[last_name]', with: "田中"
        fill_in 'applicant[first_name]', with: "太郎"
        fill_in 'applicant[last_furigana]', with: "たなか"
        fill_in 'applicant[first_furigana]', with: "たろう"
        fill_in 'applicant[email]', with: 'test@mail.com'
        fill_in 'applicant[password]', with: 'password'
        fill_in 'applicant[password_confirmation]', with 'password'
        click_button "登録する"

        expect(current_path).to eq(user_top_path)
      end
      it '新規登録に失敗する' do
        fill_in 'applicant[last_name]', with: ''
        fill_in 'applicant[first_name]', with: ''
        fill_in 'applicant[last_furigana]', with: ''
        fill_in 'applicant[first_furigana]', with: ''
        fill_in 'applicant[email]', with: ''
        fill_in 'applicant[password]', with: ''
        fill_in 'applicant[password_confirmation]', with ''
        click_button "登録する"

        expect(page).to have_content 'error'
      end
    end
  end
end