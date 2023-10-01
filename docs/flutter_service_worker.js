'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f120d212fe1cb9989a0177cd8fb4a772",
"assets/AssetManifest.json": "88c4a0fbd516c98d0411851100d7344d",
"assets/assets/bg.png": "4db58f01d323f122fff0a3f247d6481d",
"assets/assets/github.png": "b6ec19ceacb23390aa66d2f101d0ddf6",
"assets/assets/linkedin.png": "d604727cedcd27fcc981ffdb1f318a66",
"assets/assets/me.png": "82c1968c401ceb4a3a0d86f4336130a4",
"assets/assets/me3.png": "9b1730d897c7b5286bb35284bd9f05b0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1bc0f6316f9521fa18dd72674348b856",
"assets/NOTICES": "0c6667f2004d2840ee44f86b2622f02e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "16e7dcebb5552f0d0c0ac022d9b1932a",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/android-icon-144x144.png": "3e59521db0abce9bcb32228177c70372",
"icons/android-icon-192x192.png": "746b8b2d8515221a88d84418e7f5bfe5",
"icons/android-icon-36x36.png": "edfa059ead098b8506fba8f9bc42e892",
"icons/android-icon-48x48.png": "228639dc1119e3cb27c7c352ba38dd67",
"icons/android-icon-72x72.png": "6ebb2f055cdcf4083fe961c96051d3f1",
"icons/android-icon-96x96.png": "1eac1741e665aa42d2db8bb166ff9402",
"icons/apple-icon-114x114.png": "c861990d182297362b6c19e21f2560d6",
"icons/apple-icon-120x120.png": "bd9b5c6ff3404e742ccafd0fe44d422e",
"icons/apple-icon-144x144.png": "3e59521db0abce9bcb32228177c70372",
"icons/apple-icon-152x152.png": "b59f3c44b142b3bdd191506877135a36",
"icons/apple-icon-180x180.png": "6ec122644ece781d35bb356576d733b6",
"icons/apple-icon-57x57.png": "8938007cc7cf4482ca729d45f78a8a90",
"icons/apple-icon-60x60.png": "34ff602e480a6240ae1db762751ca1fc",
"icons/apple-icon-72x72.png": "6ebb2f055cdcf4083fe961c96051d3f1",
"icons/apple-icon-76x76.png": "5f6c59e98dcd3de788e864f3971a2b05",
"icons/apple-icon-precomposed.png": "e9f6929468592a30c3cdd1a638f35082",
"icons/apple-icon.png": "e9f6929468592a30c3cdd1a638f35082",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/favicon-16x16.png": "45984ef975178ba2f5bb2fc5fbffe57d",
"icons/favicon-32x32.png": "c142492405861902e1a35157f4d5b68d",
"icons/favicon-96x96.png": "1eac1741e665aa42d2db8bb166ff9402",
"icons/favicon.ico": "0d5ffc706fd03b5dc9f1779d233ccb3a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/ms-icon-144x144.png": "3e59521db0abce9bcb32228177c70372",
"icons/ms-icon-150x150.png": "e13042890e7f38053d0a2f4a8a013d8f",
"icons/ms-icon-310x310.png": "8297b98d0083dd60f1620f7f92787fda",
"icons/ms-icon-70x70.png": "2d450d6e05662eb2e1139107a0f2cc92",
"index.html": "a37401fdb1357e81e82931b59e798bfa",
"/": "a37401fdb1357e81e82931b59e798bfa",
"main.dart.js": "3fd0fade57c8341a20f3362db45f632d",
"manifest.json": "808993c97f5b135826e01112e9c31031",
"version.json": "f1951c612b1598c2818a6144f45cc70d"};
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
