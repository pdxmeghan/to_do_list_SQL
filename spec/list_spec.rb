require 'rspec'
require 'pg'
require 'list'
require 'spec_helper'

describe List do
  it 'sets an ID when you save it' do
    list = List.new('learn SQL')
    list.save
    expect(list.id).to be_an_instance_of Fixnum
  end

  it 'can be initialized with its database ID' do
    list = List.new('Epicodus stuff', 1)
    expect(list).to be_an_instance_of List
  end

  it 'is initialized with a name' do
    list = List.new('Epicodus')
    expect(list).to be_an_instance_of List
  end

  it 'will read out the name of the list' do
    list = List.new('Epicodus')
    expect(list.name).to eq 'Epicodus'
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('Epicodus')
    list2 = List.new('Epicodus')
    expect(list1).to eq list2
  end

  it 'starts off with no lists' do
    expect(List.all).to eq []
  end

  it 'lets you save lists to the database' do
    list = List.new('learn SQL')
    list.save
    expect(List.all).to eq [list]
  end
end
