let currentPage = 'home';
let isLoggedIn = false;
let userRole = null;
let appointments = [
    { id: 1, name: 'Ramiro Ridolfi', phone: '1123456789', date: '2025-10-25', time: '10:00', service: 'Cambio de aceite', status: 'pendiente' }
];

function render() {
    const app = document.getElementById('app');
    app.innerHTML = `
        ${renderNavigation()}
        ${currentPage === 'home' ? renderHomePage() : ''}
        ${currentPage === 'services' ? renderServicesPage() : ''}
        ${currentPage === 'login' ? renderLoginPage() : ''}
        ${currentPage === 'appointment' ? renderAppointmentPage() : ''}
        ${currentPage === 'admin' && userRole === 'admin' ? renderAdminPage() : ''}
        ${renderFooter()}
    `;
    attachEventListeners();
}

function renderNavigation() {
    return `
        <nav class="bg-gray-900 text-white shadow-lg">
            <div class="container mx-auto px-4">
                <div class="flex justify-between items-center py-4">
                    <div class="flex items-center space-x-2 cursor-pointer" onclick="navigateTo('home')">
                        <svg class="w-8 h-8 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                        </svg>
                        <span class="text-2xl font-bold">DIESEL CARUSO</span>
                    </div>
                    <div class="flex items-center space-x-6">
                        <button onclick="navigateTo('home')" class="hover:text-orange-500 transition">Inicio</button>
                        <button onclick="navigateTo('services')" class="hover:text-orange-500 transition">Servicios</button>
                        <button onclick="navigateTo('appointment')" class="hover:text-orange-500 transition">Solicitar Turno</button>
                        ${isLoggedIn ? `
                            ${userRole === 'admin' ? '<button onclick="navigateTo(\'admin\')" class="hover:text-orange-500 transition">Panel Admin</button>' : ''}
                            <button onclick="handleLogout()" class="hover:text-orange-500 transition">Salir</button>
                        ` : `
                            <button onclick="navigateTo('login')" class="bg-orange-500 px-4 py-2 rounded hover:bg-orange-600 transition">Iniciar Sesión</button>
                        `}
                    </div>
                </div>
            </div>
        </nav>
    `;
}

function renderHomePage() {
    return `
        <div class="bg-gradient-to-r from-orange-600 to-red-700 text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4">DIESEL CARUSO</h1>
                <p class="text-2xl mb-8">Taller Mecánico Especializado en Motores Diesel</p>
                <button onclick="navigateTo('appointment')" class="bg-white text-orange-600 px-8 py-3 rounded-lg font-bold text-lg hover:bg-gray-100 transition">
                    Solicitar Turno Ahora
                </button>
            </div>
        </div>

        <div class="container mx-auto px-4 py-16">
            <div class="grid md:grid-cols-3 gap-8 mb-16">
                <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                    <svg class="w-16 h-16 mx-auto mb-4 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                    </svg>
                    <h3 class="text-xl font-bold mb-2">Experiencia</h3>
                    <p class="text-gray-600">Más de 50 años en el rubro</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                    <svg class="w-16 h-16 mx-auto mb-4 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <h3 class="text-xl font-bold mb-2">Rapidez</h3>
                    <p class="text-gray-600">Servicio eficiente y ágil</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg text-center">
                    <svg class="w-16 h-16 mx-auto mb-4 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    <h3 class="text-xl font-bold mb-2">Confianza</h3>
                    <p class="text-gray-600">Clientes satisfechos</p>
                </div>
            </div>
        </div>

        <section class="galeria">
            <div class="galeria-contenedor">
                <img src="imagenes/imagen1.png" alt="Imagen 1">
                <img src="imagenes/imagen2.png" alt="Imagen 2">
                <img src="imagenes/imagen3.png" alt="Imagen 3">
                <img src="imagenes/imagen4.png" alt="Imagen 4">
                <img src="imagenes/imagen5.png" alt="Imagen 5">
                <img src="imagenes/imagen6.png" alt="Imagen 6">
            </div>
        </section>
    `;
}

