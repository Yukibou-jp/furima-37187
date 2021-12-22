require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録できるとき' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

     it 'nicknameの入力が必須' do
      @user.nickname = ''
      @user.valid?  
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it 'emailの入力が必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'メールアドレスに@を含まない場合は登録できない' do
       @user.email = 'test'
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end

     it 'passwordの入力が必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
    
     it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end

     it '数字のみのパスワードでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end

     it '全角文字を含むパスワードでは登録できない' do
      @user.password = '１２３４５６'
      @user.password_confirmation = '１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end

     it '姓（全角）が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
     end

     it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end

     it '名（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
     end

     it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end

     it '姓（カナ）が空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_name = 'あ一1＠'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end

     it '名（カナ）が空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name = 'あ一1＠'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end

     it '生年月日が空だと登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
     end
  
    end #pending "add some examples to (or delete) #{__FILE__}"
  end
end
