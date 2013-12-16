require 'spec_helper'

describe 'aptmirror::service' do
  describe 'aptmirror::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('foo') }
  end

  describe 'aptmirror::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('foo') }
  end
end