function renderServicesPage() {
    const services = [
        'Cambio de aceite y filtros',
        'Reparación de motor diesel',
        'Sistema de inyección',
        'Diagnóstico computarizado',
        'Mantenimiento preventivo',
        'Reparación de turbos',
        'Sistema de frenos',
        'Suspensión y dirección'
    ];

    return `
        <div class="container mx-auto px-4 py-16">
            <h1 class="text-4xl font-bold mb-8 text-center">Nuestros Servicios</h1>
            <div class="grid md:grid-cols-2 gap-6">
                ${services.map(service => `
                    <div class="bg-white p-6 rounded-lg shadow-lg border-l-4 border-orange-500">
                        <h3 class="text-xl font-bold text-gray-800">${service}</h3>
                    </div>
                `).join('')}
            </div>

            <section class="galeria">
                <div class="galeria-contenedor">
                    <img src="imagenes/imagen1.png" alt="Imagen 1">
                    <img src="imagenes/imagen2.png" alt="Imagen 2">
                    <img src="imagenes/imagen3.png" alt="Imagen 3">
                    <img src="imagenes/imagen4.png" alt="Imagen 4">
                    <img src="imagenes/imagen5.png" alt="Imagen 5">
                    <img src="imagenes/imagen6.png" alt="Imagen 6">
                </div>
            </section>
        </div>
    `;
}

function renderLoginPage() {
    return `
        <div class="container mx-auto px-4 py-16">
            <div class="max-w-md mx-auto bg-white p-8 rounded-lg shadow-lg">
                <h2 class="text-3xl font-bold mb-6 text-center">Iniciar Sesión</h2>
                <div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-semibold mb-2">Email</label>
                        <input type="email" id="loginEmail" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none" placeholder="tu@email.com">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-semibold mb-2">Contraseña</label>
                        <input type="password" id="loginPassword" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none" placeholder="••••••••">
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Tipo de usuario</label>
                        <select id="loginRole" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                            <option value="cliente">Cliente</option>
                            <option value="admin">Administrador</option>
                        </select>
                    </div>
                    <button onclick="handleLogin()" class="w-full bg-orange-500 text-white py-3 rounded-lg font-bold hover:bg-orange-600 transition">
                        Ingresar
                    </button>
                </div>
            </div>
        </div>
    `;
}

function renderAppointmentPage() {
    return `
        <div class="container mx-auto px-4 py-16">
            <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-lg">
                <h2 class="text-3xl font-bold mb-6 text-center">Solicitar Turno</h2>
                <div>
                    <div class="grid md:grid-cols-2 gap-4 mb-4">
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Nombre completo</label>
                            <input type="text" id="aptName" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                        </div>
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Teléfono</label>
                            <input type="tel" id="aptPhone" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-semibold mb-2">Email</label>
                        <input type="email" id="aptEmail" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                    </div>
                    <div class="grid md:grid-cols-2 gap-4 mb-4">
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Fecha</label>
                            <input type="date" id="aptDate" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                        </div>
                        <div>
                            <label class="block text-gray-700 font-semibold mb-2">Horario</label>
                            <input type="time" id="aptTime" min="09:00" max="17:00" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 font-semibold mb-2">Servicio</label>
                        <select id="aptService" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none">
                            <option>Cambio de aceite</option>
                            <option>Reparación de motor</option>
                            <option>Sistema de inyección</option>
                            <option>Diagnóstico</option>
                            <option>Mantenimiento preventivo</option>
                            <option>Otro</option>
                        </select>
                    </div>
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Descripción del problema</label>
                        <textarea id="aptDescription" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-500 outline-none" rows="4" placeholder="Describa brevemente el motivo de su consulta..."></textarea>
                    </div>
                    <button onclick="handleAppointmentSubmit()" class="w-full bg-orange-500 text-white py-3 rounded-lg font-bold hover:bg-orange-600 transition">
                        Enviar Solicitud
                    </button>
                </div>
            </div>
        </div>
    `;
}

