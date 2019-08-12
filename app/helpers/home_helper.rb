module HomeHelper
  def political_party_formated(politician)
    "#{politician.political_party} (#{politician.state})"
  end
end
