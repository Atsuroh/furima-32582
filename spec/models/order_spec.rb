require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order).to be_valid
      end
      it "buildingは空でも保存できること" do
        @order.building = nil
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では登録できないこと" do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank", "Post code Please input correctly")
      end
      it "post_codeが半角ハイフンを含んだ形式でないと保存できないこと" do
        @order.post_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code Please input correctly")
      end
      it "phone_numberにハイフンを入れたら保存できないこと" do
        @order.phone_number = "090-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number", "Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberは11桁以内であること" do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "prefecture_idが選択されていないと保存できないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空では登録できないこと" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できないこと" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できないこと" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end