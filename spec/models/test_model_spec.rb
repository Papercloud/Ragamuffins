require_relative '../spec_helper'

describe TestModel do


  # I am new to Mocking. So just wanted to make sure that it worked like I expected it to.
  describe "Mocking" do
    let(:my_model) do
      mock_model TestModel, id: 1,
      name: "My Name",
      about: "About Me"
    end
    it "assigns the ID" do
      expect(my_model.id).to eq 1
    end

    it "assigns the name" do
      expect(my_model.name).to eq "My Name"
    end

    it "assigns the about" do
      expect(my_model.about).to eq "About Me"
    end
  end


  describe "Deleted IDs" do
    before :each do
      @model1 = FactoryGirl.create(:test_model)
      @model2 = FactoryGirl.create(:test_model)
    end

    context "When all the IDs are still there" do

      it "returns an empty array if all ids still exist" do
        expect(TestModel.show_deleted_ids([@model1.id])).to eq []
      end

      it "handles multiple ids in one query" do
        visible_ids = [@model1.id, @model2.id]

        expect(TestModel.show_deleted_ids(visible_ids)).to eq []
      end

      it "handles ids as strings" do
        expect(TestModel.show_deleted_ids([@model1.id.to_s])).to eq []
      end

      it "can handle an array of mixed strings and integers" do
        visible_ids = [@model1.id.to_s, @model2.id]

        expect(TestModel.show_deleted_ids(visible_ids)).to eq []
      end
    end

    context "When some ids have been deleted" do
      before :each do
        @deleted_id = @model2.id
        @model2.destroy!
      end

      it "returns the deleted id" do
        expect(TestModel.show_deleted_ids([@deleted_id])).to eq [@deleted_id]
      end

      it "Returns only the deleted ID" do
        visible_ids = [@model1.id, @deleted_id]

        expect(TestModel.show_deleted_ids(visible_ids)).to eq [@deleted_id]
      end

      it "returns a lot of IDS if needed" do
        @other_deleted_id = @model1.id
        @model1.destroy!

        visible_ids = [@deleted_id, @other_deleted_id]
        expect(TestModel.show_deleted_ids(visible_ids).length).to eq 2
      end
    end
  end
end
