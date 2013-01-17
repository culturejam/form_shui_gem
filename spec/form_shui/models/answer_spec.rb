require 'spec_helper'

describe FormShui::Answer do
  let(:form_id) { "50211c30701fe72827000001" }

  let(:prefix) do
    { prefix: { form_id: form_id } }
  end

  describe "#create" do

    it "sends a post request" do
      answer_attr = { attr1: "one", attr2: "two" }
      params      = prefix.merge(answer_attr)

      stub_post("/forms/#{form_id}/answers").
        with(params).
        to_return(:body => fixture("answer.json"))

      answer = FormShui::Answer.create(params)
      answer.should be_an_instance_of(FormShui::Answer)
      answer.email.should == "test@formshui.com"
    end

  end

  describe "#all" do

    it "fetches all answers from a form" do
      params = prefix

      stub_get("/forms/#{form_id}/answers").
        with(params).
        to_return(:body => fixture("answers.json"))

      answers = FormShui::Answer.all(params)
      answers.length.should == 2
      answers[0].should be_an_instance_of(FormShui::Answer)
      answers[0].email.should == "test1@formshui.com"
    end

  end
end
