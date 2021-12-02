require "rails_helper"

RSpec.describe CategoriesController, type: :routing do
  describe "routing" do
    it "1. GET method url: /categories routes to #index" do
      expect(get: "/categories").to route_to("categories#index")
    end

    it "2. GET method url: /categories/new routes to #new" do
      expect(get: "/categories/new").to route_to("categories#new")
    end

    it "3. GET method url: /categories/1 routes properly to category with id 1" do
      expect(get: "/categories/1").to route_to("categories#show", id: "1")
    end

    it "4. GET method url: /categories/1/edit routes properly to edit category with id 1" do
      expect(get: "/categories/1/edit").to route_to("categories#edit", id: "1")
    end


    it "5. POST method url: /categories routes to #create via POST" do
      expect(post: "/categories").to route_to("categories#create")
    end

    it "6. PUT method url: /categories/1 routes to update category with id 1 via PUT" do
      expect(put: "/categories/1").to route_to("categories#update", id: "1")
    end

    it "7. PATCH method url: /categories/1 routes to update category with id 1 via PATCH" do
      expect(patch: "/categories/1").to route_to("categories#update", id: "1")
    end

    it "8. DELETE method url: /categories/1 routes to destroy category with id 1 via DELETE" do
      expect(delete: "/categories/1").to route_to("categories#destroy", id: "1")
    end
  end
end
