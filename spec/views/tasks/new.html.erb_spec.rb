# require 'rails_helper'

# RSpec.describe "tasks/new", type: :view do
#   before(:each) do
#     assign(:task, Task.new(
#       name: "MyString",
#       body: "MyText",
#       category_id: 1
#     ))
#   end

#   it "renders new task form" do
#     render

#     assert_select "form[action=?][method=?]", tasks_path, "post" do

#       assert_select "input[name=?]", "task[name]"

#       assert_select "textarea[name=?]", "task[body]"

#       assert_select "input[name=?]", "task[category_id]"
#     end
#   end
# end
