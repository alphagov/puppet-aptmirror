require 'spec_helper'

describe 'aptmirror' do
  context 'single repository' do
    let(:params) {{
        :servers => {
          'http://archive.ubuntu.com/ubuntu' =>
          { 'precise' => ['main','restricted'] }
        }
      }}
    it { should contain_file('/etc/apt/mirror.list').
      with_content(%r{^deb http://archive.ubuntu.com/ubuntu precise main restricted$}).
      with_content(%r{^clean http://archive.ubuntu.com/ubuntu$})}
  end

  context 'multiple repos' do
    let(:params) {{
        :servers => {
          'http://ftp.uk.debian.org/debian' =>
          {'stable' => ['main','contrib']},
          'http://security.debian.org/' =>
          {'wheezy/updates' => ['main','contrib']},
        }
      }}
    it { should contain_file('/etc/apt/mirror.list').
      with_content(%r{^deb http://ftp.uk.debian.org/debian stable main contrib$}).
      with_content(%r{^deb http://security.debian.org/ wheezy/updates main contrib$}).
      with_content(%r{^clean http://ftp.uk.debian.org/debian$}).
      with_content(%r{^clean http://security.debian.org/$})}
  end

  context 'multiple distros' do
    let(:params) {{
        :servers => {
          'http://archive.ubuntu.com/ubuntu' =>
          { 'precise'         => ['main','restricted'],
            'precise-updates' => ['main','restricted']}
        }
      }}
    it { should contain_file('/etc/apt/mirror.list').
      with_content(%r{^deb http://archive.ubuntu.com/ubuntu precise main restricted$}).
      with_content(%r{^deb http://archive.ubuntu.com/ubuntu precise-updates main restricted$})}
  end

  context 'invalid input' do
    let(:params) {{
        :servers => "Not a hash",
      }}
    it { expect { should }.to raise_error(Puppet::Error, /not a Hash..*It looks to be a String/) }
  end
end
