require "rails_helper"

describe 'Sketch' do
  it 'belongs to a canvas' do
    canva = Canva.new
    sketch = Sketch.new
    canva.sketches << sketch
    expect(canva.sketches.first).to eq sketch
  end

end
