'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "009c9e65172e010890f7f65fde438006",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"favicon.png": "83addf87b9696c1117da974cbaaa6a82",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "77bd5a2589348d22684e87c83c8115a5",
"/": "77bd5a2589348d22684e87c83c8115a5",
"manifest.json": "bd7bc32c3429c61ea1ca77c02e4c8d8c",
"main.dart.js": "c98f2b7a12b85df88eaf25052ae16cc1",
"assets/AssetManifest.json": "a1a3ce68432b426f852f2039f49a7788",
"assets/FontManifest.json": "561576f7553dd67b87863e216e574aff",
"assets/NOTICES": "6a332f17f7d432a576f9e18ec2a69f2f",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/yf4.PNG": "f756b5b298248860c305baf145200772",
"assets/assets/images/yf1.PNG": "02c58c3b55839e798ddfa05234ad0859",
"assets/assets/images/ac2.jpg": "a7f70841652c2a60dc8a7a5f56dfa965",
"assets/assets/images/cn3.png": "57cd06b2134fe15d5946622f66d7b1e9",
"assets/assets/images/swords.png": "8b55b075c2d4ed6cb035881cb90e22ae",
"assets/assets/images/trophy.png": "ed378865bad063f9799f4e96edb9adfb",
"assets/assets/images/cn5.png": "cc955312734dc4cea31a5cfc45fb2c02",
"assets/assets/images/yf3.PNG": "bf67de46f03b707650e4900d933c980a",
"assets/assets/images/profile.jpg": "1743717c56cecfa9a0783dfd7f857d0d",
"assets/assets/images/cn4.png": "9be21dce32fd4292b0e5db0bb6134b26",
"assets/assets/images/yf2.PNG": "dce62dc71a25ae709d8d9d48b76e89f1",
"assets/assets/images/ac1.jpg": "728b9d60c6da2ecf138b92b304bb2576",
"assets/assets/images/ac4.jpg": "ee941c658c20c2dd5aaf5667579d2002",
"assets/assets/images/eu1.PNG": "3e03148c6588262c81d0d2d8d74ddf8d",
"assets/assets/images/eu2.PNG": "d56b2fee39e97581fcd9181506526101",
"assets/assets/images/moon/bcloud01.png": "9f045ca6e99eb0f44e05f9265aa41f9d",
"assets/assets/images/moon/moon.png": "ac496694709804ee69592daa8ad6fe6c",
"assets/assets/images/moon/cloud01.png": "5214905ff0951c67186329ae5cd70d9f",
"assets/assets/images/moon/cloud02.png": "fc6a96b1300ab821844f34b0595d8e14",
"assets/assets/images/moon/stars.png": "13d2c8b669a0b256ad3fdf1607605eba",
"assets/assets/images/moon/cloud03.png": "3f6fcde3e57e56532be578efeb5e672e",
"assets/assets/images/moon/bcloud02.png": "b1dad1d24c4eb43891bb875326f13ce4",
"assets/assets/images/moon/moonlight.png": "176e9f576c351720071845722d57d4e9",
"assets/assets/images/eu4.PNG": "63478dd9ea66089569580c497ed976c9",
"assets/assets/images/cn2.png": "70f99eebe52d1a8f42e8d4f0ab6b55e4",
"assets/assets/images/ac3.jpg": "ac025f62e49266c3c877508988365f4c",
"assets/assets/images/iphone.png": "3baec2fa1765e787104b7b49e40a7157",
"assets/assets/images/user.png": "6e02d7d63246fa3e327e7ddb7201bbc4",
"assets/assets/images/yf7.png": "48486ec79fe8e07591d9914ed1fa0a44",
"assets/assets/images/demo.png": "7acf2a40551bc625c4cfba392036ee40",
"assets/assets/images/contact/github.svg": "603c82593e833c5eef08663cef31a142",
"assets/assets/images/contact/linkedin.png": "1dcac8cf4544c45f71b0916c67831445",
"assets/assets/images/contact/linkedin.svg": "b1c28437bf4fba3ffe0744dd702c49b5",
"assets/assets/images/contact/email.png": "747e92d861a569cfc8c5144dfc328052",
"assets/assets/images/contact/instagram.png": "d58ae77712ab4cb396cfc5b9e844f2e7",
"assets/assets/images/contact/email.svg": "ba7e0231286e19fb311dd13c2335aea7",
"assets/assets/images/contact/twitter.svg": "28fb3f38a4b1424ea153742b981fe8de",
"assets/assets/images/contact/twitter.png": "206848151366b1309df131978a9ca71c",
"assets/assets/images/contact/github.png": "bbf7583b45fc05f71e7ec4c9c1c402f8",
"assets/assets/images/contact/instagram.svg": "252ad1051ffd8e4351821e8fe26f4e78",
"assets/assets/images/eu5.PNG": "9c9b3becafc2625262ba56280442666f",
"assets/assets/images/technologies/twilio.png": "1e826bc41a9f60466a278f976897ece3",
"assets/assets/images/technologies/postgres.png": "a83547495891536e5fe247724e2e6147",
"assets/assets/images/technologies/git.png": "728ff5a8e44d74cd0f2359ef0a9ec88a",
"assets/assets/images/technologies/docker.png": "e544675986b0658fc8144479f4e6eab6",
"assets/assets/images/technologies/graphql.png": "7c64d4f7ea5070f290427a97f27b151f",
"assets/assets/images/technologies/firebase.png": "49a7239c611237798c9890c9600682a4",
"assets/assets/images/technologies/kotlin.png": "d0fd8e2ccdf5e75c1ad8a99600fc06d2",
"assets/assets/images/technologies/stripe.png": "51a90ed52ab4fd0bd4483e6167ba9270",
"assets/assets/images/technologies/flutter.png": "f0ecf5b601b1c99977082ec847b75dce",
"assets/assets/images/technologies/dart.png": "e600db6f846f6461cbcf0b5901b5ec74",
"assets/assets/images/technologies/html.png": "3bfabbd4884b9541e1107481b29b2f86",
"assets/assets/images/technologies/springboot.png": "68b148a2b9db3ce1c9a80c1fe7cb77c0",
"assets/assets/images/technologies/java.png": "4eb1819dc863ef386e09d86e9f482a9f",
"assets/assets/images/technologies/swift.png": "98faf1803e9b2c8a718a736598587308",
"assets/assets/images/technologies/googlemaps.png": "6bc43725662aa3f8ee672a184d66747d",
"assets/assets/images/eu3.PNG": "59fc6cc705108a215d2c92b0e4330949",
"assets/assets/images/ac5.jpeg": "f86edaf55ffc80f4c4ee5fe661a2ac2e",
"assets/assets/images/cn1.png": "94f34abfdc9bd3c55c63ff78d5c48573",
"assets/assets/images/tf6.PNG": "eda2a8a85e9c3d2ee3ac79be2a3097cd",
"assets/assets/cv/cv.pdf": "214d58fe53c2b23d281383855c820923",
"assets/assets/fonts/ways.ttf": "8dcbc0c489f087be578caf9977f9e1f0",
"assets/assets/fonts/war.ttf": "65124ddb915f965b86607b2de904b1b2",
"assets/assets/rive/bubble_demo.riv": "546f2ab3e40409a913b3d9baed09d61c",
"assets/assets/rive/bubble_demo1.riv": "a96215490dcd93fb345b079f3484c508",
"assets/assets/rive/barrier_gate.riv": "af649d9677b93ae13f532c931b3dc81c",
"assets/assets/rive/beach_icon.riv": "72ed1186b5af6f9256f19128f90c66f6",
"assets/assets/rive/water.riv": "9581276e18fb75f3c9f52157f653bfb4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "ae6304797c013e3fdd9df7ef0c543a62",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
