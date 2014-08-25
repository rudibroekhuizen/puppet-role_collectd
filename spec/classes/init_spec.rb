require 'spec_helper'
describe 'role_collectd' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_collectd') }
  end
end
