require 'spec_helper'

describe FormShui::Answer do

  describe "create answer" do

    let(:form_id) { "50211c30701fe72827000001" }

    it "sends a post request" do
      prefix_attr = {:prefix => {:form_id => form_id }}
      answer_attr = {:attr1 => "one", :attr2 => "two"}
      params = prefix_attr.merge(answer_attr)

      stub_post("/forms/#{form_id}/answers").
        with(params).
        to_return(:body => fixture("answer.json"))

      @answer = FormShui::Answer.create(prefix_attr.merge(answer_attr))
    end

  end
end
