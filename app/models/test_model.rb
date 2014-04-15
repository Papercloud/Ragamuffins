class TestModel < ActiveRecord::Base

  def default_scope
    TestModel.all
  end
end
