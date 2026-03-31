class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "c3472b0fe2620f94e3c9af0c8f48b49564f64eda3635ede9384f00d5b188e2d5"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "d19fff0ba71e86845515e34195c391b8f85bbfb50cd073183d7a040a0a7d112d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "ff7b305c4bfaab157f32b2356fad8a36ccd34da49842055afaaf4fb53fa7747a"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.1.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "290a9e5106ecd86982a27df4c43d516d4ad2fb1cb66700b68b6f90f366670dfa"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
