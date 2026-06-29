class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "6027460c7368fb5602c5780b79e6b9eeabd216041ad2c43c1efa01cefbfea6c3"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "f58b80571e3f4d77d1b648d051d0a9ec95dc3737daa076fce64297532cd9fce5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.1/agent-dd-linux-arm64.tar.gz"
      sha256 "8c9cded2ac47652738b89d473058acac6bd8bd1bea22a522ff7cd1e17472046e"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.1/agent-dd-linux-amd64.tar.gz"
      sha256 "4252d552bfbb9c9dc72615be56681e5f7ce45844c26a2d668493a0949ea1bc2e"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.17.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
