require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'
    it "全ての項目に値が入力されている場合、登録できる。" do
      expect(@user).to be_valid
    end
  end
  
  describe 'ユーザー新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it '氏名（姓）が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end

    it '氏名（名）が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it '氏名（フリガナ・姓）が空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
    end
    
    it '氏名（フリガナ・名）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    it 'パスワード（確認含む）が6文字以下だと保存できない' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワード（確認含む）が半角英数字でないと保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
      end

    it 'パスワードが英字のみでは登録できない' do
      @user.password = 'yyyyy'
      @user.password_confirmation = 'yyyyy'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない 'do
      @user.family_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end


  end
end




