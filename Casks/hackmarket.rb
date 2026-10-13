cask "hackmarket" do
  version "1.0.0,11"
  sha256 "d24feb8a99ecd4415569fb4f635ebe801bcbb8af1cc6523fa943e9ee2a00c26f"

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
