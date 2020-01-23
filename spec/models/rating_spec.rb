require 'rails_helper'

describe Rating do
  it { should have_many(:recipes) }
end
