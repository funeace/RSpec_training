require_relative '../lib/test'

# 注意：無理にletやsubjectを多用しない
# DRYなコードを目指しすぎると、帰って読み辛くなる恐れがある

RSpec.describe User do
  describe '#greet' do
    let(:user) { User.new(name: 'たろう',age: age) }
    # 判定を共通化（主語を作成している)
    subject { user.greet }
    context '12歳以下の場合' do
      let(:age) { 12 }
      it 'ひらがなで答えること' do
        # is_expectedでsubjectを呼び出している
        is_expected.to eq 'ぼくはたろうだよ。'
      end
    end
    context '13歳以上の場合' do
      let(:age){13}
      it '漢字で答えること' do
        is_expected.to eq '僕はたろうです。'
      end
    end
  end
end
