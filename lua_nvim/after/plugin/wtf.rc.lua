local status, wtf = pcall(require, "wtf")
if (not status) then return end

wtf.setup({
  -- Default AI popup type
  popup_type = "horizontal",
  -- An alternative way to set your OpenAI api key
  -- openai_api_key = "sk-xxxxxxxxxxxxxx",
  -- ChatGPT Model
  openai_model_id = "gpt-3.5-turbo",
  -- Set your preferred language for the response
  language = "english",
  -- Any additional instructions
  additional_instructions = "Start the reply with 'OH HAI THERE'",
  -- Default search engine, can be overridden by passing an option to WtfSeatch
  search_engine = "google",
})
