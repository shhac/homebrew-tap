class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "3c30a8a8fde30a42464d9d4d29702180827ddb554a58e10caa4dd8c6fefba286"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "79cfcd68c209e126d1590aba342deb3d06c2ac7e23a1edef61fe03be3ff2121f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "64a527fc9c2f3979098e8e6ddc57298c19ff813b893f15ece99c9a566103612f"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.11.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "2eacf3dbac8e7d9123c351c787cb4a15136be5e4af1667d3075ac17a10ea5772"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
