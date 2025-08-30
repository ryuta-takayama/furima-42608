require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 
  describe 'ユーザー新規登録' do
    context '新規登録ができるとき（正常系）' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが英数混在・6文字ちょうどでも登録できる' do
        @user.password = '1a2b3c'
        @user.password_confirmation = '1a2b3c'
        expect(@user).to be_valid
      end
      it '氏名がひらがな（:hiragana_name）でも有効' do
        @user = FactoryBot.build(:user, :hiragana_name)
        expect(@user).to be_valid
      end
      it '氏名がカタカナ（:katakana_name）でも有効' do
        @user = FactoryBot.build(:user, :katakana_name)
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき（異常系）' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a2b3'
        @user.password_confirmation = '1a2b3'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ｒｔｗｑｇ１２５４'
        @user.password_confirmation = 'ｒｔｗｑｇ１２５４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end


end
