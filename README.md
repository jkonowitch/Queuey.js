### Queuey.js
*A simple worker queue implementation*

```
queue = new Queuey
queue.worker = function(data) {
  console.log(data);
}

queue.push({foo: "bar"});
// >

// later...

queue.start();
// > {foo: "bar"}

// and later still...

queue.push({herp: "derp"});
// > {herp: "derp"}

// EVEN later...

queue.stop()
queue.push({shmee: "shmoo"});
// does nothing

```