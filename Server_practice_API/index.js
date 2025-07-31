const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); // Cho phép đọc body JSON

// Dữ liệu giả lưu trong RAM
let users = [
  { id: 1, name: "Nguyễn Minh Thông", birthdate: "2004-10-26" },
  { id: 2, name: "Trần Thị B", birthdate: "2004-05-22" }
];

// Hàm tính tuổi
function calculateAge(birthdate) {
  const today = new Date();
  const birth = new Date(birthdate);
  let age = today.getFullYear() - birth.getFullYear();
  const m = today.getMonth() - birth.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birth.getDate())) age--;
  return age;
}

// ✅ GET all users
app.get('/api/users', (req, res) => {
  const usersWithAge = users.map(u => ({
    ...u,
    age: calculateAge(u.birthdate)
  }));
  res.json(usersWithAge);
});

// ✅ GET one user by id
app.get('/api/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const user = users.find(u => u.id === id);
  if (!user) return res.status(404).json({ error: "User not found" });
  res.json({ ...user, age: calculateAge(user.birthdate) });
});

// ✅ POST create new user
app.post('/api/users', (req, res) => {
  const { name, birthdate } = req.body;
  if (!name || !birthdate) return res.status(400).json({ error: "Missing name or birthdate" });

  const newUser = {
    id: users.length ? users[users.length - 1].id + 1 : 1,
    name,
    birthdate
  };
  users.push(newUser);
  res.status(201).json(newUser);
});

// ✅ PUT update user
app.put('/api/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const { name, birthdate } = req.body;
  const user = users.find(u => u.id === id);
  if (!user) return res.status(404).json({ error: "User not found" });

  if (name) user.name = name;
  if (birthdate) user.birthdate = birthdate;
  res.json(user);
});

// ✅ DELETE user
app.delete('/api/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const index = users.findIndex(u => u.id === id);
  if (index === -1) return res.status(404).json({ error: "User not found" });

  users.splice(index, 1);
  res.json({ message: "User deleted" });
});

// ✅ Start server
app.listen(port, () => {
  console.log(`REST API đang chạy tại: http://localhost:${port}/api/users`);
});
