require 'spec_helper'

describe 'aptmirror::install' do
  describe 'aptmirror::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_package('foo') }
  end

  describe 'aptmirror::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('foo') }
  end
end
