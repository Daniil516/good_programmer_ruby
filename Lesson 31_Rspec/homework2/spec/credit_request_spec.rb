require "rspec" #rspec --init to initialize in directory specs folder
require_relative "../lib/credit_request"
require "spec_helper"

describe CreditRequest do
  before :each do#Before every do something. Also can use :all to do something once but for all tests
    @credit_request_var = CreditRequest.new(18, 15000, "m", "y", 10000)
  end

  describe "#new" do
    it "should return CreditRequest object" do
      @credit_request_var.should be_an_instance_of CreditRequest
    end

    it "should return correct age" do
      @credit_request_var.age.should eql 18
    end

    it "should return correct salary" do
      @credit_request_var.salary.should eql 15000
    end

    it "should return correct gender" do
      @credit_request_var.gender.should eql "m"
    end

    it "should return correct credit_history" do
      @credit_request_var.credit_history.should eql "y"
    end

    it "should return correct request_amount" do
      @credit_request_var.request_amount.should eql 10000
    end
  end

  describe "#calculate_scoring" do
    it "should return correct calculate scoring" do
      @credit_request_var.calculate_scoring.should eql 40
    end
  end

  describe "#approve?" do
    it "should return correct approve" do
      @credit_request_var.approve?.should eql false
    end
  end
end