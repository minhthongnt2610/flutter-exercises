const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); // Cho phép đọc body JSON

// Dữ liệu giả lưu trong RAM
let users = [
  { id: 1, name: "Nguyễn Minh Thông", birthdate: "2004-10-26" },
  { id: 2, name: "Trần Thị B", birthdate: "2004-05-22" },
  { id: 3, name: "Lê Văn C", birthdate: "2003-12-15" },
  { id: 4, name: "Phạm Thị D", birthdate: "2002-08-30" },
  { id: 5, name: "Ngô Văn E", birthdate: "2001-01-01" }
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
  const id = Number(req.params.id);
  if (isNaN(id)) return res.status(400).json({ error: "Invalid ID" });

  const user = users.find(u => u.id === id);
  if (!user) return res.status(404).json({ error: "User not found" });

  res.json({ ...user, age: calculateAge(user.birthdate) });
});

// ✅ POST create new user
app.post('/api/users', (req, res) => {
  const { name, birthdate } = req.body;
  if (!name || !birthdate) {
    return res.status(400).json({ error: "Missing name or birthdate" });
  }

  const birthDateObj = new Date(birthdate);
  if (isNaN(birthDateObj.getTime())) {
    return res.status(400).json({ error: "Invalid birthdate format" });
  }

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
  const id = Number(req.params.id);
  const { name, birthdate } = req.body;

  const user = users.find(u => u.id === id);
  if (!user) return res.status(404).json({ error: "User not found" });

  if (name !== undefined) user.name = name;

  if (birthdate !== undefined) {
    const birthDateObj = new Date(birthdate);
    if (isNaN(birthDateObj.getTime())) {
      return res.status(400).json({ error: "Invalid birthdate format" });
    }
    user.birthdate = birthdate;
  }

  res.json(user);
});

// ✅ DELETE user
app.delete('/api/users/:id', (req, res) => {
  const id = Number(req.params.id);
  const index = users.findIndex(u => u.id === id);
  if (index === -1) return res.status(404).json({ error: "User not found" });

  const deletedUser = users.splice(index, 1);
  res.json({ message: "User deleted", user: deletedUser[0] });
});

// ✅ Start server
app.listen(port, () => {
  console.log(`✅ API đang chạy tại: http://192.168.1.65:${port}/api/users`);
});
