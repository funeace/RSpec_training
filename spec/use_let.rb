require_relative '../lib/test'

RSpec.describe User do
  describe '#greet' do
    # ここでほとんどの処理を共通化
    let(:user) {User.new(params)}
    # ageは以下で直接入れる
    let(:params){{name:'たろう',age: age}}
    context '12歳以下の場合' do
      let(:age){12}
      it 'ひらがなで答えること'
        expect(user.greet).to eq 'ぼくはたろうだよ。'
      end
    end
    context '13歳以上の場合' do
      let(:age){13}
      it '感じで答えること'
        expect(user.greet).to eq '僕はたろうだよ。'
      end
    end
  end
end