'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "54b3a5432dc3e76e3ebbc21581140f07",
"index.html": "d19cf3c33d1160a1b65f706574a11066",
"/": "d19cf3c33d1160a1b65f706574a11066",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/NOTICES": "22debb8c486081c92774ad68e43208e4",
"assets/FontManifest.json": "1135ba69e85e3d99f9749c2dd2cbb334",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.smcbin": "a4e94cbae4cb3cff4685d36eec0aa533",
"assets/assets/images/iv_bag_cart.png": "4211c8d33afb649aeda8f0095155f161",
"assets/assets/images/icon_number_phone.png": "d53cad30d867b5edcea6f7131eafab5c",
"assets/assets/images/tracking_ambil_sendiri.png": "4f92256bd72b0e5b14b22ed4932e9e03",
"assets/assets/images/check.png": "0ff7c0ded8e32d0997c690167a2944fe",
"assets/assets/images/cross_red.png": "ce29b3fb55c89586f9cb00c81931efe0",
"assets/assets/images/ekspedisi.png": "1e107f2bcc6a4ce91dfb97f1d9286469",
"assets/assets/images/home_banner_2.png": "18d348bd0b47ff70a12dd3bf9fccf7fb",
"assets/assets/images/iv_avatar_profile.png": "df46a11a76b68063d0da14a665c5be4c",
"assets/assets/images/home_banner_3.png": "e8121b7f3088d8f813c36d6ffc9f8f04",
"assets/assets/images/sendal_kayu.png": "a4e0d66efa8694a1c8866a8c12a58694",
"assets/assets/images/iv_maps.png": "3c34573fb87cd7e9c45a4487045c304c",
"assets/assets/images/sepatu_coklat.png": "95435bbc5ff49e8e21278797476ac870",
"assets/assets/images/sendal_ayam.png": "6eba1bb9d773815046834de04c5b3b5c",
"assets/assets/images/iv_avatar.png": "b4957b7f3ee61c6558efdf0cf3bc2a02",
"assets/assets/images/iv_empty_state.png": "3b02f54538584bd85e8c4a6b920feaae",
"assets/assets/images/sendal_terbang.png": "b5ed4969bb2ab75e475c2f55513f6d24",
"assets/assets/images/sepatu_bola.png": "8e071103bcd20d5912d088be049a3e82",
"assets/assets/images/iv_avatar_profile_2.png": "0c5bc575f9d85e02b8c84722efbd966b",
"assets/assets/images/cross.png": "1aebeae83fab9ddf81e1a202cddfed4e",
"assets/assets/images/iv_clock.png": "b6d95ff48051cd45c9c91e335ac558f9",
"assets/assets/images/sepatu_pelangi.png": "9b4d8122d52af878064a9ad3254749d3",
"assets/assets/images/cross_red_line.png": "c54803c04c5016cb4f7cdb6fc9301915",
"assets/assets/images/sendal_buaya.png": "fc5207b4b303b4553d187ee89008f2cd",
"assets/assets/images/home_banner.png": "db10ce38b93ec78ba51f626c2e71b953",
"assets/assets/images/tracking_kurir.png": "eb3d98f53c8e8c37d6ee7d5a4ae66926",
"assets/assets/images/tracking_dikirim_toko.png": "be426a8f5f637104dda18459be90628d",
"assets/assets/images/sepatu_merah.png": "bf79576774eb6d21b99c2af204485ab7",
"assets/assets/icons/ic_share.svg": "f2fe978c4cb84734f91a348e3c8b91e6",
"assets/assets/icons/ic_search_black.svg": "655b79ec50abc59a35d2a955d81368e9",
"assets/assets/icons/img_bottom_sheet.svg": "e06045819a6d35fe330cae02e063a9e8",
"assets/assets/icons/ic_carts.svg": "2312e305645b902d0a4f2036ceb32dcb",
"assets/assets/icons/ic_shop_address.svg": "083c5afc1eeadb380d9753e49da4f97b",
"assets/assets/icons/ic_search.svg": "2312e305645b902d0a4f2036ceb32dcb",
"assets/assets/icons/ic_link.svg": "a94fff975635ebf56ededf907b362e5d",
"assets/assets/icons/icon_links.svg": "6a15d54316cbfcfa9f9f407796fd469a",
"assets/assets/icons/ic_shop_cart.svg": "41027eaa9ef2a5714f92f8a6cabd8162",
"assets/assets/icons/check.svg": "2f86f7784bc6a301ec2b6be47731a5c9",
"assets/assets/icons/cross.svg": "1087774008a1da6f86809abd45d2c273",
"assets/assets/fonts/PlusJakartaSans/PlusJakartaSans-Bold.ttf": "202ed785290892875b3c8b3d0584efc5",
"assets/assets/fonts/PlusJakartaSans/PlusJakartaSans-Regular.ttf": "1c53607464229476dd0241bcc71235f6",
"assets/assets/fonts/PlusJakartaSans/PlusJakartaSans-Medium.ttf": "86c690cf3c5fa19ac4d644e3179d726e",
"assets/fonts/MaterialIcons-Regular.otf": "11b24785665ba3641f93d2fdfed56701",
"assets/AssetManifest.json": "1b1b27d778a68f3d01df64b249630949",
"assets/packages/getwidget/icons/dribble.png": "1e36936e4411f32b0e28fd8335495647",
"assets/packages/getwidget/icons/wechat.png": "ba10e8b2421bde565e50dfabc202feb7",
"assets/packages/getwidget/icons/facebook.png": "293dc099a89c74ae34a028b1ecd2c1f0",
"assets/packages/getwidget/icons/linkedin.png": "822742104a63a720313f6a14d3134f61",
"assets/packages/getwidget/icons/line.png": "da8d1b531d8189396d68dfcd8cb37a79",
"assets/packages/getwidget/icons/slack.png": "19155b848beeb39c1ffcf743608e2fde",
"assets/packages/getwidget/icons/twitter.png": "caee56343a870ebd76a090642d838139",
"assets/packages/getwidget/icons/pinterest.png": "d52ccb1e2a8277e4c37b27b234c9f931",
"assets/packages/getwidget/icons/whatsapp.png": "30632e569686a4b84cc68169fb9ce2e1",
"assets/packages/getwidget/icons/youtube.png": "1bfda73ab724ad40eb8601f1e7dbc1b9",
"assets/packages/getwidget/icons/google.png": "596c5544c21e9d6cb02b0768f60f589a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"version.json": "ec325a4e842e32e54f468436353e8104",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"main.dart.js": "5a38ff2375fd4f603601c546bbeaebf6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
