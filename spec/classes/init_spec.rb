require 'spec_helper'

describe 'aptmirror' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "aptmirror class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('aptmirror::params') }

        it { should contain_class('aptmirror::install') }
        it { should contain_class('aptmirror::config') }
        it { should contain_class('aptmirror::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'aptmirror class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
