require "spec_helper"

describe FormShui::Form do

  describe "with an existing form" do
    before do
      stub_get("/forms/4").
        to_return(:body => fixture("form.json"))
      @form = FormShui::Form.find(4)
    end

    it "should get the correct resource" do
      a_get("/forms/4").should have_been_made
    end

    it "should delete the resource" do
      stub_delete("/forms/4")
      @form.destroy
      a_delete("/forms/4").should have_been_made
    end

    it "should update the resource" do
      stub_put("/forms/4").
        to_return(:body => fixture("form.json"))
      @form.update({:promotion_id => 1})
      a_put("/forms/4").should have_been_made
    end
  end

  describe "create forms" do
    before do
      stub_post("/forms").
        to_return(:body => fixture("form.json"))
      @form = FormShui::Form.create({:promotion_id => 1, :organization_id => 1})
    end

    it "should create a new Form" do
      @form.promotion_id == "1"
      @form.should be_an_instance_of(FormShui::Form)
    end

    it "should return the new form when successful" do
      a_post("/forms").should have_been_made
    end
  end

end
