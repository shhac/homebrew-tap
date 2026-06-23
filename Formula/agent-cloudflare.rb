class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.1/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "bd16682938d7a791a35251c38072924d344e3a8455f6466691c32f5121dfcd36"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.1/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "3e3e4cc5bf8ded6f9914cf8e33835d2908377e7876be21836e4b14a889da2908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.1/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "a8a0b29c5b04c066f4d25ead6561f2cdcd3967c7a4324b3004a42fd772b0ffbf"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.10.1/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "7b6636d62eecaa1ab0dd2dc9668348a6adccf23ae0af6cd075c97f3e76d96432"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.10.1", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
