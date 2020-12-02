require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    context 'ルームが作成できる時' do
      it "nameの値が存在すれば登録できること" do
        expect(@room).to be_valid
      end
    end

    context 'ルームが作成できない時' do
      it "nameが空では登録できないこと" do
        @room.name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
