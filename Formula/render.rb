class Render < Formula
  desc "Universal data-driven template for generating textual output, as a static binary and a library"
  homepage "https://github.com/VirtusLab/render/"
  url "https://github.com/VirtusLab/render.git", :using => :git, :tag => "v0.0.8"
  head "https://github.com/VirtusLab/render.git", :using => :git
  version "0.0.8"


  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/VirtusLab/render"

    bin_path.install Dir["*"]
    cd bin_path do

      system "make", "dep"
      system "make", "status"
      system "make", "static"
      bin.install "render"
    end
  end

  test do
    system bin/"render", "-v"
  end
end
