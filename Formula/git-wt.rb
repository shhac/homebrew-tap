class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.12.0/git-wt-darwin-arm64.tar.gz"
      sha256 "56a257ed4a1ceba445ab8aba3b36df5bfde0c95740c7675bb8e29a9780f04eea"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.12.0/git-wt-darwin-amd64.tar.gz"
      sha256 "ef0de3a090e44ae432bca6fb892d549e8880034a6a2b837cf2ec8ba0084b55d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.12.0/git-wt-linux-arm64.tar.gz"
      sha256 "89e8a53923ef1111a5d1fb36130c9e0156f00d0f79a878027437b7ee850f3420"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.12.0/git-wt-linux-amd64.tar.gz"
      sha256 "4895031d79c442058d5805b1811b2aa9697428f0cc79072a8614ed5a8d854249"
    end
  end

  def install
    bin.install "git-wt"
    # Runs `git-wt completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  def caveats
    <<~EOS
      Enable shell integration so `gwt go` / `gwt new` change directory:

        # zsh (~/.zshrc) or bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or `source` your rc file. The alias also
      auto-binds tab-completion to itself, so `gwt go <TAB>` lists your
      worktree branches with location + recency descriptions matching
      `gwt ls`.

      Without the alias the binary still works in scripts:
        cd "$(git-wt go feature-branch)"

      bash users: completion needs `brew install bash-completion@2`.
    EOS
  end

  test do
    assert_match "git-wt version 0.12.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
    assert_match "bash completion", shell_output("#{bin}/git-wt completion bash")
  end
end
