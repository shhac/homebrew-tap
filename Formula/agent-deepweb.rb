class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.11.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "02da03261f33d38f9939acc1998da1619b4f8e2237f4928bebb0fd8bc05ad5d6"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.11.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "06a529b37f930de723343bd0d60e2cd5510cb816a3c15719b3e104a7d33b5741"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.11.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "2c8b66421be702337cd3099bbaa97e9a257d543b98646f541d55de5163ad9623"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.11.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "df4ede1d8a04a69cc1b4840556d9b5176f7419e364836929edbd8e52dd751b1c"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
