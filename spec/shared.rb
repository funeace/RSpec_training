require_relative '../lib/test'

RSpec.describe User do
  describe '#greet' do
    let(:user) {User.new(name: 'たろう',age: age)}
    subject { user.greet }

    # 答えを共通化できる。共通化した答えはit_behaves_like メッセージ(子供のあいさつ)で呼び出せる
    shared_examples '子供のあいさつ' do
      it{ is_expected.to eq 'ぼくはたろうだよ。'}
    end

    shared_examples '大人のあいさつ' do
      it { is_expected.to eq '僕はたろうです。'}
    end
    
    context '0歳の場合' do
      let(:age){0}
      it_behaves_like '子供のあいさつ'
    end

    context '12歳の場合' do
      let(:age){12}
      it_behaves_like '子供のあいさつ'
    end

    context '13歳の場合' do
      let(:age){13}
      it_behaves_like '大人のあいさつ'
    end

    context '26歳の場合(同級生)' do
      let(:age){26}
      it {is_expected.not_to eq '僕はけんごです。'}
    end

    context '100歳の場合' do
      let(:age){100}
      it_behaves_like '大人のあいさつ'
    end
  end
end