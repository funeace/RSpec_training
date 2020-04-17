# これらは全て同じ！
# 自然な英文を作るために3つにわかれているらしい。
# とりあえずitだけをつかう
RSpec.describe '四則演算' do
  it '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
  specify '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end

  example '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
end
