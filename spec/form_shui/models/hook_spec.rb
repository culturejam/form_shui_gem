require 'spec_helper'

describe FormShui::Hook do

  describe "create a hook" do

    before do
      stub_post("/form/1/hooks").
        to_return(:body => fixture("hook.json"))
    end

    it "sends a post request" do
      params_list = {
        "name"=>"email",
        "events"=>"submit_answer",
        "active"=>"true",
        "config"=>{"address"=>"bcabalo@gmail.com"}
      }.to_json

      form_id = 1

      response = FormShui::Hook.post(form_id, params_list)
      response = JSON.parse(response)

      # Assertions
      a_post("/form/1/hooks").should have_been_made
      response["name"].should eq("email")
      response["events"].should eq("submit_answer")
      response["active"].should eq("true")
    end
  end

  before do
    stub_get("/hooks/2").
      to_return(:body => fixture("hook.json"))
  end

  describe "read a hook" do
    it "fetches a specific hook" do
      form_id = 1
      hook_id = 2

      response = FormShui::Hook.get(hook_id)
      response = JSON.parse(response)

      a_get("/hooks/2").should have_been_made
      response["id"].should eq("2")
      response["name"].should eq("email")
      response["events"].should eq("submit_answer")
      response["active"].should eq("true")
    end
  end

  before do
    stub_request(:patch, "http://promojam.dev:4567/hooks/2").
      to_return(:body => fixture("hook.json"))
  end

  describe "edit a hook" do
    it "updates a hook" do

      update_params_list = {
        "name"=>"email",
        "events"=>"submit_answer",
        "active"=>"true",
        "config"=>{"address"=>"bcabalo@gmail.com"}
      }.to_json

      form_id = 1
      hook_id = 2

      response = FormShui::Hook.patch(hook_id, update_params_list)
      response = JSON.parse(response)

      response["active"].should eq("true")

    end
  end

  before do
    stub_delete("/hooks/2").
      to_return(:body => nil)
  end

  describe "delete" do
    it "deletes a hook" do
      form_id = 1
      hook_id = 2

      response = FormShui::Hook.delete(hook_id)

      a_delete("/hooks/2").should have_been_made
      response.should eq(nil)
    end
  end

  before do
    stub_get("/form/1/hooks").
      to_return(:body => fixture("hooks.json"))
  end

  describe "read all hooks" do
    it "reads all hooks" do
      form_id = 1
      hook_id = 2

      response = FormShui::Hook.list(form_id)
      response = JSON.parse(response)

      a_get("/form/1/hooks").should have_been_made
      response[0]["id"].should eq("2")
      response[1]["active"].should eq("false")
    end
  end

end
