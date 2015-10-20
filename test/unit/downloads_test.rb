require 'test_helper'

class DownloadsTest < ActiveSupport::TestCase
  test '::generate, given a ProtectedArea, calls all the generators' do
    pa = FactoryGirl.build(:protected_area)

    Downloads.stubs(:create_zip)

    FileUtils.stubs(:rm)
    File.stubs(:exists?).returns(true, false)
    Downloads::Generators::SuitabilityChanges.expects(:generate).with(pa)
    Downloads::Generators::Turnovers.expects(:generate).with(pa)
    Downloads::Generators::Vulnerability.expects(:generate).with(pa)
    Downloads::Generators::ProtectedAreaInfo.expects(:generate).with(pa)

    Downloads.generate(pa)
  end
end
