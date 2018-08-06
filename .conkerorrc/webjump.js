require("index-webjump.js");
//index_webjumps_directory = get_home_directory();
//index_webjumps_directory.appendRelativePath(".conkerorrc/index-webjumps");

// bookmark
define_webjump("bookmark",
               function(term) {return term;},
               $completer = history_completer($use_history = false,
                                              $use_bookmarks = true,
                                              $match_required = true),
               $description = "Visit a conkeror bookmark");

/* search engines */
define_opensearch_webjump("blekko", "blekko.xml");
define_opensearch_webjump("image", "googleimages.xml");
define_webjump("sogou", "http://www.sogou.com/web?query=%s");
define_webjump("ixquick", "http://ixquick.com/do/metasearch.pl?query=%s");
define_webjump("lmgtfy", "http://lmgtfy.com/?q=%s");
define_webjump("startpage", "https://www.startpage.com/do/search",
               $post_data = [["query", "%s"], ["cat", "web"],
                             ["cmd", "process_search"], ["language", "english"],
                             ["engine0", "v1all"], ["abp", "-1"]]);

/* Social */
/** reddit **/
define_webjump("reddit", "http://www.reddit.com/r/%s");

/* math */
define_webjump("mathworld", "http://mathworld.wolfram.com/search/?query=%s&x=0&y=0");

/* programming */
define_webjump("rfc", "http://www.ietf.org/rfc/rfc%s.txt");

/* gitweb */
define_webjump("github", "http://github.com/search?q=%s&type=Everything");

/** bash **/
define_webjump("bashfaq",
               "http://mywiki.wooledge.org/BashFAQ?action=fullsearch&context=180&value=%s&fullsearch=Text",
               $alternative = "http://mywiki.wooledge.org/BashFAQ");

define_webjump("commandlinefu",
               function(term) {
                   return 'http://www.commandlinefu.com/commands/matching/' +
                       term.replace(/[^a-zA-Z0-9_\-]/g, '')
                       .replace(/[\s\-]+/g, '-') +
                       '/' + btoa(term);
               },
               $alternative = "http://www.commandlinefu.com/");

define_webjump("mdc", "https://developer.mozilla.org/Special:Search?search=%s&type=fulltext&go=Search");

/* debian */
define_webjump("debpkg", "http://packages.debian.org/%s");
define_webjump("debfile", "http://packages.debian.org/?searchon=contents&keywords=%s&mode=path&suite=unstable&arch=any");
define_webjump("debbugs", "http://bugs.debian.org/%s");
define_webjump("debpts", "http://packages.qa.debian.org/%s");
define_webjump("debpopcon", "http://qa.debian.org/popcon.php?package=%s");
define_webjump("buildd", "https://buildd.debian.org/%s");
define_webjump("buildd-ports", "http://buildd.debian-ports.org/build.php?pkg=%s");
define_webjump("debqa", "http://qa.debian.org/developer.php?login=%s");
define_webjump("debianwiki",
               "http://wiki.debian.org/Suspend?action=fullsearch&context=180&value=%s&fullsearch=Text");

/* entertainment */
define_webjump("reads", "http://www.goodreads.com/search?query=%s");
define_webjump("imdb", "http://www.imdb.com/find?q=%s");
define_webjump("memory-alpha", "http://memory-alpha.org/wiki/Special:Search/?search=%s");
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("youtube-user", "http://youtube.com/profile_videos?user=%s");
define_webjump("lurkersguide",
               "http://www.google.com/search?q=site%3Ahttp%3A%2F%2Fwww.midwinter.com%2Flurk%2F+%s",
               $alternative = "http://www.midwinter.com/lurk/");
define_webjump("knowyourmeme", "http://knowyourmeme.com/search?q=%s");
