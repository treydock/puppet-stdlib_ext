require 'spec_helper'

describe Puppet::Parser::Functions.function(:file_join) do

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  subject do
    function_name = Puppet::Parser::Functions.function(:file_join)
    scope.method(function_name)
  end

  it 'should exist' do
    Puppet::Parser::Functions.function('file_join').should == "function_file_join"
  end

  context "On Linux Systems" do
    it 'should return a relative path' do
      subject.call([["foo","bar"]]).should == 'foo/bar'
    end

    it 'should return an absolute path' do
      subject.call([["/foo","bar"]]).should == '/foo/bar'
    end

    it 'should return an absolute path given absolute and partial elements' do
      subject.call([["/foo/bar","baz"]]).should == '/foo/bar/baz'
    end

    it 'should raise a ParseError if there is less than 1 argument' do
      expect { subject.call([]).to raise_error(Puppet::ParseError, /Takes exactly one arguments/) }
    end
    
    it 'should raise a ParseError if there is more than 1 argument' do
      expect { subject.call([[],[]]).to raise_error(Puppet::ParseError, /Takes exactly one arguments/) }
    end
    
    it 'should raise a TypeError if the argument is not an Array' do
      expect { subject.call([{}]).to raise_error(TypeError, /The argument must be an Array/) }
    end
  end
end
