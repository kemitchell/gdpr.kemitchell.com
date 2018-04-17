document.addEventListener('click', function (event) {
  var target = event.target
  if (target.className.indexOf('toggle') !== -1) {
    var sibling = event.target
    while (sibling = sibling.nextElementSibling) {
      var className = sibling.className
      if (className.indexOf('hidden') !== -1) {
        sibling.className = className.replace('hidden', '')
      } else {
        sibling.className = className + ' hidden'
      }
    }
  }
})
