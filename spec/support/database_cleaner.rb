RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before do |example|
    if example.metadata[:js]
      DatabaseCleaner.strategy = :deletion
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after do
    DatabaseCleaner.clean
  end
end