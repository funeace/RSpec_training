require_relative '../lib/test'

# 注意：無理にletやsubjectを多用しない
# DRYなコードを目指しすぎると、帰って読み辛くなる恐れがある
# letはメソッド。shared__はインスタンス変数的な役割をしているみたい
# shared_変数,include_変数 で同じものを呼ぶ形になってる
RSpec.describe User do
  let(:user){User.new(name: 'たろう',age:age)}
  shared_context '１２歳の場合' do
    let(:age) {12}
  end
  shared_context '１３歳の場合' do
    let(:age) {13}
  end

  describe '#greet' do
    subject {user.greet}
    context '12歳以下の場合' do
      include_context '１２歳の場合'
      # is_expectedはsubjectを呼び出す
      it {is_expected.to eq 'ぼくはたろうだよ。'}
    end
    context '13歳以上の場合' do
      include_context '１３歳の場合'
      it {is_expected.to eq '僕はたろうです。'}
    end
  end

  describe '#child?' do
    subject {user.child?}
    context '12歳以下の場合' do
      include_context '１２歳の場合' do
        it {is_expected.to eq true}
      end
    end
    context '13歳以上の場合' do
      include_context '１３歳の場合' do
        it {is_expected.to eq false}
      end
    end
  end
end
