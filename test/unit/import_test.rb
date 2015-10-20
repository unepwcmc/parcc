require 'test_helper'

class ImportTest < ActiveSupport::TestCase
  test '::configuration returns the configuration yaml' do
    assert_not_nil Import.configuration['taxonomic_classes']
  end
end
