class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "a1b0b5b4858e88931ad7ee347fec8998c2448fec8e49837271db3d4dce27e653"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "69769dbf6b22ef3d6401a992e7472a7e7b2e71a23815cbfcb5e639c99ca31246"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.1/agent-dd-linux-arm64.tar.gz"
      sha256 "23307c3cafb49d125f7e553adeabc13c435ad17baf7a38bde3cde004dc773b9d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.9.1/agent-dd-linux-amd64.tar.gz"
      sha256 "d7f4398a36c93cadcce7247cfcbaf3a609bfb9d8e9867e5159ddf527c97772af"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.9.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
