Tenemos un proyecto con cosas sueltas. El objetivo del ejercicio es poder armar una app en base a las clases ya creadas.

En el proyecto tenemos 3 pantallas:
1- TextInputViewController: Este VC se encarga de la tarea de agregar un Item
2- ListViewController: Es un listado con los items cargados al momento
3- DetailViewController: Muestra el detalle de un item. Ademas podemos borrar dicho item

Ademas tenemos 3 servicios:
1- AddItemService: Agregar un item
2- GetItemsService: Devuelve todos los items
3- RemoveItemService: Elimina un item

Estas clases ya existen, y las podemos usar. Los servicios NO se puede modificar.

La consigna del proyecto es armar una app que contenga un TabBar con 2 tabs. El primero contiene la pantalla de agregar un item. El segundo contiene la pantalla de listado. Al hacer tap sobre un item, muestra el detalle. Este listado DEBE mantenerse consistente con las tareas que hagamos en la app (si agregamos un item, debe mostrarse). Para este ejercicio, ya vienen precargados 10 items y nuestra app aun no persiste (no pedimos que lo haga).
