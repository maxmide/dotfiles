# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

config.set("content.cookies.accept", "no-3rdparty", "chrome-devtools://*")

config.set("content.cookies.accept", "no-3rdparty", "devtools://*")

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:145.0) Gecko/20100101 Firefox/145.0",
    "https://accounts.google.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}",
    "https://gitlab.gnome.org/*",
)

# Load images automatically in web pages.
config.set("content.images", True, "chrome-devtools://*")

# Load images automatically in web pages.
config.set("content.images", True, "devtools://*")

# Enable JavaScript.
config.set("content.javascript.enabled", True, "chrome-devtools://*")

# Enable JavaScript.
config.set("content.javascript.enabled", True, "devtools://*")

# Enable JavaScript.
config.set("content.javascript.enabled", True, "chrome://*/*")

# Enable JavaScript.
config.set("content.javascript.enabled", True, "qute://*/*")

# Allow locally loaded documents to access remote URLs.
config.set(
    "content.local_content_can_access_remote_urls",
    True,
    "file:///home/maxwell/.local/share/qutebrowser/userscripts/*",
)

# Allow locally loaded documents to access other local URLs.
config.set(
    "content.local_content_can_access_file_urls",
    False,
    "file:///home/maxwell/.local/share/qutebrowser/userscripts/*",
)

config.set("statusbar.show", "never")

# Setting dark mode
config.set("colors.webpage.darkmode.enabled", True)

# Restore previous session automatically
c.auto_save.session = True

# Save tabs/windows when quitting
c.session.lazy_restore = True
c.tabs.background = False

# Optional:
# restore last session even after crash
c.content.autoplay = False

# Tabs on the left
c.tabs.position = "left"

# Minimal / narrow tab bar
c.tabs.width = "5%"

# Smaller padding
c.tabs.padding = {
    "top": 5,
    "bottom": 5,
    "left": 9,
    "right": 9,
}

# Only show tabs when multiple exist
c.tabs.show = "multiple"

# Better compact behavior
c.tabs.title.format = "{index}: {current_title}"

# Smooth scrolling
c.scrolling.smooth = True

# Use ~/downloads automatically
c.downloads.location.directory = "~/Downloads"

# Remove finished downloads after delay
c.downloads.remove_finished = 5000

# Better adblocking
# c.content.blocking.method = "both"

# Enable clipboard access
c.content.javascript.clipboard = "access"

# Cookies: accept from visited sites only
#c.content.cookies.accept = "no-3rdparty"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "yt": "https://youtube.com/results?search_query={}",
    "wk": "https://wikipedia.com/search?q={}",
}

c.url.start_pages = ["https://start.duckduckgo.com"]
c.url.default_page = "https://start.duckduckgo.com"
