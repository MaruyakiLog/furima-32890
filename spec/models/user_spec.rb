require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録ができるとき' do
      it 'Email,password,password_confirmation,nickname,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在する場合、登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      # email
      it 'emailが空の場合、登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailがDBで重複する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに「@」が含まれない場合、登録できない' do
        @user.email = @user.email.delete("@")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      # password
      it 'passwordが空の場合、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが数字のみの場合、登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみの場合、登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordに全角文字が含まれる場合、登録できない' do
        @user.password = '1a1a全角全角'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが5文字以下の場合、登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致の場合、登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a54321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      # nickname
      it 'nicknameが空の場合、登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      # last_name
      it 'last_nameが空の場合、登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに全角（漢字・ひらがな・カタカナ）以外の文字が含まれる場合、登録できない' do
        @user.last_name = 'last名字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字で設定してください")
      end
  
      # first_name
      it 'first_nameが空の場合、登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameに全角（漢字・ひらがな・カタカナ）以外の文字が含まれる場合、登録できない' do
        @user.first_name = 'first名前'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字で設定してください")
      end
      
      # last_name_kana
      it 'last_name_kanaが空の場合、登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaに全角（カタカナ）以外の文字が含まれる場合、登録できない' do
        @user.last_name_kana = 'lastミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カタカナで設定してください")
      end
      
      # first_name_kana
      it 'first_name_kanaが空の場合、登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaに全角（カタカナ）以外の文字が含まれる場合、登録できない' do
        @user.first_name_kana = 'firstミョウジ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana には全角カタカナで設定してください")
      end
  
      # birthday
      it 'birthdayが空の場合、登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
