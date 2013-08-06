require 'spec_helper'

describe MoviesController do

  describe "GET search" do
    it "assigns an empty set to @movies" do
      get :search, {} 
      assigns(:movies).should eq([])
    end
  end

  describe "POST search" do
    describe "with valid params" do
      it "find the right movie" do
        post :search, {:movie => {title: 'Hobbit'}}
        assigns(:movies).length.should eq(1)
      end
    end
  end

end
