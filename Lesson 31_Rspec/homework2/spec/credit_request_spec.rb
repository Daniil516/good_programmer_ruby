require "rspec" #rspec --init to initialize in directory specs folder
require_relative "../lib/credit_request"
require "spec_helper"

describe CreditRequest do
  #To prepare something for test. Will be initialized in first use (lazy loading) Before every do something. Also can use :all to do something once but for all tests
  let(:credit_request) { CreditRequest.new(18, 15000, "m", "y", 10000) }


  describe "#new" do
    it "should return CreditRequest object" do
      credit_request.should be_an_instance_of CreditRequest
    end

    it "should return correct age" do
      credit_request.age.should eql 18
    end

    it "should return correct salary" do
      credit_request.salary.should eql 15000
    end

    it "should return correct gender" do
      credit_request.gender.should eql "m"
    end

    it "should return correct credit_history" do
      credit_request.credit_history.should eql "y"
    end

    it "should return correct request_amount" do
      credit_request.request_amount.should eql 10000
    end
  end

  describe "#calculate_scoring" do
    it "should return correct calculate scoring" do
      credit_request.calculate_scoring.should eql 40
    end
  end

  describe "#approve?" do
    it "should return correct approve" do
      credit_request.approve?.should eql false
    end
  end
end