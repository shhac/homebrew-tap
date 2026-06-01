class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "83f9844292f826adbe79022f708317ae6c3e3cd2be1e05d1499eb1a9eb7163fd"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "2142f9efe969e4f3f8d5e3e56a9bf97029ba2bc6c794542bb68eaf36663bf874"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "41ec0ee3894da8880f1ed6869b3d2c7b9429813428de852e97a23b7feaef1c2e"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "95dc167b47abcf5a886df92a3782194eca1309eeee1cac84770b9317f5b50f07"
    end
  end

  def install
    bin.install Dir["agent-postmark-*"].first => "agent-postmark"
    # Runs `agent-postmark completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
