define_browser_object_class(
    "history-url", null,
    function (I, prompt) {
        check_buffer (I.buffer, content_buffer);
        var result = yield I.buffer.window.minibuffer.read_url(
            $prompt = prompt,  $use_webjumps = false, $use_history = true, $use_bookmarks = false);
        yield co_return (result);
    },
    $hint = "choose url from history");



nteractive("find-url-from-history",
           "Find a page from history in the current buffer",
           "find-url",
           $browser_object = browser_object_history_url);

nteractive("find-url-from-history-new-buffer",
           "Find a page from history in the current buffer",
           "find-url-new-buffer",
           $browser_object = browser_object_history_url);



history_clean([function (uri, age) age > 365,
               function (uri, age) age > 30 && uri.indexOf('?') > -1],
              $verbose);