function renderAdminPage() {
    return `
        <div class="container mx-auto px-4 py-16">
            <h1 class="text-4xl font-bold mb-8">Panel de Administración</h1>
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="bg-gray-800 text-white px-6 py-4">
                    <h2 class="text-2xl font-bold">Turnos Solicitados</h2>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="px-6 py-3 text-left">Cliente</th>
                                <th class="px-6 py-3 text-left">Teléfono</th>
                                <th class="px-6 py-3 text-left">Fecha</th>
                                <th class="px-6 py-3 text-left">Hora</th>
                                <th class="px-6 py-3 text-left">Servicio</th>
                                <th class="px-6 py-3 text-left">Estado</th>
                                <th class="px-6 py-3 text-left">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${appointments.map(apt => `
                                <tr class="border-t hover:bg-gray-50">
                                    <td class="px-6 py-4">${apt.name}</td>
                                    <td class="px-6 py-4">${apt.phone}</td>
                                    <td class="px-6 py-4">${apt.date}</td>
                                    <td class="px-6 py-4">${apt.time}</td>
                                    <td class="px-6 py-4">${apt.service}</td>
                                    <td class="px-6 py-4">
                                        <span class="px-3 py-1 rounded-full text-sm ${
                                            apt.status === 'confirmado' ? 'bg-green-200 text-green-800' :
                                            apt.status === 'cancelado' ? 'bg-red-200 text-red-800' :
                                            'bg-yellow-200 text-yellow-800'
                                        }">
                                            ${apt.status}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <select onchange="updateAppointmentStatus(${apt.id}, this.value)" class="border rounded px-2 py-1 text-sm">
                                            <option value="pendiente" ${apt.status === 'pendiente' ? 'selected' : ''}>Pendiente</option>
                                            <option value="confirmado" ${apt.status === 'confirmado' ? 'selected' : ''}>Confirmado</option>
                                            <option value="cancelado" ${apt.status === 'cancelado' ? 'selected' : ''}>Cancelado</option>
                                        </select>
                                    </td>
                                </tr>
                            `).join('')}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    `;
}

function renderFooter() {
    return '';
}

function navigateTo(page) {
    currentPage = page;
    render();
}

function handleLogin() {
    const email = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;
    const role = document.getElementById('loginRole').value;

    const adminUsers = {
        'ramiromagallaness@gmail.com': 'Ramiro123',
        'nachotv.25@gmail.com': 'Nacho123',
        'vitopeluso1@gmail.com': 'Vito123'
    };

    if (!email || !password) {
        alert('Por favor complete todos los campos');
        return;
    }

    if (role === 'admin') {
        if (adminUsers[email] && adminUsers[email] === password) {
            isLoggedIn = true;
            userRole = 'admin';
            currentPage = 'admin';
            render();
        } else {
            alert('Email o contraseña incorrectos para administrador');
        }
    } else {
        isLoggedIn = true;
        userRole = 'cliente';
        currentPage = 'home';
        render();
    }
}

function handleLogout() {
    isLoggedIn = false;
    userRole = null;
    currentPage = 'home';
    render();
}

function handleAppointmentSubmit() {
    const name = document.getElementById('aptName').value;
    const phone = document.getElementById('aptPhone').value;
    const email = document.getElementById('aptEmail').value;
    const date = document.getElementById('aptDate').value;
    const time = document.getElementById('aptTime').value;
    const service = document.getElementById('aptService').value;
    const description = document.getElementById('aptDescription').value;

    if (!name || !phone || !email || !date || !time) {
        alert('Por favor complete todos los campos obligatorios');
        return;
    }

    const [hours] = time.split(':').map(Number);
    if (hours < 9 || hours >= 17) {
        alert('Por favor seleccione un horario entre 9:00 AM y 17:00 PM');
        return;
    }

    appointments.push({
        id: appointments.length + 1,
        name, phone, email, date, time, service, description,
        status: 'pendiente'
    });
    alert('¡Turno solicitado con éxito! Nos pondremos en contacto para confirmar.');
    currentPage = 'home';
    render();
}

function updateAppointmentStatus(id, newStatus) {
    appointments = appointments.map(apt => 
        apt.id === id ? { ...apt, status: newStatus } : apt
    );
    render();
}

function attachEventListeners() {
    // Event listeners están integrados mediante onclick
}

render();