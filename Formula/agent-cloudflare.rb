class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.0/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "2ecd2b9e370a4a3c3391bcf879162778e79f41a39dbf4c01c300099dd17f8620"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.0/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "be13d0f9e1e31ff7e40124b6374bb525a15c8979a52a5b0c1acfa7e8e82d0bf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.0/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "9a0d20f9306f5b28b68ecf72928d3d1bc0b337bbd246c12a2cb7a56806bfba01"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.3.0/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "7eaad2938d8de741388ecde3838ede45a508fa175d93548ff27d647f801d6a88"
    end
  end

  def install
    bin.install Dir["agent-cloudflare-*"].first => "agent-cloudflare"
    # Runs `agent-cloudflare completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "agent-cloudflare usage", shell_output("#{bin}/agent-cloudflare usage")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-cloudflare completion bash")
  end
end
