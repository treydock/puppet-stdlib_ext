require 'spec_helper_acceptance'

describe 'file_join function:' do
  context 'creates valid file path' do
    it 'should run successfully' do
      pp = <<-EOS
        $tmp_file = file_join(['/tmp','foo'])
        file { $tmp_file: ensure => present }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/tmp/foo') do
      it { should be_file }
    end
  end
end
