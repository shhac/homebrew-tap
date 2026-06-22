class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.9.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "81afd4fe4e988933bbb96918d428d6710bb5c5e455a805f4c6183fec7401a445"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.9.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "fccaadcf88eb1385716ba738d657534fab5c07f74ff5e42646f4697e9f96b932"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.9.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "0c894e7e5d5ae75c6fc7211304f6348cf52180de291825bd055d568f3abd7bf9"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.9.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "5057191db73adfb52cb8de6ba029bed332d319b1c5772bac31ae2c72fd8d72d2"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
