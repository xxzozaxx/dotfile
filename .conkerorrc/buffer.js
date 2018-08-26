/*
 * Handy as the number keys are unbound by default.
 * I.e., 1 will switch to the first buffer, 2 to the second buffer, 0 to the tenth buffer.
 * These bindings work as expected with the tab-bar module.
 */
function define_switch_buffer_key (key, buf_num) {
    define_key(default_global_keymap, key,
               function (I) {
                   switch_to_buffer(I.window,
                                    I.window.buffers.get_buffer(buf_num));
               });
}
for (let i = 0; i < 10; ++i) {
    define_switch_buffer_key("M-" + String((i+1)%10), i);
}

/* get tiny url for the current page
 * press * q and then c to generate and copy the tinyurl into clipboard */
define_browser_object_class(
    "tinyurl",
    "Get a tinyurl for the current page",
    function (I, prompt) {
        check_buffer(I.buffer, content_buffer);
        let createurl = 'http://tinyurl.com/api-create.php?url=' +
            encodeURIComponent(
                load_spec_uri_string(
                    load_spec(I.buffer.top_frame)));
        try {
            var content = yield send_http_request(
                load_spec({uri: createurl}));
            yield co_return(content.responseText);
        } catch (e) { }
    });
define_key(content_buffer_normal_keymap, "* q", "browser-object-tinyurl");
