require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '必要事項が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'abcdefgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが英字では登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定して下さい'
      end
      it 'passwordが数字では登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定して下さい'
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'password_confirmationとpasswordの値が一致していないと登録できない' do
        @user.password_confirmation = 'a1b2c3'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'ユーザー本名（名字）が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'ユーザー本名（名前）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ユーザー本名が半角での入力だと登録できない' do
        @user.first_name = 'takuya'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角（漢字・ひらがな・カタカナ）で入力して下さい'
      end
      it 'ユーザー本名のフリガナ（名字）が空だと登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family kana can't be blank"
      end
      it 'ユーザー本名のフリガナ（名前）が空だと登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
      end
      it 'ユーザー本名のフリガナが半角での入力だと登録できない' do
        @user.first_kana = 'takuya'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First kana 全角カナで入力して下さい'
      end
      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
