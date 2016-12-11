require 'rails_helper'

RSpec.describe Skill, type: :model do
  it 'is invalid without a name' do
    expect(subject).to be_invalid
  end

  it 'is valid with a name' do
    subject.name = 'programming'
    expect(subject).to be_valid
  end

  it 'has a level that defaults to bad' do
    subject.name = 'programming'

    expect(subject.level).to eq 'bad'
  end

end
