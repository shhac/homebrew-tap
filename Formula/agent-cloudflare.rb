class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.1/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "d77d08357ad74406ddc076a6fc0a1f4088b3a75c286d4036c078acd49a959b74"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.1/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "1753d367b073da77230485d77ce6e01e1910b9c6cb4db706c38e409bd6743e89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.1/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "4c7a852b35ab1c293736c32fae13912ff80954de46c937319559f6789b4b1527"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.11.1/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "0967ec03755fc01799498e554622ef43dda18295831e8ae81dcaa77b2186a499"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.11.1", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
