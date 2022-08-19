require_relative '../classes/label'

describe Label do
  it 'should give 2 arguments Title, and Color' do
    label = Label.new('New label', 'Red')

    expect(label).to be_instance_of(Label)
  end

  it 'should return the title for the label' do
    label = Label.new('New label', 'Red')
    expect(label.title).to eq 'New label'
  end

  it 'should return the color for the  label' do
    label = Label.new('new label', 'Red')
    expect(label.color).to eq 'Red'
  end

  it 'should check if the label contains the item' do
    label = Label.new('new label', 'red')

    label.add_item(@items)
    expect(label.items).to include(@items)
  end
end
