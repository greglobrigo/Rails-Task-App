FactoryBot.define do
    factory(:user) do
      email { "test@account1.com" }
      password { "1234567" }
    end

    factory(:category) do
      title { "test" }
    end
  end 

  