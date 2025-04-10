self.addEventListener('install', (event) => {
    event.waitUntil(
      caches.open('fitness-cache').then((cache) => {
        return cache.addAll([
          '/', 
          '/index.html', 
          '/styles.css', 
          '/app.js', 
          // добавьте другие ресурсы, которые должны быть закэшированы
        ]);
      })
    );
  });
  
  self.addEventListener('fetch', (event) => {
    event.respondWith(
      caches.match(event.request).then((cachedResponse) => {
        return cachedResponse || fetch(event.request);
      })
    );
  });
  