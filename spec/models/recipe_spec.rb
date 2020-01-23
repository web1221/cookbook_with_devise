require 'rails_helper'


describe Recipe do
  it { should belong_to(:rating) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :ingredients }
  it { should validate_presence_of :instructions }
end
