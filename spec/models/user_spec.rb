require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@を含まない場合保存できないこと' do
      @user.email = "abc@co.jp"
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it '重複したemailの場合保存できないこと' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password can't be blank", "Password is too short (minimum is 6 characters)", "Password is invalid", "Password confirmation doesn't match Password"
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = "aaaaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = "yamanouchi"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "atsuro"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it 'last_name_kanaが全角カタカナでないと保存できないこと' do
      @user.last_name_kana = "yamanouchi山之内やまのうち"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'first_name_kanaが全角カタカナでないと保存できないこと' do
      @user.first_name_kana = "yamanouchi山之内やまのうち"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end