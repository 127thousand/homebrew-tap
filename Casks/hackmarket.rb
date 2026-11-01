cask "hackmarket" do
  version "1.0.0,15"
  sha256 "2e1137afd376d41026e078fb679b2801fc8a772a83e47f3a9523179ff315aec1"

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
