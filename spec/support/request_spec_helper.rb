# frozen_string_literal: true

module RequestSpecHelper
  def json
    # parse json to ruby hash
    JSON.parse(response.body)
  end
end
