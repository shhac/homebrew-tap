class AgentPosthog < Formula
  desc "PostHog product analytics CLI for AI agents"
  homepage "https://github.com/shhac/agent-posthog"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.0/agent-posthog-darwin-arm64.tar.gz"
      sha256 "a2578ac0558bc31bd74873509b8936cc21695c805b83e8b8e873f3d23c3a9f65"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.0/agent-posthog-darwin-amd64.tar.gz"
      sha256 "01628c3ba96ff3bc505f612a450ace836ec345d211418cf0568649a09586c40a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.0/agent-posthog-linux-arm64.tar.gz"
      sha256 "8caff49c70db0331a9dea5695faf4522770ecc05afa64b6a3952c700ff1e9c06"
    end
    on_intel do
      url "https://github.com/shhac/agent-posthog/releases/download/v0.1.0/agent-posthog-linux-amd64.tar.gz"
      sha256 "35e461f42ccbcb5550a460c355c96b726a5cf57781fb64f6c4349e05ff13005a"
    end
  end

  def install
    bin.install Dir["agent-posthog-*"].first => "agent-posthog"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-posthog --version")
    assert_match "Never paste API keys", shell_output("#{bin}/agent-posthog usage")
  end
end
