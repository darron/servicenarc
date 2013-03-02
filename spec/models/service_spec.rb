require 'spec_helper'

describe "Service Model" do
  let(:service) { Service.new }
  it 'can be created' do
    service.should_not be_nil
  end
end
