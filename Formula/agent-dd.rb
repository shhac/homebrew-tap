class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "50a54ba3427495c1ccce8578e46b8d57559f0e264a91a188b4f808fbccba9816"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "00407a893da8f7448520b3e2cec5982b9c42b08b42cf245e5aab4841ba28974d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.0/agent-dd-linux-arm64.tar.gz"
      sha256 "127775f50c422046259741519f484954c81ff549e3eca6fe82224e58a408371d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.0/agent-dd-linux-amd64.tar.gz"
      sha256 "8dcd215d9dbf2f5d286b8999269c8089cf12b2c67187450d855bc0d10ac9bce3"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
