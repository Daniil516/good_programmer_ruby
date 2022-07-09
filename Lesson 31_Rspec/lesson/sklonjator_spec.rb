require "rspec"


# подключаем склонятор
require_relative 'sklonjator'

# так в RSpec начинается сценарий для конкретного класса/модуля/метода
describe Sklonjator do

  # внутри идет набор кейсов внутри it '...' do ... end
  # каждый такой кейс выполняется rspec-ом при запуске всего сценария в случайном порядке

  it 'should do ok for KROKODILOV' do
    # ключевое слово-метод expect(...).to ...
    # ожидаем-что( нечто ).to - будет чем-то, например "eq" значит равно
    # обо всех возможностях RSpec см. документацию и материалы к уроку
    expect(Sklonjator.sklonenie(0, 'krokodil', 'krokodila', 'krokodilov')).to eq 'krokodilov'
    expect(Sklonjator.sklonenie(5, 'krokodil', 'krokodila', 'krokodilov')).to eq 'krokodilov'
    expect(Sklonjator.sklonenie(6, 'krokodil', 'krokodila', 'krokodilov')).to eq 'krokodilov'
  end

  # простые случаи для КРОКОДИЛ
  it 'should do ok for KROKODIL ' do
    [1, 21, 31].each do |i|
      expect("#{i} #{Sklonjator.sklonenie(i, 'krokodil', 'krokodila', 'krokodilov')}").to eq "#{i} krokodil"
    end
  end

  # простые случаи для КРОКОДИЛА
  it 'should do ok for KROKODILA ' do
    [2, 3, 4, 22, 33].each do |i|
      expect("#{i} #{Sklonjator.sklonenie(i, 'krokodil', 'krokodila', 'krokodilov')}").to eq "#{i} krokodila"
    end
  end
end