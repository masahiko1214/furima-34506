require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネームとメールアドレス、パスワード、確認用のパスワード、ユーザー名をフルネーム及び送り仮名、生年月日があれば登録出来る' do
        expect(@user).to be_valid
      end

      it 'パスワードは、6文字以上であれば登録出来る' do
        @user.password = 'ooo333'
        @user.password_confirmation = 'ooo333'
        expect(@user).to be_valid
      end

      it 'パスワードは半角英数字がそれぞれあれば登録出来る' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailに@が含まれていないと登録できないこと' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'm0m0m'
        @user.password_confirmation = 'm0m0m'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '000mmm'
        @user.password_confirmation = 'mmm000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'mmmmmm'
        @user.password_confirmation = 'mmmmmm'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'ユーザーの本名の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'ユーザーの本名の名前が漢字・平仮名・カタカナ以外だと登録できない' do
        @user.first_name = 'masa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'ユーザー本名の名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'ユーザーの本名の名字が漢字・平仮名・カタカナ以外だと登録できない' do
        @user.last_name = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'ユーザーの本名の名前の送り仮名が空だと登録できない' do
        @user.first_name_okurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name okurigana can't be blank"
      end

      it 'ユーザーの本名の名前の送り仮名が全角カタカナ以外だと登録できない' do
        @user.first_name_okurigana = '正彦'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name okurigana is invalid'
      end

      it 'ユーザーの本名の名字の送り仮名が空だと登録できない' do
        @user.last_name_okurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name okurigana can't be blank"
      end

      it 'ユーザーの本名の名字の送り仮名が全角カタカナ以外だと登録できない' do
        @user.last_name_okurigana = '高村'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name okurigana is invalid'
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
