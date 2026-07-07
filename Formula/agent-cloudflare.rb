class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.12.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.2/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "ebbfef776cbbd98bee88e734a1b55c31d9945ac4177db4dfce4a306c3fa23f43"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.2/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "24640120e0a0d19e7802a7fa1245b869f468d7157cb3aeccca890181d7df4df8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.2/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "83c2de57edc556410c4a2c0c6e087130b78e687bcf24003f6371d143dbf3a935"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.2/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "14009e2c5c47955d9d55a439ac285f10dbb6d1f2a457138f50d643d300cbb6aa"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.12.2", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
