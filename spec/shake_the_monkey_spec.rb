require 'shake_the_monkey'

describe 'Shake_the_monkey' do
  let(:test_string)      { 'test 1'                          }
  let(:shake_the_monkey) { Shake_the_monkey.new(test_string) }

  it 'initialises with an array of words' do
    expect(shake_the_monkey.words).to eq(['test','1'])
  end

  it 'initialises with the amount of blank spaces' do
    expect(shake_the_monkey.blank_spaces).to eq(1)
  end

  it 'knows if the array of words contains a specific word' do
    expect(shake_the_monkey.search_for('test')).to be(true)
  end

  it 'can add the blank spaces into the array of words' do
    expect(shake_the_monkey.add_blanks(['test', '1']))
      .to eq(['test','1',' '])
  end

  it 'can split an array of words into an array of chars' do
    words_array = ['words', 'array']
    expect(shake_the_monkey.split_into_chars(words_array))
      .to eq(['w','o','r','d','s','a','r','r','a','y'])
  end

  it 'can shuffle an array of chars' do
    chars_array = ['c','h','a','r','s','a','r','r','a','y']
    allow(shake_the_monkey).to receive(:shuffle_chars).with(chars_array)
      .and_return(['h','c','a','r','s','a','r','r','a','y'])
    expect(shake_the_monkey.shuffle_chars(chars_array))
      .to eq(['h','c','a','r','s','a','r','r','a','y'])
  end

  it 'can join an array of chars into an array of string' do
    chars_array = ['h','c',' ',' ','s','a','r',' ','a','y']
    expect(shake_the_monkey.convert_to_strings(chars_array))
      .to eq(['hc', 'sar', 'ay'])
  end

  it 'can return a shuffled version of the words array' do
    allow(shake_the_monkey).to receive(:shuffle_words)
      .and_return(['t1', 'ste'])
    expect(shake_the_monkey.shuffle_words)
      .to eq(['t1', 'ste'])
  end

  it 'can remove the special chars from a string' do
    mixed_array = 'ab@/c'
    expect(shake_the_monkey.normalise(mixed_array))
      .to eq('abc')
  end

  it 'can downcase all the chars in a string' do
    mixed_case_array = 'AbcD'
    expect(shake_the_monkey.normalise(mixed_case_array))
      .to eq('abcd')
  end
end
