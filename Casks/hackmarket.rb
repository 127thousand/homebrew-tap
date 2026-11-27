cask "hackmarket" do
  version "1.1.0,32"
  sha256 "469a9840eed86c22fe2e1abf7a4ba66a9c823af37c911d1515b432831143b826"

  url "https://download.hackmarket.dev/hackmarket-#{version.csv.first}-#{version.csv.second}.dmg"
  name "HackMarket"
  desc "Simulated trading game for the dev stack"
  homepage "https://hackmarket.dev/"

  livecheck do
    url "https://download.hackmarket.dev/latest.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  depends_on macos: :monterey

  app "hackmarket.app"

  zap trash: [
    "~/Library/Application Scripts/app.hackmarket",
    "~/Library/Containers/app.hackmarket",
  ]
end
